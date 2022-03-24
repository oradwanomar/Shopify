//
//  CheckoutViewController.swift
//  Shopify
//
//  Created by Islam Noureldin on 21/03/2022.
//

import UIKit
import CoreData

class CheckoutViewController: UIViewController {

    @IBOutlet weak var checkoutTableView: UITableView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var deliveryTimeLAbel: UILabel!
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var copounLabel: UILabel!
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var copoun : String?
    var paymentMethod : String?
    var orders : [OrderItemModel]?
    let checkoutViewModel = CheckoutViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkoutTableView.dataSource = self
        checkoutTableView.delegate = self
        checkoutTableView.register(OrdersTVC.nib(), forCellReuseIdentifier: OrdersTVC.identifier)
        self.setAddress()
        guard let copoun = copoun else {
            return
        }
        discountLabel.text = copoun
        copounLabel.text = copoun  + " discount"
        guard let paymentMethod = paymentMethod else {
            return
        }
        paymentLabel.text = paymentMethod
    }
    
    @IBAction func toCart(_ sender: Any) {
    }
}
extension CheckoutViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let checkoutCell = tableView.dequeueReusableCell(withIdentifier: OrdersTVC.identifier) as! OrdersTVC
        checkoutCell.addButton.isHidden = true
        checkoutCell.subButton.isHidden = true
        checkoutCell.quantityLabel.isHidden = true
        checkoutCell.addToWishlist.isHidden = true
        checkoutCell.deleteProductBtn.isHidden = true
        return checkoutCell
    }
}

extension CheckoutViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height*0.4
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension CheckoutViewController{
    func setAddress(){
        checkoutViewModel.getSelectedAddress { selectedAddress, error in
            guard let selectedAddress = selectedAddress, error == nil else { return }
            self.addressLabel.text = selectedAddress.address1
            self.cityLabel.text = selectedAddress.city
            self.countryLabel.text = selectedAddress.country
            self.phoneNumberLabel.text = selectedAddress.phoneNumber
        }
    }
}
