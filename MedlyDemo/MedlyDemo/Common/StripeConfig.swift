//
//  StripeConfig.swift
//  lindenwood
//
//  Created by Federico on 1/31/17.
//  Copyright © 2017 Lindenwood. All rights reserved.
//

import Foundation

struct StripeConfig {
  // the actual public key is to be retreived from the main server
  // you can take a look at the logic for it in the ConfigManager
  static var publicKey = "pk_live_Jk4vo96KEpk5tA0nO7xhJH2o" { // TEST KEY: pk_test_KJ8Pk1RDwnNL0R3OsDAkdq6X
    didSet {
      Logger.debug("Did set Stripe publishable key \"\(publicKey)\"")
    }
  }
}
