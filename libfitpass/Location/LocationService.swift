//
//  LocationService.swift
//
//
//  Created by Anak Mirasing on 5/18/2558 BE.
//
//

import Foundation
import CoreLocation
import UIKit

@objc public protocol LocationServiceDelegate {
    func tracingLocation(_ currentLocation: CLLocation)
    func tracingLocationDidFailWithError()
    @objc optional func tracingLocationDidFailWithoutPrecision()
}

@objc public class LocationService: NSObject, CLLocationManagerDelegate {
//    static let sharedInstance: LocationService = {
//        let instance = LocationService()
//        return instance
//    }()
    
    class var swiftSharedInstance: LocationService {
        struct Singleton {
            static let instance = LocationService()
        }
        return Singleton.instance
    }

    @objc class func sharedInstance() -> LocationService {
        return LocationService.swiftSharedInstance
    }


    var locationManager: CLLocationManager?
    var currentLocation: CLLocation?
    @objc var delegate: LocationServiceDelegate?

    override init() {
        super.init()
    }
    
    @objc func isLocationOn() -> Bool
    {
//        self.locationManager = CLLocationManager()
//        guard let locationManager = self.locationManager else {
//            return
//        }
        var locationEnabled = false
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                print("No access")
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
                locationEnabled = true
            }
        } else {
            print("Location services are not enabled")
        }
        return locationEnabled
    }
    
    @objc func startUpdatingLocation() {
        print("Starting Location Updates")
       
        self.locationManager = CLLocationManager()
        guard let locationManager = self.locationManager else {
            return
        }

        if CLLocationManager.locationServicesEnabled()
        {
            switch(CLLocationManager.authorizationStatus()) {
            case  .denied:
                print("No access")
                print("Location services denied")
                self.ShowLocationAlert()
                
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
                if #available(iOS 14.0, *) {
                    if CLLocationManager.authorizationStatus() == .notDetermined
                    {
                        // you have 2 choice
                        // 1. requestAlwaysAuthorization
                        // 2. requestWhenInUseAuthorization
                        locationManager.requestWhenInUseAuthorization()
                    }
                    else if locationManager.accuracyAuthorization != .fullAccuracy
                    {
                        print("not fullAccuracy")
                    }
                    else //if locationManager.accuracyAuthorization != .fullAccuracy
                    {
                        print("fullAccuracy")
                    }
                } else {
                    // Fallback on earlier versions
                    if CLLocationManager.authorizationStatus() == .notDetermined
                    {
                        // you have 2 choice
                        // 1. requestAlwaysAuthorization
                        // 2. requestWhenInUseAuthorization
                        locationManager.requestWhenInUseAuthorization()
                    }
                }
                
                locationManager.desiredAccuracy = kCLLocationAccuracyBest // The accuracy of the location data
                locationManager.distanceFilter = 200 // The minimum distance (measured in meters) a device must move horizontally before an update event is generated.
                locationManager.delegate = self
                self.locationManager?.startUpdatingLocation()


            case .notDetermined:
                print("Location services notDetermined")
                
                if CLLocationManager.authorizationStatus() == .notDetermined
                {
                    // you have 2 choice
                    // 1. requestAlwaysAuthorization
                    // 2. requestWhenInUseAuthorization
                    locationManager.requestWhenInUseAuthorization()
                }
                
                locationManager.desiredAccuracy = kCLLocationAccuracyBest // The accuracy of the location data
                locationManager.distanceFilter = 200 // The minimum distance (measured in meters) a device must move horizontally before an update event is generated.
                locationManager.delegate = self
                self.locationManager?.startUpdatingLocation()

            case .restricted:
                print("Location services restricted")
                self.ShowLocationAlert()
            }
        }
        else
        {
            print("Location services are not enabled")
            self.ShowLocationAlert()
        }

//        self.locationManager?.startUpdatingLocation()
    }
    
    
    @objc func startUpdatingLocationOnlyIfOn() {
        print("Starting Location Updates")
       
        self.locationManager = CLLocationManager()
        guard let locationManager = self.locationManager else {
            return
        }

        if CLLocationManager.locationServicesEnabled()
        {
            switch(CLLocationManager.authorizationStatus()) {
            case  .denied:
                print("No access")
                print("Location services denied")
                self.delegate!.tracingLocationDidFailWithError()
                
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
                if #available(iOS 14.0, *) {
                    if CLLocationManager.authorizationStatus() == .notDetermined
                    {
                        // you have 2 choice
                        // 1. requestAlwaysAuthorization
                        // 2. requestWhenInUseAuthorization
                        locationManager.requestWhenInUseAuthorization()
                    }
                    else if locationManager.accuracyAuthorization != .fullAccuracy
                    {
                        print("not fullAccuracy")
                    }
                    else //if locationManager.accuracyAuthorization != .fullAccuracy
                    {
                        print("fullAccuracy")
                    }
                } else {
                    // Fallback on earlier versions
                    if CLLocationManager.authorizationStatus() == .notDetermined
                    {
                        // you have 2 choice
                        // 1. requestAlwaysAuthorization
                        // 2. requestWhenInUseAuthorization
                        locationManager.requestWhenInUseAuthorization()
                    }
                }
                
                locationManager.desiredAccuracy = kCLLocationAccuracyBest // The accuracy of the location data
                locationManager.distanceFilter = 200 // The minimum distance (measured in meters) a device must move horizontally before an update event is generated.
                locationManager.delegate = self
                self.locationManager?.startUpdatingLocation()


            case .notDetermined:
                print("Location services notDetermined")
                
                if CLLocationManager.authorizationStatus() == .notDetermined
                {
                    // you have 2 choice
                    // 1. requestAlwaysAuthorization
                    // 2. requestWhenInUseAuthorization
                    locationManager.requestWhenInUseAuthorization()
                }
                
                locationManager.desiredAccuracy = kCLLocationAccuracyBest // The accuracy of the location data
                locationManager.distanceFilter = 200 // The minimum distance (measured in meters) a device must move horizontally before an update event is generated.
                locationManager.delegate = self
                self.locationManager?.startUpdatingLocation()

            case .restricted:
                print("Location services restricted")
                self.delegate!.tracingLocationDidFailWithError()
            }
        }
        else
        {
            print("Location services are not enabled")
            self.delegate!.tracingLocationDidFailWithError()
        }

    }
    
    @objc func stopUpdatingLocation() {
        print("Stop Location Updates")
        self.locationManager?.stopUpdatingLocation()
    }
    
    // Show Location Alert
    func ShowLocationAlert()
    {
        delegate?.tracingLocationDidFailWithError()
        self.delegate = nil

//        let topWindow = UIWindow(frame: UIScreen.main.bounds)
//        topWindow.rootViewController = UIViewController()
//        topWindow.windowLevel = UIWindow.Level.alert + 1
//        let alert = UIAlertController(title: "Turn On Location Services", message: "Allow FITPASS to use your location", preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "Settings", style: UIAlertAction.Style.default, handler: {(_ action: UIAlertAction) -> Void in
//
//            let settingsUrl = URL(string: UIApplication.openSettingsURLString)
////            UIApplication.shared.openURL(settingsUrl!)
//            UIApplication.shared.open(settingsUrl!, options: [:], completionHandler: nil)
//            topWindow.isHidden = true
//        }))
//
//
//        alert.addAction(UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.default, handler: {(_ action: UIAlertAction) -> Void in
//                self.delegate!.tracingLocationDidFailWithError()
//            }))
//
//
//
//        topWindow.makeKeyAndVisible()
//        topWindow.rootViewController?.present(alert, animated: true, completion: nil)

    }

    // CLLocationManagerDelegate
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

//        let timeinterval = -(locations.last?.timestamp.timeIntervalSinceNow)!
//        if (Int(timeinterval) > 5)
//        {return}
        
        guard let location = locations.last else {
            return
        }
        
        // singleton for get last(current) location
        currentLocation = location
        
        // use for real time update location
        updateLocation(location)
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        // do on error
        updateLocationDidFailWithError(error as NSError)
    }
    
    // Private function
    fileprivate func updateLocation(_ currentLocation: CLLocation){

        guard let delegate = self.delegate else {
            return
        }
        
        delegate.tracingLocation(currentLocation)
        self.delegate = nil
    }
    
    fileprivate func updateLocationDidFailWithError(_ error: NSError) {
        
        guard let delegate = self.delegate else {
            return
        }
        
//        delegate.tracingLocationDidFailWithError()
//        self.delegate = nil
    }
}
