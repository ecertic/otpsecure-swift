//
//  Coordinate.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 03/04/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation

/// The `Coordinate` struct represents a geographical
/// coordinate through its properties lng and lat
struct Coordinate: Encodable {
    
    // MARK: - Properties
    //=========================================================================
    
    /// The latitude of the coordinate.
    public let lat: Double

    /// The longitude of the coordinate.
    public let lng: Double
    
    /// Initializes the coordinate
    /// - Parameters:
    ///   - lat: The latitude of the coordinate.
    ///   - lng: The longitude of the coordinate.
    public init(lat: Double, lng: Double) {
        self.lat = lat
        self.lng = lng
    }
    
}
