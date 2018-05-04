//
//  MainFlow.swift
//  lindenwood
//
//  Created by Kevin Gray on 3/8/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation
import UIKit
 

final class MainFlow : NavigationFlow {
  
  deinit {
    print("MainFlow deinit")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func onActionResult(_ action: Action, code: Int, bundle: [String : AnyObject]?) {
    if code == Constants.Action.HomeDetail {
        let detailViewAction: DetailViewAction = DetailViewAction()
        moveToAction(action: detailViewAction, bundle: nil)
    }
  }
}
