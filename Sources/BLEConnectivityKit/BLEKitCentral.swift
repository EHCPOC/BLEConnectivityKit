
import Foundation
import CoreBluetooth

public class BLECentral<T: Codable>: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    public var manager: CBCentralManager!
    public var discoveredPeripherals = [BLEKitDiscoveredPeripheral]()
    private var connectedPeripheral: CBPeripheral?
    private let decoder = JSONDecoder()
    
    public var onDiscovered: (() -> Void)?
    public var onDataUpdated: ((Codable) -> Void)?
    public var onConnected: (() -> Void)?
    
    let identifiers = BLEIdentifiers()
    public override init() {
        super.init()
        manager = CBCentralManager(delegate: self, queue: nil)
    }
    
    public func scanForPeripherals() {
        let options: [String: Any] = [CBCentralManagerScanOptionAllowDuplicatesKey: false]
        manager.scanForPeripherals(withServices: [identifiers.getConfigurationServiceUUID()], options: options)
    }
    
    public func connect(at index: Int) {
        guard index >= 0, index < discoveredPeripherals.count else { return }
        
        manager.stopScan()
        manager.connect(discoveredPeripherals[index].peripheral, options: nil)
    }
    
    // MARK: - CBCentralManagerDelegate
    
    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            scanForPeripherals()
        } else {
            print("central is unavailable: \(central.state.rawValue)")
        }
    }
    
    public func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if let existingPeripheral = discoveredPeripherals.first(where: {$0.peripheral == peripheral}) {
            existingPeripheral.advertisementData = advertisementData
            existingPeripheral.rssi = RSSI
        } else {
            discoveredPeripherals.append(BLEKitDiscoveredPeripheral(peripheral: peripheral, rssi: RSSI, advertisementData: advertisementData))
        }
        onDiscovered?()
    }
    
    public func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("central did connect")
        connectedPeripheral = peripheral
        connectedPeripheral?.delegate = self
        connectedPeripheral?.discoverServices([CBUUID(string: identifiers.getBatteryServiceUUID().uuidString)])
        onConnected?()
    }
    
    public func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("central did fail to connect")
    }
    
    // MARK: - CBPeripheralDelegate
    
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let error = error {
            print("peripheral failed to discover services: \(error.localizedDescription)")
        } else {
            peripheral.services?.forEach({ (service) in
                print("service discovered: \(service)")
                peripheral.discoverCharacteristics([CBUUID(string: identifiers.getBatteryLevelCharacteristicUUID().uuidString)], for: service)
            })
        }
    }
    
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let error = error {
            print("peripheral failed to discover characteristics: \(error.localizedDescription)")
        } else {
            service.characteristics?.forEach({ (characteristic) in
                print("characteristic discovered: \(characteristic)")
                if characteristic.properties.contains(.notify) {
                    peripheral.setNotifyValue(true, for: characteristic)
                } else if characteristic.properties.contains(.read) {
                    peripheral.readValue(for: characteristic)
                }
                peripheral.discoverDescriptors(for: characteristic)
            })
        }
    }
    
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverDescriptorsFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error {
            print("peripheral failed to discover descriptor: \(error.localizedDescription)")
        } else {
            characteristic.descriptors?.forEach({ (descriptor) in
                print("descriptor discovered: \(descriptor)")
                peripheral.readValue(for: descriptor)
            })
        }
    }
    
    public func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error {
            print("peripheral error updating value for characteristic: \(error.localizedDescription)")
        } else {
            print("descriptor value updated: \(characteristic)")
            if let value = characteristic.value {
                if let accelerometerData = try? decoder.decode(T.self, from: value) {
                    print(accelerometerData)
                    onDataUpdated?(accelerometerData)
                }
            }
        }
    }
    
    public func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor descriptor: CBDescriptor, error: Error?) {
        if let error = error {
            print("peripheral error updating value for descriptor: \(error.localizedDescription)")
        } else {
            print("descriptor value updated: \(descriptor)")
        }
    }
}
