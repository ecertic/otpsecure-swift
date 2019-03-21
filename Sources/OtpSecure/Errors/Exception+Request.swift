//
//  Exception+Request.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 11/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation

public extension Exception {
    
    /// The `Exception.Request` enum contains all the errors thrown by
    /// `Request`.
    public enum Request: Error, CustomStringConvertible {
        
        // MARK: - Cases
        //======================================================================
        
        /// Thrown if there was a problem constructing the URL for the request
        /// call.
        case couldNotConstructUrlRequest
        
        
        // MARK: - Properties
        //======================================================================
        
        /// A description for the error.
        public var description: String {
            switch self {
            case .couldNotConstructUrlRequest:
                return "There was a problem constructing the API call's URL. Please double check the `path` property for the request."
            }
        }
    }
}
