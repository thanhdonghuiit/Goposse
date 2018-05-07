//
//  BaseTableViewCell.swift
//  lindenwood
//
//  Created by Phan Thanh Dong on 4/27/18.
//  Copyright © 2018 Lindenwood. All rights reserved.
//

import UIKit
import SnapKit


final class HomeTableViewCell: UITableViewCell {
    var callBack : (( ) -> Void)?
    func setCallBack(call:@escaping ()->Void) {
        callBack = call
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        setupViewHierarchy()
        configureConstraints()
        selectionStyle = .none
        
    }
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    // MARK: - Lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    // MARK: - Lazy initialization
    private lazy var cardView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = Dimens.Onboarding.CardCornerRadius
        view.layer.cornerRadius = 5.0
        view.layer.borderColor  =  UIColor.clear.cgColor
        view.layer.borderWidth = 5.0
        view.layer.shadowOpacity = 0.5
        view.layer.shadowColor =  UIColor.lightGray.cgColor
        view.layer.shadowRadius = 5.0
        view.layer.shadowOffset = CGSize(width:5, height: 5)
        view.layer.masksToBounds = true
        return view
    }()
   
    // MARK: - Lazy init
//    private lazy var imageViewLogo: UIImageView = {
//        var imageView: UIImageView = UIImageView()
//        imageView.backgroundColor = Theme.Color.MainFeed.CardBackground
//        imageView.contentMode = UIViewContentMode.scaleAspectFit
//        return imageView
//    }()
    
    private lazy var badgeImageView: UIImageView = {
        var imageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "rx_pill_vial"))
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 0.4
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.isHidden = false
        return imageView
    }()
    
    private lazy var buttonLineView: UIView = {
        var view: UIView = UIView()
        view.backgroundColor = Theme.Color.MainFeed.NotficationView.ButtonLine
        return view
    }()
    
    private lazy var titleLabel1: UILabel = {
        var label: UILabel = UILabel()
        label.backgroundColor = Theme.Color.MainFeed.CardBackground
        label.text = "You have a new prescription"
        label.lineBreakMode = NSLineBreakMode.byCharWrapping
        label.font = UIFont.systemFont(ofSize: 19.0)
        label.textColor = Theme.Color.MainFeed.NotficationView.Title
        label.numberOfLines = 0
        return label
    }()
    private lazy var prescriptionLabel1: UILabel = {
        var label: UILabel = UILabel()
        label.backgroundColor = Theme.Color.MainFeed.CardBackground
        label.text = "BRIMONIDIN...RATE. 0.15%"
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = #colorLiteral(red: 0.2808241007, green: 0.9563174175, blue: 0.7826854898, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var buttonDividerView: UIView = {
        var view: UIView = UIView()
        view.backgroundColor = Theme.Color.MainFeed.NotficationView.ButtonLine
        return view
    }()
    
    private (set) lazy var button1: Button = {
        var button: Button = Button()
        //button.titleLabel.font = Theme.Font.Feed.Button1
        button.setTitle(title: "Ok", forState: .normal)
        button.titleLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        button.setTitleColor(color: Theme.Color.MainFeed.NotficationView.Button0Normal, forState: UIControlState())
        button.setTitleColor(color: Theme.Color.MainFeed.NotficationView.Button0Highlighted, forState: .highlighted)
        button.addTarget(self, action:#selector(handleDetail), for: .touchUpInside)
        return button
    }()
    private (set) lazy var buttonDetail: Button = {
        var button: Button = Button()
        button.setTitle(title: "SEE DETAILS", forState: .normal)
        button.setTitleColor(color: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), forState: UIControlState())
        button.setTitleColor(color: Theme.Color.MainFeed.NotficationView.Button0Highlighted, forState: .highlighted)
        button.addTarget(self, action:#selector(handleDetail), for: .touchUpInside)
        return button
    }()
    
    private (set) lazy var button2: Button = {
        var button: Button = Button()
        button.setTitle(title: "Cancel", forState: .normal)
       // button.titleLabel.font = Theme.Font.Feed.Button2
        button.titleLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        button.setTitleColor(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), forState: UIControlState())
        button.setTitleColor(color: Theme.Color.MainFeed.NotficationView.Button1Highlighted, forState: .highlighted)
        return button
    }()
    
    private lazy var dateLabel: UILabel = {
        var label: UILabel = UILabel()
        label.backgroundColor = Theme.Color.MainFeed.DeliveryNotficationView.DateLabelBackground
        label.text = "Feb 14"
        label.font = UIFont(name: Theme.Font.App.Regular, size: Dimens.DateLabel.Font.Text)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.numberOfLines = 1
        label.textAlignment = NSTextAlignment.center
        label.layer.cornerRadius = Dimens.DateLabel.CornerRadius
        label.clipsToBounds = true
        return label
    }()
    
    private lazy var medicationLabelPool: [UILabel] = {
        var views: [UILabel] = []
        return views
    }()
    
    // MARK: - Initialization
    // MARK: - Initializers
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//    }
    // MARK: - View lifecycle
    @objc private func handleDetail()
    {
        callBack?()
    }
    
    private func setupViewHierarchy() {
        addSubview(cardView)
        cardView.addSubview(badgeImageView)
        cardView.addSubview(titleLabel1)
        cardView.addSubview(dateLabel)
        cardView.addSubview(prescriptionLabel1)
        cardView.addSubview(buttonDetail)
        cardView.addSubview(buttonLineView)
        cardView.addSubview(button1)
        cardView.addSubview(button2)
        
    }
    
    private func configureConstraints() {
        cardView.snp.makeConstraints {  make in
            make.edges.equalTo(self).inset(UIEdgeInsets.init(top: 5, left: 5, bottom: 50, right: 5))
        }
        badgeImageView.snp.makeConstraints { make in
            make.top.equalTo(cardView.snp.top).inset(5)
            make.left.equalTo(cardView.snp.left).inset(5)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        titleLabel1.snp.makeConstraints { make in
            make.left.equalTo(badgeImageView.snp.right).offset(10)
            make.top.equalTo(cardView.snp.top).inset(10)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(cardView.snp.top).inset(10)
            make.left.equalTo(titleLabel1.snp.right).offset(5)
            make.right.equalTo(cardView.snp.right).inset(10)
            make.height.equalTo(25)
        }
//        button1.snp.makeConstraints { make in
//            make.top.equalTo(dateLabel).offset(10)
//            make.leading.equalTo(badgeImageView).offset(10)
//            make.right.equalTo(cardView).inset(10)
//            make.
//        }
        prescriptionLabel1.snp.makeConstraints { make in
            make.top.equalTo(titleLabel1.snp.bottom).offset(10.0)
            make.left.equalTo(badgeImageView.snp.right).offset(10.0)
            make.right.equalTo(cardView.snp.right).inset(5.0)
        }
        buttonDetail.snp.makeConstraints { make in
            make.top.equalTo(prescriptionLabel1.snp.bottom).offset(10.0)
            make.left.equalTo(badgeImageView.snp.right).offset(5.0)
         
        }
        buttonLineView.snp.makeConstraints { make in
            make.top.equalTo(buttonDetail.snp.bottom).offset(10)
            make.left.equalTo(cardView.snp.left).inset(0)
            make.right.equalTo(cardView.snp.right).inset(0)
            make.height.equalTo(1)
        }
        
        button1.snp.makeConstraints { make in
            make.width.equalTo(button2.snp.width)
            make.top.equalTo(buttonLineView.snp.bottom).offset(5)
            make.left.equalTo(cardView.snp.left).inset(0)
            make.right.equalTo(button2.snp.left).inset(0)
            make.height.equalTo(50)
            make.bottom.equalTo(cardView.snp.bottom).inset(1)
            
        }
        button2.snp.makeConstraints { make in
            make.top.equalTo(buttonLineView.snp.bottom).offset(5)
            make.right.equalTo(cardView.snp.right).inset(0)
            make.height.equalTo(50)
            make.bottom.equalTo(cardView.snp.bottom).inset(1)
            
        }
    }
    // MARK: - Lazy Initialization
   
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
       
    }

}
