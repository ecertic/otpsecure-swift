//
//  Validation.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 14/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation

/// The `Validation` struct represents the enclosing structure of validation
/// returning from the validate operation API call. It contains the
/// status of the token, along with a message.
public struct Validation: Decodable {
    
    // MARK: - Properties
    //=========================================================================
    
    /// The status.
    public let status: String
    
    /// The message.
    public let msg: String
    
}
