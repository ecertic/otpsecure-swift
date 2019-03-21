//
//  EncodingStrategy.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 11/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation

/// This struct houses both the date and data encoding strategies for a request.
public struct EncodingStrategy {
    
    // MARK: - Properties
    //=========================================================================
    
    /// The encoding strategy for dates.
    public let dates: JSONEncoder.DateEncodingStrategy
    
    /// The encoding strategy for data.
    public let data: JSONEncoder.DataEncodingStrategy
    
    // MARK: - Initialization
    //=========================================================================
    
    /// Initializes the struct with a date and data strategy.
    ///
    /// - Parameters:
    ///   - dates:  The date encoding strategy.
    ///   - data:   The data encoding strategy.
    public init(dates: JSONEncoder.DateEncodingStrategy = .secondsSince1970, data: JSONEncoder.DataEncodingStrategy = .base64) {
        self.dates = dates
        self.data = data
    }
    
}
