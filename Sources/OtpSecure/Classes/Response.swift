//
//  Response.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 12/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation

/// The `Response` class is a wrapper used after an API call is made. It
/// includes all the raw data, but also attempts to parse it into the
/// appropriate models.
open class Response<ModelType : Decodable> {
    
    // MARK: - Read Only Properties
    //=========================================================================
    
    /// The data (if present) returned from the request.
    public let data: Data?
    
    /// The URLResponse returned from the request.
    public let urlResponse: URLResponse?
    
    /// The URL response as an HTTPURLResponse (if applicable).
    public var httpUrlResponse: HTTPURLResponse? {
        return self.urlResponse as? HTTPURLResponse
    }
    
    /// The error that arose during the request (if applicable).
    public let error: Error?
    
    /// The record(s) returned from the response.
    public let model: ModelType?
    
    // MARK: - Initialization
    //=========================================================================
    
    /// Initializes the class with the data returned from an HTTP request. The
    /// class then parses the data to try and create models from the response.
    ///
    /// - Parameters:
    ///   - data:                   The data (if present) returned from the
    ///                             request.
    ///   - response:               The URLResponse returned from the request.
    ///   - error:                  The error that arose during the request (if
    ///                             applicable).
    ///   - decodingStrategy:       The strategy for decoding dates and data.
    public init(data: Data?, response: URLResponse?, error: Error?, decodingStrategy: DecodingStrategy) {
        self.data = data
        self.urlResponse = response
        self.error = error
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = decodingStrategy.dates
        decoder.dataDecodingStrategy = decodingStrategy.data
        if let d = data,
            let parsed = try? decoder.decode(ModelType.self, from: d)
        {
            self.model = parsed
        } else {
            self.model = nil
        }
    }
    
}
