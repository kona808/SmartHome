//
//  DeviceController.swift
//  SmartHome
//
//  Created by Jacob Perez on 9/28/22.
//

import Foundation

class DeviceController {
    
    static let shared = DeviceController()
    
    private(set) var devices: [Device] = []
    
    private var deviceURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let url = documentsDirectory.appendingPathComponent("devices.json")
        return url
    }
        func create(name: String) {
            let newDevice = Device(name: name)
            devices.append(newDevice)
        }
        func togglesOn(name: Device) {
            name.isOn.toggle()
            DeviceController.shared.saveDevice()
        }
        func saveDevice() {
            // 1. Get the address to save a file to
            guard let deviceURL = deviceURL else { return }
            do {
                // 2. Convert the swift class into JSON data
                let deviceData = try JSONEncoder().encode(devices)
                // 3. Save the data to the URL from step 1
                try deviceData.write(to: deviceURL)
            } catch {
                print("Error Saving Messages", error)
            }
        }
        /// Loads  messages that are persist to the local disk updates the model controllers `devices` property
        func loadDevice() {
            // 1. Get the address to save a file to
            guard let deviceURL = deviceURL else { return }
            do {
                // 2. Load the raw data from the url
                let deviceData = try Data(contentsOf: deviceURL)
                // 3. Convert the raw data into our Swift class
                let devices = try JSONDecoder().decode([Device].self, from: deviceData)
                self.devices = devices
            } catch {
                print("Error Loading Messages", error)
            }
        }
} // End of class

