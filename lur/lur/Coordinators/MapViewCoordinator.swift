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
                
                var fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .regular))!
                var fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .regular))!
                
                switch (fish1.color){
                case "red":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .regular))!
                    break;
                case "blue":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .medium))!
                    break;
                case "orange":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .light))!
                    break;
                case "green":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .thin))!
                    break;
                case "purple":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 445, weight: .semibold))!
                    break;
                default:
                    break;
                }
                
                switch (fish2.color){
                case "red":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .regular))!
                    break;
                case "blue":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .medium))!
                    break;
                case "orange":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .light))!
                    break;
                case "green":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .thin))!
                    break;
                case "purple":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .semibold))!
                    break;
                default:
                    break;
                }
                
                annotationView.image = Merger.merge2(image1: fishAnnotation1, image2: fishAnnotation2)
                
            }
                
            else if (cluster.memberAnnotations.count == 3) {
                
                let fish1 = cluster.memberAnnotations[0] as! FishCheckpoint
                let fish2 = cluster.memberAnnotations[1] as! FishCheckpoint
                let fish3 = cluster.memberAnnotations[2] as! FishCheckpoint
                
                var fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .regular))!
                var fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .regular))!
                var fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .regular))!
                
                switch (fish1.color){
                case "red":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .regular))!
                    break;
                case "blue":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .medium))!
                    break;
                case "orange":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .light))!
                    break;
                case "green":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .thin))!
                    break;
                case "purple":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .semibold))!
                    break;
                default:
                    break;
                }
                
                switch (fish2.color){
                case "red":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .regular))!
                    break;
                case "blue":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .medium))!
                    break;
                case "orange":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .light))!
                    break;
                case "green":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .thin))!
                    break;
                case "purple":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .semibold))!
                    break;
                default:
                    break;
                }
                
                switch (fish3.color){
                case "red":
                    fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .regular))!
                    break;
                case "blue":
                    fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .medium))!
                    break;
                case "orange":
                    fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .light))!
                    break;
                case "green":
                    fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .thin))!
                    break;
                case "purple":
                    fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .semibold))!
                    break;
                default:
                    break;
                }
                
                
                annotationView.image = Merger.merge3(image1: fishAnnotation1, image2: fishAnnotation2, image3: fishAnnotation3)
                
            }
            
            else{
                var someProtocol = [String : Int]()
                someProtocol["red"] = 0
                someProtocol["blue"] = 0
                someProtocol["green"] = 0
                someProtocol["purple"] = 0
                someProtocol["orange"] = 0
                
                
                var someProtocol2 = [String : Int]()
                someProtocol2["red"] = 1
                someProtocol2["blue"] = 2
                someProtocol2["green"] = 3
                someProtocol2["purple"] = 4
                someProtocol2["orange"] = 5
                
                for n in 0...cluster.memberAnnotations.count - 1{
                    var fish = cluster.memberAnnotations[n] as! FishCheckpoint
                    
                    switch (fish.color) {
                    case "red":
                        someProtocol["red"]! += 1
                        break;
                    case "blue":
                        someProtocol["blue"]! += 1
                        break;
                    case "green":
                        someProtocol["green"]! += 1
                        break;
                    case "purple":
                        someProtocol["purple"]! += 1
                        break;
                    case "orange":
                        someProtocol["orange"]! += 1
                        break;
                    default:
                        break;
                    }

                }
                var first = (someProtocol.max(by: { a, b in a.value < b.value }))
                someProtocol.removeValue(forKey: first!.key)
                var second = (someProtocol.max(by: { a, b in a.value < b.value }))
                someProtocol.removeValue(forKey: second!.key)
                var third = (someProtocol.max(by: { a, b in a.value < b.value }))
                
                if (first!.value == second!.value){
                    
                    if (someProtocol2[second!.key]! > someProtocol2[first!.key]!) {
                        
                        let placeholder = first
                        first = second
                        second = placeholder
                    }
                    
                }
                if (second!.value == third!.value){
                    
                    if (someProtocol2[third!.key]! > someProtocol2[second!.key]!) {
                        
                        let placeholder = second
                        second = third
                        third = placeholder
                    }
                    
                }
                
                
                
                
                var fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .regular))!
                var fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .regular))!
                var fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .regular))!
                
                switch (first?.key){
                case "red":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .regular))!
                    break;
                case "blue":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .medium))!
                    break;
                case "orange":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .light))!
                    break;
                case "green":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .thin))!
                    break;
                case "purple":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .semibold))!
                    break;
                default:
                    break;
                }
                if (second?.value != 0){
                    switch (second!.key){
                case "red":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .regular))!
                    break;
                case "blue":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .medium))!
                    break;
                case "orange":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .light))!
                    break;
                case "green":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .thin))!
                    break;
                case "purple":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .semibold))!
                    break;
                default:
                    break;
                }
                }
                else{
                    fishAnnotation2 = fishAnnotation1
                }
                
                if (third?.value != 0){
                    
                    switch (third?.key){
                    case "red":
                        fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .regular))!
                        break;
                    case "blue":
                        fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .medium))!
                        break;
                    case "orange":
                        fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .light))!
                        break;
                    case "green":
                        fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .thin))!
                        break;
                    case "purple":
                        fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .semibold))!
                        break;
                    default:
                        break;
                    }
                    
                }
                else{
                    fishAnnotation3 = fishAnnotation1
                }
                
                
                annotationView.image = Merger.merge3(image1: fishAnnotation1, image2: fishAnnotation2, image3: fishAnnotation3)
                
                
            }
            
            
        } else{
            
            let sirFishy = annotation as! FishCheckpoint
            
            switch(sirFishy.color) {
                
            case "blue":
                
                switch(sirFishy.size){
                case "big":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 25, weight: .medium))!
                    break;
                case "bigger":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .medium))!
                    break;
                case "huge":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .medium))!
                    break;
                default:
                    break;
                }
                break;
                
            case "red":
                
                switch(sirFishy.size){
                case "big":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 25, weight: .regular))!
                    break;
                case "bigger":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 25, weight: .regular))!
                    break;
                case "huge":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 25, weight: .regular))!
                    break;
                default:
                    break;
                }
                break;
                
            case "green":
                
                switch(sirFishy.size){
                case "big":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 25, weight: .thin))!
                    break;
                case "bigger":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .thin))!
                    break;
                case "huge":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .thin))!
                    break;
                default:
                    break;
                }
                break;
                
            case "purple":
                
                switch(sirFishy.size){
                case "big":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 25, weight: .semibold))!
                    break;
                case "bigger":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 25, weight: .semibold))!
                    break;
                case "huge":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 25, weight: .semibold))!
                    break;
                default:
                    break;
                }
                break;
                
            case "orange":
                
                switch(sirFishy.size){
                case "big":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 25, weight: .light))!
                    break;
                case "bigger":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .light))!
                    break;
                case "huge":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 45, weight: .light))!
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
        
    }
}
class Merger: UIImage {
    
    
    static func merge2(image1:UIImage, image2:UIImage) -> UIImage{
        
        var bottomImage = image2
        let topImage = image1
        
        let bottomConfig:UIImage.SymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 35)
        bottomImage = bottomImage.applyingSymbolConfiguration(bottomConfig)!
        
        
        let size = CGSize(width: image1.size.width + 45, height: image1.size.height + 10)
        UIGraphicsBeginImageContextWithOptions(size, false, 2.0)
        
        print((bottomImage.size.width))
        print((bottomImage.size.height))
        let bottomAreaSize = CGRect(x: 60, y: 0, width: (bottomImage.size.width), height: (bottomImage.size.height))
        bottomImage.draw(in: bottomAreaSize, blendMode: .normal, alpha: 1)
        
        let topAreaSize = CGRect(x: 0, y: 10, width: (topImage.size.width), height: (topImage.size.height))
        topImage.draw(in: topAreaSize, blendMode: .normal, alpha: 1)
        
        var newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
        
    }
    
    static func merge3(image1:UIImage, image2:UIImage, image3:UIImage) -> UIImage{
        
        var bottomImage = image2
        var middleImage = image3
        let topImage = image1
        
        let bottomConfig:UIImage.SymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 35)
        
        let middleConfig:UIImage.SymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 25)
        
        middleImage = middleImage.applyingSymbolConfiguration(middleConfig)!
        bottomImage = bottomImage.applyingSymbolConfiguration(bottomConfig)!
        
        
        let size = CGSize(width: image1.size.width + 45, height: image1.size.height + 25)
        UIGraphicsBeginImageContextWithOptions(size, false, 2.0)
        
        print((bottomImage.size.width))
        print((bottomImage.size.height))
        let bottomAreaSize = CGRect(x: 60, y: 15, width: (bottomImage.size.width), height: (bottomImage.size.height))
        bottomImage.draw(in: bottomAreaSize, blendMode: .normal, alpha: 1)
        
        let middleAreaSize = CGRect(x: 30, y: 0, width: (middleImage.size.width), height: (middleImage.size.height))
        middleImage.draw(in: middleAreaSize, blendMode: .normal, alpha: 1)
        
        
        
        let topAreaSize = CGRect(x: 0, y: 25, width: (topImage.size.width), height: (topImage.size.height))
        topImage.draw(in: topAreaSize, blendMode: .normal, alpha: 1)
        
        var newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
        
    }
    
}




