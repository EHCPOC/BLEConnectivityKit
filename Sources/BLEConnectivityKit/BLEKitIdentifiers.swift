//
//  File.swift
//  
//
//  Created by Rammoorthy on 04/11/23.
//

import Foundation
import CoreBluetooth

public struct BLEIdentifiers {
    static let serviceIdentifier = "0000180F-0000-1000-8000-00805f9b34fb"
    static let characteristicIdentifier = "00002A19-0000-1000-8000-00805f9b34fb"
    
    //MARK: - Base Identifier formats
    var baseUUIDFormat  : String =  "EF68%@-9B35-4933-9B10-52FFA9740042"

    //MARK: - SecureDFU Service UUIDs
   func getLegacyDFUServiceUUID() -> CBUUID {
        return CBUUID(string: "00001530-1212-EFDE-1523-785FEABCD123")
    }

   func getSecureDFUServiceUUID() -> CBUUID {
        return CBUUID(string: "FE59")
    }

    //MARK: - Jump to bootloader

   func getNewJumpToBootloaderCharacteristicUUID() -> CBUUID {
        return CBUUID(string:"8EC90003-F315-4F60-9FB8-838830DAEA50")
    }

   func getJumpToBootloaderCharacteristicUUID() -> CBUUID {
        return CBUUID(string:"8EC90001-F315-4F60-9FB8-838830DAEA50")
    }

    //MARK: - ConfigurationService UUIDs
    func getConfigurationServiceUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0100")
    }

    func getDeviceNameCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0101")
    }

    func getAdvertisingparamtersCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0102")
    }

    func getAppearanceCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0103")
    }

    func getConnectionParametersCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0104")
    }

    func getEddystoneURLCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0105")
    }

    func getCloudTokenCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0106")
    }

    func getFirmwareVersionCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0107")
    }

    func getMTUCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0108")
    }

    func getNFCTagContentCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0109")
    }

    //MARK: - EnvironmentService UUIDs
    func getEnvironmentServiceUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0200")
    }

    func getTemperatureCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0201")
    }

    func getPressureCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0202")
    }

    func getHumidityCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0203")
    }

    func getAirQualityCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0204")
    }

    func getLightIntensityCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0205")
    }

    func getEnvironmentConfigurationCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0206")
    }

    //MARK: - Battery UUIDs
   func getBatteryServiceUUID() -> CBUUID {
        return CBUUID(string: "180F")
    }

    func getBatteryLevelCharacteristicUUID() -> CBUUID {
        return CBUUID(string: "2A19")
    }

    //MARK: - UserInterfaceService UUIDs
    func getUIServiceUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0300")
    }

    func getLEDCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0301")
    }

    func getButtonCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0302")
    }

    //MARK: - MotionService UUIDs
    func getMotionServiceUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0400")
    }

    func getMotionConfigurationCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0401")
    }

   func getTapCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0402")
    }

   func getOrientationCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0403")
    }

   func getQuaternionCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0404")
    }

   func getPedometerCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0405")
    }

   func getRawDataCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0406")
    }

   func getEulerCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0407")
    }

   func getRotationMatrixCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0408")
    }

   func getHeadingCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0409")
    }

   func getGravityVectorCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "040A")
    }

    //MARK: - SoundService UUIDs
   func getSoundServiceUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0500")
    }

   func getSoundConfigurationCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0501")
    }

   func getSpeakerCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0502")
    }

   func getSpeakerStatusCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0503")
    }

   func getMicrophoneCharacteristicUUID() -> CBUUID {
        return getUUIDString(withBaseFormat: baseUUIDFormat, andIdentifier: "0504")
    }

    //MARK: - UUID generation helper
    func getUUIDString(withBaseFormat aBaseFormat: String, andIdentifier anIdentifier: String) -> CBUUID {
        let uuidString = String(format: aBaseFormat, anIdentifier)
        return CBUUID(string: uuidString)
    }

    //MARK: - ReadableName helper
    func getReadableName(forUUID aUUID : CBUUID) -> String {
        if aUUID == getBatteryServiceUUID() {
            return "Thingy Battery Service"
        }
        if aUUID == getUIServiceUUID() {
            return "Thingy UI Service"
        }
        if aUUID == getMotionServiceUUID() {
            return "Thingy Motion Service"
        }
        if aUUID == getSoundServiceUUID() {
            return "Thingy Sound Service"
        }
        if aUUID == getEnvironmentServiceUUID() {
            return "Thingy Environment Service"
        }
        if aUUID == getConfigurationServiceUUID() {
            return "Thingy Configuration Service"
        }
        return "Unknown Thingy Service"
    }

    //MARK: - ThingyServices
    /// Returns a list of UUIDs of services that are in Thingy's advertising packet.
    func getThingyServices(includingInDfuState include: Bool) -> [CBUUID] {
        if include == false {
            return [getConfigurationServiceUUID()]
        } else {
            return [getConfigurationServiceUUID(), getSecureDFUServiceUUID()]
        }
    }

    /// Returns a list of UUIDs of Thingy's services.
    func getAllThingyServices() -> [CBUUID] {
        return [
            getConfigurationServiceUUID(),
            getEnvironmentServiceUUID(),
            getUIServiceUUID(),
            getMotionServiceUUID(),
            getSoundServiceUUID(),
            getSecureDFUServiceUUID(),
            getBatteryServiceUUID()
        ]
    }

}


