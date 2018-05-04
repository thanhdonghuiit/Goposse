//
//  HomeCallButton.swift
//  lindenwood
//
//  Created by Wesley Marques on 27/11/17.
//  Copyright © 2017 Lindenwood. All rights reserved.
//

import UIKit

final class HomeCallButton: Button {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setBackgroundColor(color: Colors.White.adjustAlpha(value: 0), forState: .normal)
    setBackgroundColor(color: Theme.Color.Button.Highlighted, forState: .highlighted)
    setBackgroundColor(color: Theme.Color.Button.Disabled, forState: .highlighted)
    titleLabel.font = UIFont(name: Theme.Font.App.Medium, size: Dimens.Button.Font.Standard)
    setTitleColor(color: Colors.GrayAAAAAA, forState: .normal)
    setTitleColor(color: Colors.GrayAAAAAA, forState: .highlighted)
    setTitleColor(color: Colors.GrayAAAAAA, forState: .disabled)
  }
  
  func setEnabled(enabled state: Bool) {
    if state == true {
      setBackgroundColor(color: Colors.White.adjustAlpha(value: 0), forState: UIControlState())
    } else {
      setBackgroundColor(color: Theme.Color.Button.Disabled, forState: UIControlState())
    }
    isEnabled = state
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

