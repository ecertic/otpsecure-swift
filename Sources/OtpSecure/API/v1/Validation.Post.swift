//
//  Validation.Post.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 14/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation

extension Validation {
    
    class Post: Request<Validation>, AutoEncodable {
        
        // MARK: - Properties
        //=========================================================================
        
        /// The token
        let token: String

        /// The OTP
        let otp: String

        /// The environment object
        let env: Environment!

        // MARK: - Initialization
        //=========================================================================
        
        /// Initializes the request with a token
        /// - Parameters:
        ///   - token:  The token.
        ///   - otp: The OTP
        ///   - env: The audit trail data to send
        init(token: String, otp: String, env: Environment) {
            self.token = token
            self.otp = otp
            self.env = env
            super.init(method: .POST, contentType: .json, path: "/validate")
        }

    }
}
