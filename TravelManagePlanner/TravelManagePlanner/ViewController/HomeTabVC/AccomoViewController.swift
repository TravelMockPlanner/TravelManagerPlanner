//
//  AccomoViewController.swift
//  TravelManagePlanner
//
//  Created by YoonDaeSung on 2022/01/22.
//
import UIKit

// 숙박업소 추천지노출
class AccomoViewController: UIViewController {
    
    //  뷰모델 소유
    let destiSearchViewModel = DestiSearchViewModel()
    let destinationDetailViewModel = DestinationDetailViewModel()
    
    let cellID = "Cell"
    let accomoCategory:String = "1"
    
    lazy var accomoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "숙박"
        label.font = UIFont.systemFont(ofSize: 40)
        label.textColor = UIColor(red: 85/255, green: 185/255, blue: 188/255, alpha: 1)
        
        return label
    }()
    
    lazy var basket: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "basket"), for: .normal)
        button.setImageTintColor(GlobalConstants.Color.IconColor.basketColor)
        button.backgroundColor = .clear
        
        return button
    }()
    
    
    // 테이블뷰를 활용하여 추천지 구현하기
    lazy var accomoTableView: UITableView = {
        let tabkeView = UITableView()
        tabkeView.backgroundColor = .clear
        tabkeView.separatorStyle = .none // 가로라인 없애기
        
        return tabkeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = GlobalConstants.Color.Background.themeColor
        
        setObserver()
        setUpView()
        setLayout()
        setDelegate()
    }
    
    func setUpView() {
        view.addSubview(accomoTitleLabel)
        view.addSubview(basket)
        view.addSubview(accomoTableView)
    }
    
    func setLayout() {
        accomoTitleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(view.snp.centerX).multipliedBy(0.1)
            $0.trailing.equalToSuperview().offset(-24)
        }
        
        basket.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(accomoTableView.snp.top).offset(-27)
            $0.trailing.equalToSuperview().offset(-24)
        }
        
        accomoTableView.snp.makeConstraints {
            $0.top.equalTo(accomoTitleLabel.snp.bottom).multipliedBy(1.1)
            $0.leading.equalTo(view.snp.centerX).multipliedBy(0.1)
            $0.bottom.equalToSuperview().offset(-30)
            $0.trailing.equalToSuperview().offset(-24)
        }
    }
    
    func setDelegate() {
        accomoTableView.dataSource = self
        accomoTableView.delegate = self
        
        accomoTableView.register(AccomoViewCell.classForCoder(), forCellReuseIdentifier: cellID)
    }
    
    func setObserver() {
        destiSearchViewModel.getData()
        
        destiSearchViewModel.loadingStarted = {
            
        }
        destiSearchViewModel.loadingEnded = {
            
        }
        destiSearchViewModel.dataUpdated = {
            self.accomoTableView.reloadData()
        }
    }
}

// cellHeight 지정
extension AccomoViewController: UITableViewDelegate {
    
    // 셀높이 간격
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 3.5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let shopData = destiSearchViewModel.getShopDataSepWithCategory(idx: indexPath.row, categoryIdx: accomoCategory)
        
        let destinationVC = DestinationDetailViewController()
        destinationVC.destinationDetailViewModel.shopId = String(shopData.idx)
        
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }

}

extension AccomoViewController: UITableViewDataSource {
    // 큰 섹션수(Defalut 1)
    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
    // cell 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 1: 숙박, 2: 식당, 3: 놀거리
        let tableCount = destiSearchViewModel.getDestCount(categoryIdx: accomoCategory)
        
        return tableCount
    }
    
    // 테이블 화면데이터구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! AccomoViewCell
        cell.backgroundColor = .clear
        
        
        // cell 선택시 백그라운드 색상 없애기
        let cellBGView = UIView()
        cellBGView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        cell.selectedBackgroundView = cellBGView
        
        // 선택된 해당데이터 모델[배열]가져오기
        let shopData = destiSearchViewModel.getShopDataSepWithCategory(idx: indexPath.row, categoryIdx: accomoCategory)
        
        let url = URL(string: shopData.imgUrl)
        let data = try! Data(contentsOf: url!)
        
        cell.accomoImg.image = UIImage(data: data)
        cell.accomoTitle.text = shopData.name
        cell.accomoSubTitle.text = shopData.content
        cell.place = shopData.area
        cell.sIdx = shopData.idx
        
        cell.cellDelegate = self
        
        return cell
    }
}

extension AccomoViewController:ContentsMainTextDelegate {
    //달력 이동
    func categoryButtonTapped(title: String, place: String, sIdx: Int) {
        let nextView = UIStoryboard(name: "HomeTabSB", bundle: nil).instantiateViewController(withIdentifier: "AccomoCalendarViewSB") as! AccomoCalendarViewController
        
        nextView.accomoName = title
        nextView.accomoPlace = place
        nextView.accomoSIdx = sIdx
        
        // 다음화면에서 바텀탭 없애기
        nextView.hidesBottomBarWhenPushed = true
        self.present(nextView, animated: true)
    }
}

