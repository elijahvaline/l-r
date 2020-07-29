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
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        
        let annotationView = MKAnnotationView()
        annotationView.canShowCallout = true
        let identifier = "Hello"
        annotationView.clusteringIdentifier = identifier
        
        
        if (annotation.title == "My Location"){
            return nil
        }
        
        
        if let cluster = annotation as? MKClusterAnnotation {
            
            
            print(cluster.memberAnnotations.count)
            if (cluster.memberAnnotations.count == 2){
                
                let fish1 = cluster.memberAnnotations[0] as! FishCheckpoint
                let fish2 = cluster.memberAnnotations[1] as! FishCheckpoint
                
                annotationView.image = Merger.merge2(image1: fish2.color!.capitalized + "FishMedium", image2: fish1.color!.capitalized + "FishBig")
            }
            else {
                annotationView.image = UIImage(named: "School")
            }
            
            
        } else{
            
            let sirFishy = annotation as! FishCheckpoint
            
            switch(sirFishy.color) {
                
            case "blue":
                
                switch(sirFishy.size){
                case "big":
                    annotationView.image = UIImage(named: "BlueFishSmall")
                    break;
                case "bigger":
                    annotationView.image = UIImage(named: "BlueFishMedium")
                    break;
                case "huge":
                    annotationView.image = UIImage(named: "BlueFishBig")
                    break;
                default:
                    break;
                }
                break;
                
            case "red":
                
                switch(sirFishy.size){
                case "big":
                    annotationView.image = UIImage(named: "RedFishSmall")
                    break;
                case "bigger":
                    annotationView.image = UIImage(named: "RedFishMedium")
                    break;
                case "huge":
                    annotationView.image = UIImage(named: "RedFishBig")
                    break;
                default:
                    break;
                }
                break;
                
            case "green":
                
                switch(sirFishy.size){
                case "big":
                    annotationView.image = UIImage(named: "GreenFishSmall")
                    break;
                case "bigger":
                    annotationView.image = UIImage(named: "GreenFishMedium")
                    break;
                case "huge":
                    annotationView.image = UIImage(named: "GreenFishBig")
                    break;
                default:
                    break;
                }
                break;
                
            case "purple":
                
                switch(sirFishy.size){
                case "big":
                    annotationView.image = UIImage(named: "PurpleFishSmall")
                    break;
                case "bigger":
                    annotationView.image = UIImage(named: "PurpleFishMedium")
                    break;
                case "huge":
                    annotationView.image = UIImage(named: "PurpleFishBig")
                    break;
                default:
                    break;
                }
                break;
                
            case "orange":
                
                switch(sirFishy.size){
                case "big":
                    annotationView.image = UIImage(named: "OrangeFishSmall")
                    break;
                case "bigger":
                    annotationView.image = UIImage(named: "OrangeFishMedium")
                    break;
                case "huge":
                    annotationView.image = UIImage(named: "OrangeFishBig")
                    break;
                default:
                    break;
                }
                break;
                
            default:
                break;
                
            }
            
            
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

class Merger {
    
    
     static func merge2(image1:String, image2:String) -> UIImage{
            
            var bottomImage = UIImage(named: image1)
            var topImage = UIImage(named: image2)
            
            var size = CGSize(width: 350, height: 210)
            UIGraphicsBeginImageContext(size)
                
            print((bottomImage?.size.width)!)
            print((bottomImage?.size.height)!)
            let bottomAreaSize = CGRect(x: 160, y: 0, width: (bottomImage?.size.width)!, height: (bottomImage?.size.height)!)
            bottomImage!.draw(in: bottomAreaSize, blendMode: .normal, alpha: 1)
            
            let topAreaSize = CGRect(x: 0, y: 55, width: (topImage?.size.width)!, height: (topImage?.size.height)!)
            topImage!.draw(in: topAreaSize, blendMode: .normal, alpha: 1)
            
            var newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            
            return newImage
        }
}





