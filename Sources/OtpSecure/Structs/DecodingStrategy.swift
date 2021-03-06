//
//  DecodingStrategy.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 11/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation

/// This struct houses both the date and data decoding strategies for a
/// response.
public struct DecodingStrategy {
    
    // MARK: - Properties
    //=========================================================================
    
    /// The encoding strategy for dates.
    public let dates: JSONDecoder.DateDecodingStrategy
    
    /// The encoding strategy for data.
    public let data: JSONDecoder.DataDecodingStrategy
    
    // MARK: - Initialization
    //=========================================================================
    
    /// Initializes the struct with a date and data strategy.
    ///
    /// - Parameters:
    ///   - dates:  The date encoding strategy.
    ///   - data:   The data encoding strategy.
    public init(dates: JSONDecoder.DateDecodingStrategy = .secondsSince1970, data: JSONDecoder.DataDecodingStrategy = .base64) {
        self.dates = dates
        self.data = data
    }
    
}
