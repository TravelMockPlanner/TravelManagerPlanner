//
//  CommunityCollectionViewCell.swift
//  TravelManagePlanner
//
//  Created by Hojin Jang on 2022/02/10.
//

import UIKit
import Then
import SnapKit

class CommunityCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    var communityViewModel: CommunityViewModel!
    //Demo
//    let demoImgUrl : [String] = ["https://ifh.cc/g/1XaIwR.jpg",
//                             "https://ifh.cc/g/1JyuHA.jpg",
//                             "https://ifh.cc/g/uKhzEr.jpg",
//                             "https://ifh.cc/g/Ee5di6.jpg",
//                             "https://ifh.cc/g/O2xYzA.jpg",
//                             "https://ifh.cc/g/rH1nZN.jpg"]
//
//    let demoTitle : [String] = ["혜빈이와 100일 여행",
//                                "오늘 민수 생일 축하여행 😀",
//                                "2월 12일 제주도에 다녀왔습니다.",
//                                "전주에 부모님과 여행...",
//                                "단양 고수동굴 가보셨나요?",
//                                "2022년 보드동아리 모임"]
//
//    let demoHasgTag : [String] = ["#여자친구 #100일여행 #부산여행",
//                                  "#생일여행 #남자친구 #🥰",
//                                  "#2월 #제주도 #한라산 #폭설",
//                                  "#전주 #육회비빔밥 #한뚝배기",
//                                  "#단양 #고수동굴 #당일치기",
//                                  "#보드동아리 #원주오크밸리 #보드"]
    
    lazy var imageShadowView = UIView().then {
        $0.layer.shadowOffset = CGSize(width: 2, height: 2)
        $0.layer.shadowOpacity = 0.7
        $0.layer.shadowRadius = 5
        $0.layer.shadowColor = UIColor.gray.cgColor
    }
    
    lazy var communityCollectionViewImage = UIImageView().then {
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.backgroundColor = .lightGray
        $0.contentMode = .scaleAspectFill
    }
    
    lazy var communityCollectionViewTitle = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 16)
        $0.backgroundColor = GlobalConstants.Color.Background.themeColor
    }
    
    lazy var communityCollectionViewHashtags = UILabel().then {
        $0.textColor = .gray
        $0.font = .boldSystemFont(ofSize: 12)
        $0.backgroundColor = GlobalConstants.Color.Background.themeColor
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        communityCollectionViewImage.image = nil
        communityCollectionViewTitle.text = ""
        communityCollectionViewHashtags.text = ""
        self.layer.borderColor = .none
    }
    
    // MARK: functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = GlobalConstants.Color.Background.themeColor
        communityViewModel = CommunityViewModel()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setLayout()
    }
    
    // MARK: functions
    private func setLayout() {
        self.addSubview(imageShadowView)
        imageShadowView.addSubview(communityCollectionViewImage)
        self.addSubview(communityCollectionViewTitle)
        self.addSubview(communityCollectionViewHashtags)
        
        imageShadowView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.centerX.equalTo(self.snp.centerX)
            $0.width.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.7)
        }
        
        communityCollectionViewImage.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview()
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalToSuperview()
        }
        
        communityCollectionViewTitle.snp.makeConstraints {
            $0.top.equalTo(communityCollectionViewImage.snp.bottom).offset(10)
            $0.centerX.equalTo(self.snp.centerX)
            $0.width.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        communityCollectionViewHashtags.snp.makeConstraints {
            $0.top.equalTo(communityCollectionViewTitle.snp.bottom)
            $0.centerX.equalTo(self.snp.centerX)
            $0.width.equalToSuperview().multipliedBy(0.9)
            $0.height.equalTo(20)
        }
    }
    
    func setData(_ communityDataDetail: CommunityData.CommunityDataDetail) {
        ImageLoader.loadImage(url: communityDataDetail.imgUrl) { [weak self] image in
                self?.communityCollectionViewImage.image = image
            }
        self.communityCollectionViewTitle.text = communityDataDetail.title
            self.communityCollectionViewHashtags.text = communityDataDetail.tags
    }
    
//    func demoSetData(index : Int) {
//        ImageLoader.loadImage(url: demoImgUrl[index]) { [weak self] image in
//                self?.communityCollectionViewImage.image = image
//            }
//        self.communityCollectionViewTitle.text = demoTitle[index]
//            self.communityCollectionViewHashtags.text = demoHasgTag[index]
//    }
}
