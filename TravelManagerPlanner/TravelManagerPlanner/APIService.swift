//
//  APIService.swift
//  TravelManagerPlanner
//
//  Created by UY on 2021/12/25.
//

import Foundation
import UIKit
import Alamofire

class APIService: NSObject {
    let url = "http://cutely93.cafe24.com:19624/"
    
    func get() {
        AF.request(url, method: .get, parameters: nil, headers: nil, interceptor: nil).validate(statusCode: 0..<400).responseJSON { response in
            print(response)
        }
    }
    
    func post() {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        let params = ["userId":"id", "userPw":"pw", "name":"name"]
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("body Error")
        }
        AF.request(request).responseString { response in
            switch response.result {
            case .success:
                print("success")
            case .failure:
                print("failure")
            }
        }
    }
}
