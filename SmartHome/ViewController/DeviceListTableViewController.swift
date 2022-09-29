//
//  DeviceListTableViewController.swift
//  SmartHome
//
//  Created by Jacob Perez on 9/28/22.
//

import UIKit

class DeviceListTableViewController: UITableViewController, DeviceTableViewCellDelegate {
    func markSwitchIsOnToggled(_ cell: DeviceTableViewCell) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DeviceController.shared.devices.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "deviceCell", for: indexPath) as? DeviceTableViewCell else { return UITableViewCell() }
        let device = DeviceController.shared.devices[indexPath.row]
        /// Configure the cell...
        cell.updateView(device: device)
        cell.delegate = self
        return cell
    }
    private func presentNewDeviceAlertController() {
        let alertController = UIAlertController(title: "New Device", message: "Name your new device.", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "New Device Name"
        }
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(dismissAction)
        let confirmAction = UIAlertAction(title: "Name", style: .default) { _ in
            guard let contentTextField = alertController.textFields?.first,
                    let content = contentTextField.text  else { return }
            DeviceController.shared.create(name: content)
            self.tableView.reloadData()
        }
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }
    
    

    @IBAction func addButtonTapped(_ sender: Any) {
        presentNewDeviceAlertController()
    }
}
