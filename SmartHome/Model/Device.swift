//
//  Device.swift
//  SmartHome
//
//  Created by Jacob Perez on 9/28/22.
//

import Foundation

class Device: Codable {
    
    var name: String
    var isOn: Bool
    
    init(name: String, isOn: Bool = false) {
        
    self.name = name
    self.isOn = isOn
        
    }
}

