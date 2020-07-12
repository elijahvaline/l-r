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
  let coordinate: CLLocationCoordinate2D
  
  init(title: String?, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.coordinate = coordinate
  }
}
