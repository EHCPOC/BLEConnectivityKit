import Foundation
import CoreBluetooth

public protocol BLEKitCharacteristicDelegate: AnyObject {
    func didUpdateValueForCharacteristic(_ characteristic: CBMutableCharacteristic)
}

public protocol DeviceDataSource {
    var onUpdate: ((Codable) -> Void)? { get set }
    
    func start()
    func stop()
}

public protocol BLEKitPeripheralManagerDelegate: AnyObject {
    func didUpdateState()
    func didAddService(_ service: CBService, error: Error?)
    func didStartAdvertising(error: Error?)
    func didReceiveReadRequest(_ request: CBATTRequest, forCharacteristic characteristic: CBMutableCharacteristic)
}

public protocol BLEKitPeripheralManager {
    var delegate: BLEKitPeripheralManagerDelegate? { get set }
    
    func setup(with dataSource: DeviceDataSource)
    func update(with data: Codable)
}

public class BLEKitPeripheral<T: Codable>: NSObject, BLEKitPeripheralManager, CBPeripheralManagerDelegate {
    
    public var delegate: BLEKitPeripheralManagerDelegate?
    
    public var manager: CBPeripheralManager!
    public var characteristic: CBMutableCharacteristic!
    public let encoder = JSONEncoder()
    
    public var dataSource: DeviceDataSource?
    
    public override init() {
        super.init()
        manager = CBPeripheralManager(delegate: self, queue: nil)
    }
    
    public func setup(with dataSource: DeviceDataSource) {
        self.dataSource = dataSource
        self.dataSource?.onUpdate = { [weak self] data in
            self?.update(with: data)
        }
        self.dataSource?.start()
    }
    
    public func update(with data: Codable) {
        if let payload = try? encoder.encode(data) {
            characteristic.value = payload
            manager.updateValue(payload, for: characteristic, onSubscribedCentrals: nil)
        } else {
            print("error encoding AccelerometerData")
        }
    }
    
    // MARK: CBPeripheralManagerDelegate
    
    public func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        delegate?.didUpdateState()
    }
    
    public func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        delegate?.didAddService(service, error: error)
        if error == nil {
            let advertisementData: [String: Any] = [
                CBAdvertisementDataServiceUUIDsKey: [service.uuid],
                CBAdvertisementDataLocalNameKey: "BLE Sensor"  // This key will not be transmitted when the app is backgrounded
            ]
            manager.startAdvertising(advertisementData)
        }
    }
    
    public func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        delegate?.didStartAdvertising(error: error)
    }
    
    public func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveRead request: CBATTRequest) {
        delegate?.didReceiveReadRequest(request, forCharacteristic: characteristic)
    }
}
