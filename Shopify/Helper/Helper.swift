//
//  Helper.swift
//  Shopify
//
//  Created by Nasr on 18/03/2022.
//

import Foundation

class Helper{
    static let shared = Helper()
    
    func setUserStatus(userIsLogged: Bool){
        UserDefaults.standard.set(userIsLogged, forKey: "User_Status")
    }
    
    func getUserStatus()-> Bool{
        return UserDefaults.standard.bool(forKey: "User_Status")
    }
}