//
//  Exception+Location.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 04/04/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation

public extension Exception {
    
    /// The `Exception.Location` enum contains all the errors thrown while getting
    /// location
    enum Location: Error, CustomStringConvertible {
        
        // MARK: - Cases
        //======================================================================
        
        /// Thrown if locations services are not enabled
        case locationServicesNotEnabled
        
        /// Thrown if locations services are not allowed
        case locationServicesNotAllowed
        
        
        // MARK: - Properties
        //======================================================================
        
        /// A description for the error.
        public var description: String {
            switch self {
            case .locationServicesNotEnabled:
                return "Locations services are not enabled."
            case .locationServicesNotAllowed:
                return "Locations services are not allowed."
            }
        }
    }
}
