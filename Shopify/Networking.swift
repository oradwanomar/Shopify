//
//  Networking.swift
//  Shopify
//
//  Created by Nasr on 14/03/2022.
//

import Foundation
import Alamofire

class Networking{
    
    static var shared = Networking()
}

extension Networking{
    
    func getAllBrands(complition: @escaping (BrandsModel?, Error?)->Void){
        
        guard let url = URLs.shared.getAllBrandsURl() else {return}
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response { res in
            switch res.result{
            case .failure(let error):
                print("error")
                complition(nil, error)
            case .success(_):
                guard let data = res.data else { return }
                do{
                    let json = try JSONDecoder().decode(BrandsModel.self, from: data)
                    complition(json, nil)
                    print("success to get all brands")
                }catch let error{
                    print("error when get All brands")
                    complition(nil, error)
                }
            }
        }
    }
    
    
    func getAllProductsInCategory(complition: @escaping (Products?,Error?)->Void,collectionID:Int){
        
        guard let url = URLs.shared.filterProductsByMainCategory(collectionId:collectionID) else {return}
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response {
            result in
            switch result.result {
            case .failure(let error):
                complition(nil,error)
            case .success(_):
                guard let data = result.data else {return}
                do{
                    let json = try JSONDecoder().decode(Products.self, from: data)
                    complition(json, nil)
                    print("Success")
                    
                }catch let error{
                    complition(nil, error)
                }
            
            }
        }
    }
    
    
}

