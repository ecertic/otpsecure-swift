//
//  Check.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 17/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation

/// The `Check` struct represents an html check model
/// using its html attributes, which is the html to
/// render and mandatory to indicate if it must be
/// marked mandatory to finish the operation
public struct Check: Decodable {
    
    // MARK: - Properties
    //=========================================================================
    
    /// The html.
    public let html: String
    
    /// The required property.
    public let required: Bool
    
}
