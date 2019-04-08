//
//  LocationManagerDelegate.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 03/04/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation
import CoreLocation

/// The `LocationManager` class is responsible for obtaining the
/// location of the device asynchronously and execute the logic
/// received after obtaining it
class LocationManager: NSObject {

    /// The completitionHandler received to execute when the location is retrieved
    private static var completionHandler: ((Result<Coordinate, Error>) -> Void)!
    
    /// The object that is used to start and stop the delivery of location-related events.
    private static let locationManager = CLLocationManager()
    
    /// Class that implements the CLLocationManagerDelegate protocol functions
    private static let delegate = LocationManager()

    /// Get the location of the device and run the completitionHandler
    /// received as a parameter after obtaining it
    public static func getCurrentLocation(completionHandler: @escaping (Result<Coordinate, Error>) -> Void = { _ in }) {
        
        LocationManager.completionHandler = completionHandler
        
        // Do not start services that aren't available.
        if !CLLocationManager.locationServicesEnabled() {
            // Location services is not available.
            completionHandler(.failure(Exception.Location.locationServicesNotEnabled))
        }

        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus != .authorizedWhenInUse && authorizationStatus != .authorizedAlways {
            completionHandler(.failure(Exception.Location.locationServicesNotAllowed))
        }
        
        locationManager.delegate = delegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }

}

// MARK: - Extension to implement the CLLocationManagerDelegate protocol functions
extension LocationManager: CLLocationManagerDelegate {
    
    /// :nodoc:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        manager.stopUpdatingLocation()
        let coordinate = Coordinate(lat: location.coordinate.latitude, lng: location.coordinate.longitude)
        LocationManager.completionHandler(.success(coordinate))
    }
    
    /// :nodoc:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        LocationManager.completionHandler(.failure(error))
    }
}
