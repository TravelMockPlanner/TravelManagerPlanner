//
//  InputTravelInfoRepository.swift
//  TravelManagePlanner
//
//  Created by UY on 2022/02/17.
//

import Foundation

class InputTravelInfoRepository {
    private let httpClient = HttpClient(baseUrl: "https://eunryuplaners.com:19624")
    
    func inputTravelInfo(completed: @escaping () -> Void) {
        let path = URLManager.Main.inputTravelInfo
        let params = []
    }
}
