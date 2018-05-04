//
//  HomeHeaderView.swift
//  MedlyDemo
//
//  Created by Phan Thanh Dong on 5/4/18.
//  Copyright © 2018 Phan Thanh Dong. All rights reserved.
//

import UIKit

class HomeHeaderView: UIView {
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewHierarchy()
        configureConstraints()
    }
    
    private (set) lazy var titleLabel: UILabel = {
        var label: UILabel = UILabel()
        label.backgroundColor = Theme.Color.MainFeed.DeliveryNotficationView.DateLabelBackground
        label.text = "Good Afternoon, Jessica"
        label.font = UIFont(name: Theme.Font.App.Regular, size: 25.0)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.left
        label.layer.cornerRadius = Dimens.DateLabel.CornerRadius
        label.clipsToBounds = true
        return label
    }()
    
    private (set) lazy var subtitleLabel: UILabel = {
        var label: UILabel = UILabel()
        label.backgroundColor = Theme.Color.MainFeed.DeliveryNotficationView.DateLabelBackground
        label.text = "You have a new prescription waiting for approval. Please approve it, and we will deliver it ASAP"
        label.font = UIFont(name: Theme.Font.App.Regular, size: Dimens.DateLabel.Font.Text)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.left
        label.layer.cornerRadius = Dimens.DateLabel.CornerRadius
        label.clipsToBounds = true
        return label
    }()
    
    func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).inset(30)
            make.left.equalTo(self.snp.left).inset(10)
            make.right.equalTo(self.snp.right).inset(10)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.left.equalTo(self.snp.left).inset(10)
            make.right.equalTo(self.snp.right).inset(10)
            
        }
    }
    
    func setupViewHierarchy() {
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
