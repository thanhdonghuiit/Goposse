//
//  Debug.swift
//  PosseKit
//
//  Created by Luke Freeman on 10/3/16.
//  Copyright © 2016 Posse Productions LLC. All rights reserved.
//

import Foundation
import UIKit

public func debug(view: UIView, on: Bool = true, color: UIColor = UIColor.red) {
	view.layer.borderColor = color.cgColor
	view.layer.borderWidth = (on ? 1.0 : 0.0)
}
