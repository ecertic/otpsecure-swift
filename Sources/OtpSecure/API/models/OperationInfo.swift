//
//  Token.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 11/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation

/// The `OperationInfo` struct represents the enclosing structure of the
/// operation returning from the operation info API call.
public struct OperationInfo: Decodable {
    
    // MARK: - Properties
    //=========================================================================

    /// The token uuid.
    public let uuid: String

    /// The associated token html.
    public let html: String

    /// The token status.
    public let status: String?

    /// The checks array.
    public let checks: [Check]?
}
