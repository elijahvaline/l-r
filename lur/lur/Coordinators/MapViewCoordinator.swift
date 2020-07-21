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
        
        let identifier = "Hello"
        var annotationView = MKAnnotationView()
        if (annotation.title == "My Location"){
            return nil
        }
        annotationView.canShowCallout = true
        
        
        annotationView.canShowCallout = true
        annotationView.image = UIImage(named: "Bluefish")
        
        //
        
        //        var annotationView = MKMarkerAnnotationView()
        //                   annotationView.canShowCallout = true
        //
        //
        //            annotationView.markerTintColor = .some(.systemBlue)
        //            annotationView.glyphImage = UIImage(named: "fish")
        
        
        
        

        annotationView.clusteringIdentifier = identifier

        return annotationView
        
    }
}


