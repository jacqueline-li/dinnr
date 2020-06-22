//
//  LocationServices.swift
//  Food-Tinder
//
//  Created by Jacqueline Li on 2020-03-29.
//  Copyright © 2020 Jacqueline Li. All rights reserved.
//

import Foundation
import CoreLocation

enum Result<T> {
    case success(T)
    case failure(Error)
}

final class LocationService: NSObject {
    private let manageLocation: CLLocationManager
    
    init(manageLocation: CLLocationManager = .init()) {
        self.manageLocation = manageLocation
        super.init()
        manageLocation.delegate = self
    }
    
    var newLocation: ((Result<CLLocation>) -> Void)?
    var didChangeStatus: ((Bool) -> Void)?
    
    var status: CLAuthorizationStatus {
        return CLLocationManager.authorizationStatus()
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manageLocation: CLLocationManager, didFailWithError error: Error) {
        newLocation?(.failure(error))
    }
    
    func locationManager(_ manageLocation: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.sorted(by: {$0.timestamp > $1.timestamp}).first {
        newLocation?(.success(location))
        }
    }
    
    func locationManager(_ manageLocation: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined, .restricted, .denied:
            didChangeStatus?(false)
        default:
            didChangeStatus?(true)
        }
    }
}
