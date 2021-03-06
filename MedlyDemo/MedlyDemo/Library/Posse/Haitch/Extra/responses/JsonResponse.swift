//
//  JsonResponse.swift
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

/**
 A Response class that generates a JSON object from the data property of the Response.
 */
open class JsonResponse: Response {

  /// The JSON object that is generated from the data property.
  private (set) open var json: Any?
  
  /// An error property that is set if there is an error while attempting to set the 
  /// json property.
  private (set) open var jsonError: Any?
  
  /**
   Initializes a JsonResponse with a Response.  All values from the passed in Response
   are set as the values in this JsonResponse.
	
   - parameter response: The response to initialize with.
   */
  public convenience required init(response: Response) {
    self.init(request: response.request, data: response.data as Data?, headers: response.headers, statusCode: response.statusCode, error: response.error)
  }
  
  /**
   Initializer for the JsonResponse class.
   
   - parameter request: The request that resulted in this JsonResponse being created.
   - parameter data: The data block of the HTTP response.
   - parameter headers:  The headers of the HTTP response.
   - parameter statusCode: The status code of the HTTP response.
   - parameter error: Optional error value if an error has occured.
   */
  public override init(request: Request, data: Data?, headers: [AnyHashable : Any]?, statusCode: Int, error: Error?) {
    super.init(request: request, data: data, headers: headers, statusCode: statusCode, error: error)
    self.populateFromResponseData(data)
  }

  /**
   Helper function that populates the json property from the data property of the class.
   
   - parameter data: The data that will be serialized and set in the json property.  If
       there is an error serializing the JSON, then the jsonError property will be set and the
       json property will be nil.
   */
  private func populateFromResponseData(_ responseData: Data?) {
		guard let data = responseData else {
			return
		}
		var jsonError: NSError? = nil
		var jsonObj: Any?
		do {
			jsonObj = try JSONSerialization.jsonObject(with: data,
							options: [JSONSerialization.ReadingOptions.allowFragments, JSONSerialization.ReadingOptions.mutableContainers, JSONSerialization.ReadingOptions.mutableLeaves])
		} catch let error as NSError {
			jsonError = error
			jsonObj = nil
		}
		self.jsonError = jsonError
		self.json = jsonObj
  }
  
}
