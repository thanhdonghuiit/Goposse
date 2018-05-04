//
//  DemoCell1.swift
//  lindenwood
//
//  Created by Phan Thanh Dong on 5/3/18.
//  Copyright © 2018 Lindenwood. All rights reserved.
//

import UIKit

class DemoCell1: UITableViewCell {
    
    // MARK: - Lazy Instances
    private (set) lazy var titleLabel: TouchFriendlyLabel = {
        let label: TouchFriendlyLabel = TouchFriendlyLabel()
        label.numberOfLines = 3
        label.isUserInteractionEnabled = true
        label.textColor = Colors.CoolGray
        label.font = UIFont(name: Theme.Font.HelveticaNeue.Regular, size: Dimens.Profile.Address.ListLabelTextSize)
        return label
    }()
    
    private (set) lazy var subtitleLabel: TouchFriendlyLabel = {
        let label: TouchFriendlyLabel = TouchFriendlyLabel()
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        label.textColor = Colors.LightMidBlue
        label.font = UIFont(name: Theme.Font.HelveticaNeue.Regular, size: Dimens.Profile.ProfileMenuOptionsSubtitleTextSize)
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
