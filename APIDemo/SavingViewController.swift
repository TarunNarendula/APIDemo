//
//  SavingViewController.swift
//  APIDemo
//
//  Created by Tarun on 4/30/18.
//  Copyright © 2018 Atirek Sharma. All rights reserved.
//
import Foundation
import ObjectMapper

enum SingletonKeys: String {
    case user = "Custom"
    
}

class UserSingleton {
    static var shared = UserSingleton()
    
    var loggedInUser: Data? {
    get {
        guard let data = UserDefaults.standard.value(forKey: SingletonKeys.user.rawValue) as? [String:Any] else {
            let mappedModel = Mapper<Data>().map(JSON: [:] as! [String:Any])
            return mappedModel
        }
        let mappedModel = Mapper<Data>().map(JSON: data)
        return mappedModel
        } set {
            if let value = newValue {
                UserDefaults.standard.set(value.toJSON(),forKey:SingletonKeys.user.rawValue)
            } else {
                UserDefaults.standard.removeObject(forKey: SingletonKeys.user.rawValue)
            }
        }
}
}
