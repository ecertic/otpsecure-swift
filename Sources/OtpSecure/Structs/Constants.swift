//
//  Constants.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 11/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation

struct Constants {
    
    struct API {
        
        /// The host to use for the API calls.
        static let BaseUrl = "https://api.otpsecure.net"
        
        // Operation info endpoint URL
        static let OperationInfoUrl = String(format: "%s/token", BaseUrl)
        
        // Validate endpoint URL
        static let ValidateUrl = String(format: "%s/validate", BaseUrl)
        
        /// The version number of the library.
        static let Version: String = "2.0.1"
    }

}
