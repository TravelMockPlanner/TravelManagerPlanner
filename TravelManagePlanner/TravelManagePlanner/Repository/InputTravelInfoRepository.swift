//
//  InputTravelInfoRepository.swift
//  TravelManagePlanner
//
//  Created by UY on 2022/02/17.
//

import Foundation
import Alamofire

class InputTravelInfoRepository {
    private let httpClient = HttpClient(baseUrl: "https://eunryuplaners.com:19624")
    
    func inputTravelInfo(completed: @escaping () -> Void) {
        
        let finalData = HomeTabViewModel.globalHomeTabData.inputTravelInfo
        
        let path = URLManager.Main.inputTravelInfo
        let params: [String : Any] = [
            "uKey": UserData.shared.userKey,
            "title": finalData.title,
            "startDate": finalData.startDate,
            "endDate": finalData.endDate,
            "inviteNum": finalData.inviteNum,
            "price": finalData.price,
            "theme": finalData.theme,
            "shopList": finalData.shopList
        ]
        let encode = try! JSONEncoder().encode(finalData)
        let s = String(data: encode, encoding: .utf8)
        
        httpClient.getJsonData(path: path, params: ["jsonString": "h"]) { result in
            let data = try! result.get()
            print(String(data: data, encoding: .utf8))
        }
        
        
    }
}
