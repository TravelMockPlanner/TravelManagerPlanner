//
//  AccomoViewCell.swift
//  TravelManagePlanner
//
//  Created by YoonDaeSung on 2022/01/24.
//
import UIKit

class AccomoViewCell: UITableViewCell {
        
    var cellDelegate: ContentsMainTextDelegate?
    
    // 디테일 캘린더로 전달할 데이터
    lazy var place:String = ""
    lazy var sIdx: Int = 0
    
    lazy var accomoImg: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 4)
        imageView.layer.shadowRadius = 5
        imageView.layer.shadowOpacity = 0.3
        
        return imageView
    }()
    
    lazy var accomoTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor(red: 94/255, green: 94/255, blue: 94/255, alpha: 1)
        
        return label
    }()
    
    lazy var accomoSubTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = UIColor(red: 94/255, green: 94/255, blue: 94/255, alpha: 1)
        
        return label
    }()
    
    lazy var accomoSelectButton: UIButton = {
       let  button = UIButton()
        
        button.setImage(UIImage(named: "selectIcon"), for: .normal) // You can set image direct from Storyboard
        button.setImageTintColor(GlobalConstants.Color.IconColor.recommendSelectButtonColor)
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        button.backgroundColor = .clear
        
        return button
    }()
    
    @objc
    func accomoSelectAction() {
        cellDelegate?.categoryButtonTapped(title: accomoTitle.text ?? "", place: self.place, sIdx: self.sIdx)
    }
    
    lazy var accomoTitleStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [accomoTitle, accomoSubTitle])
        stackView.axis = .vertical
        stackView.spacing = 3
        
        return stackView
    }()
    
    lazy var accomoAllTitleStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [accomoTitleStack, accomoSelectButton])
        stackView.axis = .horizontal
        stackView.spacing = 215
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        setLayout()
        
        self.accomoSelectButton.addTarget(self, action: #selector(accomoSelectAction), for: .touchUpInside)
    }
    
    func setUpView() {
        contentView.addSubview(accomoImg)
        contentView.addSubview(accomoAllTitleStack)
        
    }
    
    func setLayout() {
        accomoImg.snp.makeConstraints {
            $0.top.equalToSuperview().multipliedBy(1.1)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-80)
        }
        
        accomoAllTitleStack.snp.makeConstraints {
            $0.top.equalTo(accomoImg.snp.bottom).multipliedBy(1.0)
            $0.leading.equalToSuperview().inset(0)
            $0.trailing.equalToSuperview().inset(0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
