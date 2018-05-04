//
//  DemoTableView.swift
//  lindenwood
//
//  Created by Phan Thanh Dong on 5/3/18.
//  Copyright © 2018 Lindenwood. All rights reserved.
//

import UIKit

class HomeTableView: UITableView {
    static let DemoCellIdentifier: String = "DemoCellIdentifier"
   
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        register(HomeTableViewCell.classForCoder(), forCellReuseIdentifier:HomeTableView.DemoCellIdentifier)
        estimatedRowHeight = Dimens.Profile.ProfileListViewHeight
        estimatedSectionHeaderHeight = Dimens.Profile.ProfileListViewHeight
        separatorStyle = .none
        delaysContentTouches = false
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        backgroundColor = Theme.Color.Onboarding.CardBackground
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
