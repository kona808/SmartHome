//
//  DeviceTableViewCell.swift
//  SmartHome
//
//  Created by Jacob Perez on 9/28/22.
//

import UIKit

protocol DeviceTableViewCellDelegate: AnyObject {
    func markButtonIsOnTapped(_ cell: DeviceTableViewCell)
}

class DeviceTableViewCell: UITableViewCell {

    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var buttonIsOn: UISwitch!
    
    weak var delegate: DeviceTableViewCellDelegate?
    
    func updateView(device: Device) {
        deviceNameLabel.text = device.name
    }
    @IBAction func buttonIsOnTapped(_ sender: Any) {
        delegate?.markButtonIsOnTapped(self)
    }
}
