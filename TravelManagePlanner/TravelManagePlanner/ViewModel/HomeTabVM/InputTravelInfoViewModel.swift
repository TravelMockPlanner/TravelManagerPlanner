//
//  InputTravelInfoViewModel.swift
//  TravelManagePlanner
//
//  Created by UY on 2022/02/14.
//

import Foundation

class InputTravelInfoViewModel {
    
   
    private var storedJourneyList = DestiSearchResponse.shared.data {
        didSet {
            storedJourneyList.forEach {
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
        return storedJourneyList.count
    }
    
    func dateCount() -> Int {
        return dateDic.count
    }
    
    func journey(idx: Int) -> DestiSearchResponseData {
        return storedJourneyList[idx]
    }
    
    func passJourneyInfoInDate(index: Int) -> [DestiSearchResponseData] {
        return storedJourneyList.filter{
            if $0.visitDate == dateArr[index] || $0.leaveDate == dateArr[index] {
                return true
            }
            return false
        }
    }
    
    func getData() {
        self.loadingStarted()
        repo.getJourneyDetialList(travelId: detailListIdx) { result in
            switch result {
            case .success(let detailData):
                self.storedJourneyList = detailData.data
                self.dataUpdated()
                self.loadingEnded()
            case .failure(let error):
                self.loadingEnded()
                switch error {
                case .notFoundInDB:
                    self.storedJourneyList = []
                    self.dataUpdated()
                case .unknown:
                    print("알수 없는 오류")
                case .jsonError:
                    print("Json 오류")
                case .invalidArgument:
                    print("매개변수 오류")
                case .badRequest:
                    print("400")
                case .notFound:
                    print("404")
                case .internalServerError:
                    print("repo error")
                case .omittedParams:
                    print("params error")
                case .ommittedHeader:
                    print("header error")
                case .invalidPw:
                    print("Pw error")
                }
            }
        }
    }
}
