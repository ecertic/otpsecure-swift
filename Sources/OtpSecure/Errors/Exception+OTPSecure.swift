//
//  Exception+Token.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 14/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation

public extension Exception {
    
    /// The `Exception.OTPSecure` enum contains all the errors thrown by
    /// `Request`.
    enum OTPSecure: Error, CustomStringConvertible {
        
        // MARK: - Cases
        //======================================================================

        /// Thrown if the token has not been sent
        case notSent
        
        /// Thrown if the token was not found
        case notFound

        /// Thrown if an unknown error has ocurred
        case unknownError

        
        // MARK: - Properties
        //======================================================================
        
        /// A description for the error.
        public var description: String {
            switch self {
            case .notSent:
                return "Some data has not been sent"
            case .notFound:
                return "The resource was not found."
            case .unknownError:
                return "There was an unknown error while performing this operation."
            }
        }

    }
}
