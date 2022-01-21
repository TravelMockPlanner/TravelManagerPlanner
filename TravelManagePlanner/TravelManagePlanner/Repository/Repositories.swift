//
//  Repositories.swift
//  TravelManagePlanner
//
//  Created by UY on 2022/01/20.
//

import Foundation
import Alamofire

class DestinationInfoRepositories: NSObject {

    private let httpClient = HttpClient(baseUrl: "https://eunryuplaners.com:19624")
    private var params = ""


    func getDestinationDetail(completed: @escaping (DestinationDetailData) -> Void) {
        httpClient.getJson(path: "/plan/getAllShopList.tpi") { [self] result in
            
            if let json = try? result.get() {
                //completed(parseDestinationData(jsonObjext: self.JSONObject(json)))
            }
            
            
//            if let json = try? result.get() {
//                completed(self.parseLecture(jsonObject: self.JSONObject(json)))
            }
        }

    private func JSONObject(_ json: String) -> [String: Any] {
        let data = json.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        return jsonObject
    }
    
}
