//
//  JourneyListDetailViewController.swift
//  TravelManagePlanner
//
//  Created by UY on 2022/01/03.
//

import UIKit
import SnapKit

class JourneyListDetailViewController: UIViewController {

    var isDateCellSelected = false
    let col: [UIColor] = [.red, .blue, .orange, .yellow, .green]
    let colN = ["red", "blue", "orrange", "yellow", "green"]
    
    private lazy var journeyListDetailDateCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(JourneyListDetailDateCollectionViewCell.self, forCellWithReuseIdentifier: "dateCell")
        return collectionView
    }()
    
    private lazy var journeyListDetailPageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(JourneyListDetailPageCollectionView.self, forCellWithReuseIdentifier: "pageCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setDelegate()
    }
    
    private func setLayout() {
        view.addSubview(journeyListDetailDateCollectionView)
        view.addSubview(journeyListDetailPageCollectionView)
        
        journeyListDetailDateCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(30)
        }
        journeyListDetailPageCollectionView.snp.makeConstraints { make in
            make.top.equalTo(journeyListDetailDateCollectionView.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    private func setDelegate() {
        // 날짜 컬렉션뷰
        journeyListDetailDateCollectionView.delegate = self
        journeyListDetailDateCollectionView.dataSource = self
        // 페이지 컬렉션뷰
        journeyListDetailPageCollectionView.delegate = self
        journeyListDetailPageCollectionView.dataSource = self
    }
}
extension JourneyListDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return col.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == journeyListDetailDateCollectionView {
            let cell = journeyListDetailDateCollectionView.dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath) as! JourneyListDetailDateCollectionViewCell
            cell.setLayout()
            cell.setLabelName(name: colN[indexPath.row])
            return cell
        } else {
            let cell = journeyListDetailPageCollectionView.dequeueReusableCell(withReuseIdentifier: "pageCell", for: indexPath) as! JourneyListDetailPageCollectionView
            cell.backgroundColor = col[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize { // collectionView 셀 사이즈
        if collectionView == journeyListDetailDateCollectionView {
            return CGSize(width: 80, height: 15)
        } else {
            return CGSize(width: view.frame.width, height: 500)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { // item 선택시
        
        if collectionView == journeyListDetailDateCollectionView {
            journeyListDetailPageCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            let cell = journeyListDetailDateCollectionView.cellForItem(at: indexPath) as! JourneyListDetailDateCollectionViewCell
            cell.selected()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) { // item Deselected
        if collectionView == journeyListDetailDateCollectionView {
            let cell = journeyListDetailDateCollectionView.cellForItem(at: indexPath) as! JourneyListDetailDateCollectionViewCell
            cell.deseleted()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if !isDateCellSelected && indexPath.row == 0 {
            isDateCellSelected.toggle()
            let dell = collectionView.cellForItem(at: indexPath) as! JourneyListDetailDateCollectionViewCell
            dell.selected()
        }
    }
}

extension JourneyListDetailViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == journeyListDetailPageCollectionView {
            
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
//        guard let seletedItemInDate = journeyListDetailDateCollectionView.indexPathsForSelectedItems else { return }
//        guard let seletedItemInPage = journeyListDetailPageCollectionView.indexPathsForSelectedItems else { return }
//        print(seletedItemInDate)
//        print(seletedItemInPage)
//        if scrollView == journeyListDetailPageCollectionView {
//            journeyListDetailDateCollectionView.deselectItem(at: seletedItemInDate.first!, animated: true)
//            print(journeyListDetailPageCollectionView.indexPathsForVisibleItems)
//        }
//        for cell in journeyListDetailPageCollectionView.visibleCells {
//            let pageIdx = journeyListDetailPageCollectionView.indexPath(for: cell)
//            print(pageIdx)
//
//            journeyListDetailDateCollectionView.selectItem(at: pageIdx, animated: true, scrollPosition: .centeredHorizontally)
//
//        }

        
    }
}
