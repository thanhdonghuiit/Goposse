//
//  String+PosseExt.swift
//  PosseKit
//
//  Created by Posse in NYC
//  http://goposse.com
//
//  Copyright (c) 2016 Posse Productions LLC.
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright notice, this
//    list of conditions and the following disclaimer.
//  * Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//  * Neither the name of the Posse Productions LLC, Posse nor the
//    names of its contributors may be used to endorse or promote products
//    derived from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL POSSE PRODUCTIONS LLC (POSSE) BE LIABLE FOR ANY
//  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

import Foundation
//import CommonCrypto

public extension String {

//  public static func percentEncodedString(string: String) -> String? {
//    return percentEncodedString(string: string, encoding: String.Encoding.utf8)
//  }

  /**
    Converts a string to its URL encoded form
    - returns: a URL encoded string
    Borrowed from Alamofire
  */
  public static func percentEncodedString(string: String) -> String? {
//    let generalDelimiters = ":#[]@"       // does not include "?" or "/" due to RFC 3986 - Section 3.4
//    let subDelimiters = "!$&'()*+,;="
//    let legalURLCharactersToBeEscaped: CFString = (generalDelimiters + subDelimiters) as CFString
    let allowedCharacters = CharacterSet.urlHostAllowed.union(.urlUserAllowed)
    .union(.urlPathAllowed).union(.urlQueryAllowed).union(.urlPasswordAllowed)
    .union(.urlFragmentAllowed)
    let encodedHost = string.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
    return encodedHost
//    return CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, string as CFString, nil,
//      legalURLCharactersToBeEscaped as CFString, CFStringConvertNSStringEncodingToEncoding(encoding.rawValue)) as String
  }
  
  public static func escape(string: String) -> String? {
//    let generalDelimiters = ":#[]@"       // does not include "?" or "/" due to RFC 3986 - Section 3.4
//    let subDelimiters = "!$&'()*+,;="
//    let legalURLCharactersToBeEscaped: CFString = (generalDelimiters + subDelimiters) as CFString
//    return CFURLCreateStringByAddingPercentEscapes(nil, string as CFString!, nil, legalURLCharactersToBeEscaped,
//        CFStringBuiltInEncodings.UTF8.rawValue) as String
    return self.percentEncodedString(string: string)
  }
  
  public static func generateBase64HMAC(key: String, value: String) -> String {
    var hmacString: String = ""
//    let cKey: [CChar]? = key.cString(using: String.Encoding.utf8)
//    let cValue: [CChar]? = value.cString(using: String.Encoding.utf8)
//    if cKey != nil && cValue != nil {
//      var result: [CUnsignedChar]
//      let algorithm: CCHmacAlgorithm = CCHmacAlgorithm(kCCHmacAlgSHA256)
//      result = Array(repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
//      CCHmac(algorithm, cKey!, Int(strlen(cKey!)), cValue!, Int(strlen(cValue!)), &result)
//      let data: NSData = NSData(bytes: result, length: Int(CC_SHA256_DIGEST_LENGTH))
//      hmacString = data.base64EncodedString(options: NSData.Base64EncodingOptions())
//    }
    return hmacString
  }
  
  public func escapedString() -> String? {
    return String.percentEncodedString(string: self)
  }
  

}
