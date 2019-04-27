//
//  Bar.swift
//  Bartainment
//
//  Created by Marco White on 4/27/19.
//  Copyright © 2019 HackFest. All rights reserved.
//

import Foundation
import MapKit

class Bar: NSObject, MKAnnotation {
    let name: String
    let address: String
    let coordinate: CLLocationCoordinate2D
    
    init(name: String, address: String, coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.address = address
        self.coordinate = coordinate
        
        super.init()
    }
}
