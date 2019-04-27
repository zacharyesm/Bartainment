//
//  EntertainerViewController.swift
//  Bartainment
//
//  Created by Zack Esm on 4/27/19.
//  Copyright © 2019 HackFest. All rights reserved.
//

import MapKit
import UIKit

class EntertainerViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        // Set initial location
        let initLoc = CLLocation(latitude: 40.7589, longitude: -73.9845)
        centerMapOnLoc(location: initLoc)
    }
    
    let regionRadius: CLLocationDistance = 1000
    
    func centerMapOnLoc(location: CLLocation) {
        let coordRegion = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordRegion, animated: true)
    }

}
