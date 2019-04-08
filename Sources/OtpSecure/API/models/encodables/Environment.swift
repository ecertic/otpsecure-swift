//
//  Environment.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 04/04/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation

/// The `Environment` struct represents the device
/// audit trail data
struct Environment: Encodable {

    // MARK: - Properties
    //=========================================================================

    /// The device id
    public var devUuid: String!

    /// The device model
    public var device: String!

    /// The carrier names
    public var carriers: [String]?

    /// The OS name and version
    public var os: String!
        
    /// The device's IP
    public var ip: String?
    
    /// The device's location
    public var location: Coordinate?
    
}
