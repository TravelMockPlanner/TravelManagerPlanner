//
//  SharedManagerKit.swift
//  Pods
//
//  Created by 은아월 on 2017. 4. 10..
//
//

import Foundation
import UIKit

class SharedManagerKit {
    
    let sharedPreference = UserDefaults.standard
    
    public static let shared = SharedManagerKit()
    init() {
        
    }
    
    // MARK : String
    func setString(key: String, data: String) {
        sharedPreference.set(data, forKey: key)
        sharedPreference.synchronize()
    }
    
    func getString(key: String) -> String {
        return sharedPreference.string(forKey: key)!
    }
    
    // MARK : Boolean
    func setBoolean(key: String, data: Bool) {
        sharedPreference.set(data, forKey: key)
        sharedPreference.synchronize()
    }
    
    func getBoolean(key: String) -> Bool {
        return sharedPreference.bool(forKey: key)
    }
    
    // MARK : Int
    func setInt(key: String, data: Int) {
        sharedPreference.set(data, forKey: key)
        sharedPreference.synchronize()
    }
    
    func getInt(key: String) -> Int {
        return sharedPreference.integer(forKey: key)
    }
    
    // MARK: Array
    func setArray(key: String, data: [Any]) {
        sharedPreference.set(data, forKey: key)
        sharedPreference.synchronize()
    }
    
    func getArray(key: String) -> [Any]? {
        return sharedPreference.array(forKey: key)
    }
    
    // MARK : NSDictionary
    func setDictionary(key: String, data: [String:Any]) {
        sharedPreference.set(data, forKey: key)
        sharedPreference.synchronize()
    }
    
    func getDictionary(key: String) -> [String:Any]? {
        return sharedPreference.dictionary(forKey: key)
    }
}
