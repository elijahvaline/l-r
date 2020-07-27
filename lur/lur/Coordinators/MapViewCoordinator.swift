//
//  MapViewCoordinator.swift
//  lur
//
//  Created by Elijah Valine on 7/20/20.
//  Copyright © 2020 Elijah Valine. All rights reserved.
//

import Foundation
import MapKit



class MapViewCoordinator: NSObject, MKMapViewDelegate{
    
    var mapViewController: MapViewAdvance
    
    init(_ control: MapViewAdvance){
        
        self.mapViewController = control
    }
    
    func mapView(_ mapView: MKMapView, viewFor
        
        annotation: MKAnnotation) -> MKAnnotationView?{
        
        let annotationView = MKAnnotationView()
        annotationView.canShowCallout = true
        let identifier = "Hello"
        annotationView.clusteringIdentifier = identifier
        
        if (annotation.title == "My Location"){
            return nil
        }
 
        if let cluster = annotation as? MKClusterAnnotation {
            annotationView.image = UIImage(named: "School")
        } else{
            annotationView.image = UIImage(named: "Bluefish")
        }
        return annotationView
        
        
        
        //
        
        //        var annotationView = MKMarkerAnnotationView()
        //                   annotationView.canShowCallout = true
        //
        //
        //            annotationView.markerTintColor = .some(.systemBlue)
        //            annotationView.glyphImage = UIImage(named: "fish")
        
    }
}


