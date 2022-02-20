//
//  InputTravelInfoPageViewModel.swift
//  TravelManagePlanner
//
//  Created by UY on 2022/02/20.
//

import Foundation
import UIKit

class TravelInputListDetailPageViewModel {
    
    private var journeyDetailList = [StoredTravelInfoData]() {
        didSet{
            journeyDetailList.forEach {
                if categoryDic[$0.category] == nil {
                    categoryDic[$0.category] = [$0]
                } else {
                    var journetList = categoryDic[$0.category]!
                    journetList.append($0)
                    categoryDic[$0.category] = journetList
                }
            }
        }
    }
    
    var loadingStarted: (() -> ()) = { }
    var loadingEnded: (() -> ()) = { }
    var dataUpdated: (() -> ()) = { }
    var failedJourneyListUpdate: (() -> ()) = { }
   
    var categoryDic = [String: [StoredTravelInfoData]]()
    var categoryInOrder = ["1","2","3"] // category 바꿔야함 - 숙박, 여가, 음식점
    
    func journey(idx: Int) -> StoredTravelInfoData {
        return journeyDetailList[idx]
    }
                
    func destination(idx: Int) -> String {
        return journeyDetailList[idx].sIdx
    }
    
    func categoriesCount() -> Int {
        return categoryDic.count
    }
    
    func countInSectionItems(idx: Int) -> Int {
        return categoryDic.filter{ $0.key == categoryInOrder[idx] }.count
    }
    
    func getImage() -> UIImage {
        var img = UIImage(named: "Seoul1")!
        ImageLoader.loadImage(url: self.journeyDetailList[0].imgUrl) { image in
            if let image = image {
                img = image
            }
        }
        return img
    }
    
    func getList(journeyDetailDataFromPageCollectionView: [StoredTravelInfoData]) {
        self.journeyDetailList = journeyDetailDataFromPageCollectionView
        self.dataUpdated()
    }
}

