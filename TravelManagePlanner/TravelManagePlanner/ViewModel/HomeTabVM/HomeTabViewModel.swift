//
//  ThemeViewModel.swift
//  TravelManagePlanner
//
//  Created by YoonDaeSung on 2022/02/05.
//

import Foundation

class HomeTabViewModel {
    
    // 모델 소유
    static var globalHomeTabData = InputTravelInfoData.shared
    
    private var pendingStoredTravelData = StoredTravelInfoData(visitDate: "", leaveDate: "", imgUrl: "", address: "", sIdx: "", name: "", category: "", content: "")
    //HomeTabRequest(uKey: "", title: "", startDate: "", endDate: "", inviteNum:"", price: "", theme: "", shopList: [])
    
    // repository 소유
    private var repo = HomeTabRepository()
    
    // 상태 정의
    private var isLoading: Bool = false
    var loadingStarted: (() -> ()) = { }
    var loadingEnded: (() -> ()) = { }
    var dataUpdated: (() -> ()) = { }
    var failedJourneyListUpdate: (() -> ()) = { }
    
    func updateGloblaHomeTabeData(data: DestiSearchResponseData) {
        let newStoredData = StoredTravelInfoData(visitDate: "", leaveDate: "", imgUrl: data.imgUrl, address: data.address, sIdx: String(data.idx), name: data.name, category: data.category, content: data.content)
        
        pendingStoredTravelData = newStoredData
    }
    func updateCartData(vDate: String, leaveDate: String) {
        pendingStoredTravelData.visitDate = vDate
        pendingStoredTravelData.leaveDate = leaveDate
        HomeTabViewModel.globalHomeTabData.storedTravelInfo.append(pendingStoredTravelData)
    }
    // 테마 데이터 업데이트
    func updateThemeData(theme: String, uKey: String) {
        // 디비에 넣을 데이터로변경
        var changeTheme = theme
        switch theme {
        case "커플":
            changeTheme = "couple"
        case "가족":
            changeTheme = "family"
        case "우정":
            changeTheme = "friend"
        default:
            changeTheme = "etc"
        }
        
        HomeTabViewModel.globalHomeTabData.inputTravelInfo.theme = changeTheme
        HomeTabViewModel.globalHomeTabData.inputTravelInfo.uKey = uKey // 유저키 받는부분 추후 설정필요
    }
    
    
    
    // 숙박, 맛집, 놀거리 설정 업데이트
    func updateRecommendData(shopList: [HomeTabRequestData]) {
        HomeTabViewModel.globalHomeTabData.inputTravelInfo.shopList.append(contentsOf: shopList)
#if DEBUG
        print("accomoShopData", shopList)
        print("all Data: ", HomeTabViewModel.globalHomeTabData)
#endif
        
    }
    
    
//    // 디테일설정 사용자 입력 데이터 체크
//    func validateUserInputData() -> ValidationResult{
//
//
//        return
//    }
}// class
