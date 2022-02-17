//
//  InputTravelInfoData.swift
//  TravelManagePlanner
//
//  Created by UY on 2022/02/17.
//

import Foundation

struct InputTravelInfoData: Codable {
    static var shared = InputTravelInfoData(storedTravelInfo: [], inputTravelInfo: HomeTabRequest.shared)
    var storedTravelInfo: [StoredTravelInfoData]
    var inputTravelInfo: HomeTabRequest
    
}

struct StoredTravelInfoData: Codable {
    static var shared = StoredTravelInfoData(visitDate: "", leaveDate: "", imgUrl: "", address: "", sIdx: "", name: "", category: "", content: "")
    
    var visitDate: String
    var leaveDate: String
    var imgUrl: String
    var address: String
    var sIdx: String
    var name: String
    var category: String
    var content: String
    
}
