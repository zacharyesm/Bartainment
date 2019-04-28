//
//  EntertainerViewController.swift
//  Bartainment
//
//  Created by Zack Esm on 4/27/19.
//  Copyright © 2019 HackFest. All rights reserved.
//

import CoreLocation
import GooglePlaces
import MapKit
import UIKit

class EntertainerViewController: UIViewController, CLLocationManagerDelegate {
    
    var placesClient: GMSPlacesClient!
    var locationManager: CLLocationManager?

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Request location permission
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()

        view.backgroundColor = .black
        
        // Set up google places client
        placesClient = GMSPlacesClient.shared()
        
        // Set initial location
        let initLoc = CLLocation(latitude: 40.7589, longitude: -73.9845)
        centerMapOnLoc(location: initLoc)
        mapView.delegate = self
        
        // Add bar annotations
//        let testLoc = CLLocation(latitude: 40.763470, longitude: -73.979780)
//        let bar = Bar(name: "Black Tap", address: "136 W 55th St", coordinate: testLoc.coordinate)
//        mapView.addAnnotation(bar)
    }
    
    let regionRadius: CLLocationDistance = 1000
    
    func centerMapOnLoc(location: CLLocation) {
        let coordRegion = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordRegion, animated: true)
    }

    @IBAction func getCurrentPlace(_ sender: UIButton) {
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) | UInt(GMSPlaceField.formattedAddress.rawValue) | UInt(GMSPlaceField.coordinate.rawValue))!
        
        placesClient?.findPlaceLikelihoodsFromCurrentLocation(withPlaceFields: fields, callback: { (placeLikelihoodList: Array<GMSPlaceLikelihood>?, error: Error?) -> Void in
            if let error = error {
                print("Current Place Error: \(error.localizedDescription)")
                return
            }
            
            if let placeLikelihoodList = placeLikelihoodList {
                let firstCoord = placeLikelihoodList.first?.place.coordinate
                let newCenter = CLLocation(latitude: firstCoord?.latitude ?? 40.7589, longitude: firstCoord?.longitude ?? -73.9845)
                self.centerMapOnLoc(location: newCenter)
                
                for likelihood in placeLikelihoodList {
                    let place = likelihood.place
//                    print(place)
                    guard let name = place.name, let addr = place.formattedAddress else {continue}
                    let bar = Bar(name: name, address: addr, coordinate: place.coordinate)
                    self.mapView.addAnnotation(bar)
                }
            }
        })
    }
}

extension EntertainerViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("Location selected")
    }
}
