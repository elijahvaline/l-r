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
        
        var annotationView = MKAnnotationView()
        if (annotation.title == "My Location"){
            return nil
        }
        
        annotationView.canShowCallout = true
    
        annotationView.canShowCallout = true
        
        let identifier = "Hello"
                 annotationView.clusteringIdentifier = identifier
        
    
        if let cluster = annotation as? MKClusterAnnotation {
            annotationView.image = UIImage(named: "Bluefish")
        } else{
             annotationView.image = UIImage(named: "Fish")
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


