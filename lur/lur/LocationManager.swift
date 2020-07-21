//
//  LocationManager.swift
//  lur
//
//  Created by Elijah Valine on 7/20/20.
//  Copyright © 2020 Elijah Valine. All rights reserved.
//

import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate
{
 
    
    @Published var location: CLLocation? = nil
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      guard let location = locations.last else { return }
        self.location = location
    }

   
    
    
    
    
    
    
    
    
}
