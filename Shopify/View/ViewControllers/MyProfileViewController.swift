//
//  MyProfileViewController.swift
//  Shopify
//
//  Created by Omar Ahmed on 16/03/2022.
//

import UIKit

class MyProfileViewController: UIViewController {

    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self

    }
    
    @IBAction func editProfileAction(_ sender: Any) {
    }
    

    @IBAction func logOutAction(_ sender: Any) {
    }
    

}


extension MyProfileViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title:String?
        switch section {
        case 0:
            title="My Account"
        case 1:
            title="Settings"
        default:
            title="About"
        }
        return title
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 1
        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.imageView?.image=UIImage(systemName: "bag")
                cell.imageView?.tintColor = .label
                cell.textLabel?.text="My Orders"
                cell.accessoryType = .disclosureIndicator
            default:
                cell.imageView?.image=UIImage(systemName: "heart")
                cell.textLabel?.text="My Wishlist"
                cell.imageView?.tintColor = .label
                cell.accessoryType = .disclosureIndicator

            }
        case 1:
            switch indexPath.row {
            default:
                cell.imageView?.image=UIImage(systemName: "homekit")
                cell.textLabel?.text="My Addresses"
                cell.imageView?.tintColor = .label
                cell.accessoryType = .disclosureIndicator
            }
            
        default:
            switch indexPath.row {
            case 0:
                cell.imageView?.image=UIImage(systemName: "info.circle")
                cell.textLabel?.text="About us"
                cell.imageView?.tintColor = .label
                cell.accessoryType = .disclosureIndicator
            default:
                cell.imageView?.image=UIImage(systemName: "mail")
                cell.textLabel?.text="Contact us"
                cell.imageView?.tintColor = .label
                cell.accessoryType = .disclosureIndicator
            }
            
        }
        
        return cell
    }
    
    
}
