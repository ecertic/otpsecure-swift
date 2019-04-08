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
    public var deviceId: String!

    /// The device model
    public var deviceModel: String!

    /// The carrier names
    public var carriers: [String]?

    /// The OS name
    public var osName: String!
    
    /// The OS version
    public var osVersion: String!
    
    /// The device's IP
    public var ip: String?
        
    /// The device's location
    public var location: Coordinate?
    
}
