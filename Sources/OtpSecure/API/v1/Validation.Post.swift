//
//  Validation.Post.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 14/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation

public extension Validation {
    
    class Post: Request<Validation>, AutoEncodable {
        
        // MARK: - Properties
        //=========================================================================
        
        /// The token
        public let token: String

        /// The OTP
        public let otp: String

        // MARK: - Initialization
        //=========================================================================
        
        /// Initializes the request with a token
        /// - Parameters:
        ///   - token:  The token.
        ////  - otp: The OTP
        public init(token: String, otp: String) {
            self.token = token
            self.otp = otp
            super.init(method: .POST, contentType: .json, path: "/validate")
        }
        
        // MARK: - Methods
        //=========================================================================
        
        /// Validates that the end date (if present) is not earlier than the start
        /// date.
        public override func validate() throws {
            try super.validate()
        }
    }
}
