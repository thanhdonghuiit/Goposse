//
//  GeocodeHelper.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/18/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation
import CoreLocation
import AddressBookUI

final class GeocodeHelper {
  
  // MARK: - Shared helper instance
  static let helper: GeocodeHelper = {
    var geocodeHelper: GeocodeHelper = GeocodeHelper()
    return geocodeHelper
  }()
}
