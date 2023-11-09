//
//  File.swift
//  
//
//  Created by Rammoorthy on 04/11/23.
//

import Foundation
public enum BLEError: Error {
    case unknown
    case invalidParameters
    case invalidHandle
    case readNotPermitted
    case writeNotPermitted
    case invalidPDU
    case insufficientAuthentication
    case requestNotSupported
    case peripheralManagerIsAdvertising
    case peripheralManagerIsNotAdvertising
    case restoredStateServicesNotConfigured
    case centralManagerStateUnknown
    case centralManagerStateResetting
    case centralManagerStateUnsupported
    case centralManagerStateUnauthorized
    case centralManagerStatePoweredOff
    case centralManagerStatePoweredOn
    case connectionTimeout
    case connectionFailed
    case peripheralDisconnected
    case peripheralConnectionTerminated
    case peripheralConnectionFailed
    
    var description: String {
        switch self {
        case .unknown:
            return "An unknown error occurred."
        case .invalidParameters:
            return "Invalid parameters were provided."
        case .invalidHandle:
            return "Invalid attribute handle."
        case .readNotPermitted:
            return "Read operation is not permitted."
        case .writeNotPermitted:
            return "Write operation is not permitted."
        case .invalidPDU:
            return "Invalid Protocol Data Unit received."
        case .insufficientAuthentication:
            return "Insufficient authentication for the operation."
        case .requestNotSupported:
            return "Requested operation is not supported."
        case .peripheralManagerIsAdvertising:
            return "Peripheral manager is already advertising."
        case .peripheralManagerIsNotAdvertising:
            return "Peripheral manager is not advertising."
        case .restoredStateServicesNotConfigured:
            return "Restored state services are not configured."
        case .centralManagerStateUnknown:
            return "Central manager state is unknown."
        case .centralManagerStateResetting:
            return "Central manager is resetting."
        case .centralManagerStateUnsupported:
            return "Bluetooth is unsupported on this device."
        case .centralManagerStateUnauthorized:
            return "App is not authorized to use Bluetooth."
        case .centralManagerStatePoweredOff:
            return "Bluetooth is powered off."
        case .centralManagerStatePoweredOn:
            return "Bluetooth is powered on and available."
        case .connectionTimeout:
            return "Connection attempt timed out."
        case .connectionFailed:
            return "Connection attempt failed."
        case .peripheralDisconnected:
            return "Peripheral disconnected unexpectedly."
        case .peripheralConnectionTerminated:
            return "Connection to peripheral terminated."
        case .peripheralConnectionFailed:
            return "Connection to peripheral failed."
        }
    }
}
