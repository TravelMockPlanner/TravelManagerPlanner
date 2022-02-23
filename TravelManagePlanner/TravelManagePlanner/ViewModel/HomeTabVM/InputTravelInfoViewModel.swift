//
//  InputTravelInfoViewModel.swift
//  TravelManagePlanner
//
//  Created by UY on 2022/02/14.
//

import Foundation

class InputTravelInfoViewModel {
    
    private var storedJourneyList = HomeTabViewModel.globalHomeTabData {
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
    func getAllDate(idx: Int) -> String {
        return dateArr[idx]
    }
    func journey(idx: Int) -> StoredTravelInfoData {
        return storedJourneyList.storedTravelInfo[idx]
    }
    
    func passJourneyInfoInDate(index: Int) -> [JourneyDetailData] {
        var journeyDetailArr = [JourneyDetailData]()
        storedJourneyList.storedTravelInfo.forEach {
            if $0.visitDate == dateArr[index] || $0.leaveDate == dateArr[index] {
                journeyDetailArr.append(JourneyDetailData(imgUrl: $0.imgUrl, name: $0.name, idx: Int($0.sIdx)!, category: $0.category, content: $0.content, sIdx: Int($0.sIdx)!, leaveData: $0.leaveDate, address: $0.address, visitDate: $0.visitDate))
            }
        }
        
        return journeyDetailArr
    }
    
    func getDateCount() {
        print("장바구니 진입할 때 ")
        storedJourneyList.storedTravelInfo.forEach {
            self.dateDic[$0.visitDate] = true
            self.dateDic[$0.leaveDate] = true
        }
        dateArr = dateDic.sorted{ $0.key < $1.key }.map{ $0.key }
    }
    
    func postTravelInfo() {
        
    }
}
