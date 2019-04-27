//
//  EntertainerViewController.swift
//  Bartainment
//
//  Created by Zack Esm on 4/27/19.
//  Copyright © 2019 HackFest. All rights reserved.
//

import GooglePlaces
import MapKit
import UIKit

class EntertainerViewController: UIViewController {
    
    var placesClient: GMSPlacesClient!

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        // Set up google places client
        placesClient = GMSPlacesClient.shared()
        
        // Set initial location
        let initLoc = CLLocation(latitude: 40.7589, longitude: -73.9845)
        centerMapOnLoc(location: initLoc)
        
        // Add bar annotations
        let testLoc = CLLocation(latitude: 40.763470, longitude: -73.979780)
        let bar = Bar(name: "Black Tap", address: "136 W 55th St", coordinate: testLoc.coordinate)
        mapView.addAnnotation(bar)
    }
    
    let regionRadius: CLLocationDistance = 1000
    
    func centerMapOnLoc(location: CLLocation) {
        let coordRegion = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordRegion, animated: true)
    }

}
