//
//  FishCheckpoint.swift
//  lur
//
//  Created by Elijah Valine on 7/8/20.
//  Copyright © 2020 Elijah Valine. All rights reserved.
//

import Foundation
import MapKit

final class FishCheckpoint: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    let color: String?
    
    init(title: String?,
         subtitle: String?,
         coordinate: CLLocationCoordinate2D, color: String?) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.color = color
    }
}

