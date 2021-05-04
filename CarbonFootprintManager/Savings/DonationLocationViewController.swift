//
//  DonationLocationViewController.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 5/3/21.
//

import UIKit

class DonationLocationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    var indexPress = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Location.DONOS.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .detailButton
        cell.textLabel!.text = "\(Location.DONOS[indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPress = indexPath.row
        
        let alert = UIAlertController(title: "\(Location.DONOS[indexPress])", message: "\(Information.DONOS[indexPress])", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Go There!", style: .default, handler: { [self] (alert) in
            if Information.DONO_LINK[self.indexPress] != nil {
                let url = URL(string: Information.DONO_LINK[self.indexPress])!
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                return
            }
        }))
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    }

}
