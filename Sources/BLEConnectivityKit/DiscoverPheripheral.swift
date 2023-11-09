//
//  File.swift
//  
//
//  Created by Rammoorthy on 04/11/23.
//

import Foundation
import CoreBluetooth

public class BLEKitDiscoveredPeripheral: Identifiable {
    public var peripheral: CBPeripheral
    public var rssi: NSNumber
    public var advertisementData: [String: Any]
    
    public init(peripheral: CBPeripheral, rssi: NSNumber, advertisementData: [String: Any]) {
        self.peripheral = peripheral
        self.rssi = rssi
        self.advertisementData = advertisementData
    }
}

