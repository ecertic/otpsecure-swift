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

    /// The object in charge of blocking the thread until the
    /// location has been obtained or the timeout has skipped
    private var semaphore: DispatchSemaphore!
    
    /// The object that is used to start and stop the delivery
    /// of location-related events.
    private var locationManager: CLLocationManager!

    /// The object that will store the obtained location
    private var position: Coordinate?

    // MARK: - Initialization
    //=========================================================================
    
    /// Initializes the locationManager and related properties.
    public override init() {
        self.semaphore = DispatchSemaphore(value: 0)
    
        super.init()
    
        DispatchQueue.main.sync(execute: {
            locationManager = CLLocationManager()
        })
    }
    
    public func getLocation() -> Coordinate? {
        // Do not start services that aren't available.
        if !CLLocationManager.locationServicesEnabled() {
            // Location services is not available.
            return nil
        }

        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus != .authorizedWhenInUse && authorizationStatus != .authorizedAlways {
            return nil
        }
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        
        let _ = self.semaphore.wait(timeout: .now() + .milliseconds(500))
        
        return self.position
    }

}

// MARK: - Extension to implement the CLLocationManagerDelegate protocol functions
extension LocationManager: CLLocationManagerDelegate {
    
    /// :nodoc:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        manager.stopUpdatingLocation()
        let coordinate = Coordinate(lat: location.coordinate.latitude, lng: location.coordinate.longitude)
        self.position = coordinate
        self.semaphore.signal()
    }
    
    /// :nodoc:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.semaphore.signal()
    }
}
