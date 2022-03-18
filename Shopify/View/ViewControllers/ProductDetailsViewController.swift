//
//  ProductDetailsViewController.swift
//  Shopify
//
//  Created by Islam Noureldin on 15/03/2022.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    var product : Product?
    @IBOutlet weak var productDescription: UITextView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var imageControl: UIPageControl!
    @IBOutlet weak var addToCart: UIButton!
    @IBOutlet weak var productDetailsCollectionView: UICollectionView!
    @IBAction func addToCartBtn(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, delay: 0,
                       usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1,
                       options: [], animations: {
                        self.addToCart.transform =
                           CGAffineTransform(scaleX: 2.0, y: 2.0)
                        self.addToCart.transform =
                           CGAffineTransform(scaleX: 1.0, y: 1.0)
                    }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupImageCollection()
       setupImageControl()
        updateUi()
    }
    
    private func setupImageCollection(){
        productDetailsCollectionView.dataSource = self
        productDetailsCollectionView.delegate = self
        productDetailsCollectionView.register(ProductDetailsImageCollectionCell.nib(), forCellWithReuseIdentifier: ProductDetailsImageCollectionCell.identifier)
    }
    
    private func setupImageControl(){
        guard let product = product,let images = product.images else{return}
        imageControl.currentPage = 0
        imageControl.numberOfPages = images.count
    }

    private func updateUi(){
        guard let product = product ,let variant = product.variants, let price = variant[0].price else{return}
        productDescription.text = product.body_html
        productTitleLabel.text = product.title
        productPriceLabel.text = price + " USD"
    }
}

extension ProductDetailsViewController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        imageControl.currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let product = product,let images = product.images else{return 0}
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productDetailsCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailsImageCollectionCell.identifier, for: indexPath) as! ProductDetailsImageCollectionCell
        guard let product = product,let images = product.images else{return UICollectionViewCell()}
        productDetailsCell.productImageDetails.kf.setImage(with: URL(string: images[indexPath.row].src ?? "test"), placeholder: UIImage(named: "test"))
        return productDetailsCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width*0.95, height: view.frame.width*0.65)
    }
    
}