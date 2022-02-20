//
//  InputTravelInfoViewModel.swift
//  TravelManagePlanner
//
//  Created by UY on 2022/02/14.
//

import Foundation

class InputTravelInfoViewModel {
    
    private var storedJourneyList = InputTravelInfoData.shared {
        didSet {
            storedJourneyList.storedTravelInfo.forEach {
                self.dateDic[$0.visitDate] = true
                self.dateDic[$0.leaveDate] = true
            }
            dateArr = dateDic.sorted{ $0.key < $1.key }.map{ $0.key }
        }
    }
    
    private var repo = JourneyListRepository()
    
    var detailListIdx = Int.max
    
    private var dateDic = [String: Bool]()
    private var dateArr = [String]()
    
    var loadingStarted: (() -> ()) = { }
    var loadingEnded: (() -> ()) = { }
    var dataUpdated: (() -> ()) = { }
    var failedJourneyListUpdate: (() -> ()) = { }
    
    func count() -> Int {
        return storedJourneyList.storedTravelInfo.count
    }
    
    func dateCount() -> Int {
        return dateDic.count
    }
    
    func journey(idx: Int) -> StoredTravelInfoData {
        return storedJourneyList.storedTravelInfo[idx]
    }
    
    func passJourneyInfoInDate(index: Int) -> [StoredTravelInfoData] {
        return storedJourneyList.storedTravelInfo.filter {
            if $0.visitDate == dateArr[index] || $0.leaveDate == dateArr[index] {
                return true
            }
            return false
        }
    }
    
    func getData() {
        //storedJourneyList.storedTravelInfo
    }
}
