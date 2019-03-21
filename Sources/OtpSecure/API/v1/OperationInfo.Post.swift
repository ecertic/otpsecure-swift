//
//  OperationInfo.Post.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 07/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation

public extension OperationInfo {
    
    public class Post: Request<OperationInfo>, AutoEncodable {
        
        // MARK: - Properties
        //=========================================================================
        
        /// The token
        public let token: String

        // MARK: - Initialization
        //=========================================================================
        
        /// Initializes the request with a token
        /// - Parameters:
        ///   - token:  The token.
        public init(token: String) {
            self.token = token
            super.init(method: .POST, contentType: .json, path: "/token")
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
