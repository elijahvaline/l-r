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
            
            
            
            if (cluster.memberAnnotations.count == 2){
                
                var fish1 = cluster.memberAnnotations[0] as! FishCheckpoint
                var fish2 = cluster.memberAnnotations[1] as! FishCheckpoint
                
                var fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .regular))!
                var fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .regular))!
                
                var someProtocol2 = [String : Int]()
                someProtocol2["red"] = 1
                someProtocol2["blue"] = 2
                someProtocol2["green"] = 3
                someProtocol2["purple"] = 4
                someProtocol2["orange"] = 5
                
                
                
                if (someProtocol2[fish2.color!]! > someProtocol2[fish1.color!]!) {
                    
                    let placeholder = fish1
                    fish1 = fish2
                    fish2 = placeholder
                }
                
                
                switch (fish1.color){
                case "red":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .regular))!
                    break;
                case "blue":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .medium))!
                    break;
                case "orange":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .light))!
                    break;
                case "green":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .thin))!
                    break;
                case "purple":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .semibold))!
                    break;
                default:
                    break;
                }
                
                switch (fish2.color){
                case "red":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .regular))!
                    break;
                case "blue":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .medium))!
                    break;
                case "orange":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .light))!
                    break;
                case "green":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .thin))!
                    break;
                case "purple":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .semibold))!
                    break;
                default:
                    break;
                }
                
                annotationView.image = Merger.merge2(image1: fishAnnotation1, image2: fishAnnotation2)
                
            }
                
            else if (cluster.memberAnnotations.count == 3) {
                
                var fish1 = cluster.memberAnnotations[0] as! FishCheckpoint
                var fish2 = cluster.memberAnnotations[1] as! FishCheckpoint
                var fish3 = cluster.memberAnnotations[2] as! FishCheckpoint
                
                var fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .regular))!
                var fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .regular))!
                var fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .regular))!
                
                
                
                var someProtocol2 = [String : Int]()
                someProtocol2["red"] = 1
                someProtocol2["blue"] = 2
                someProtocol2["green"] = 3
                someProtocol2["purple"] = 4
                someProtocol2["orange"] = 5
                
                
                
                if (someProtocol2[fish2.color!]! > someProtocol2[fish1.color!]!) {
                    
                    let placeholder = fish1
                    fish1 = fish2
                    fish2 = placeholder
                }
                
                
                
                
                if (someProtocol2[fish3.color!]! > someProtocol2[fish2.color!]!) {
                    
                    let placeholder = fish2
                    fish2 = fish3
                    fish3 = placeholder
                }
                
                
                
                if (someProtocol2[fish2.color!]! > someProtocol2[fish1.color!]!) {
                    
                    let placeholder = fish1
                    fish1 = fish2
                    fish2 = placeholder
                }
                
                
                
                
                
                switch (fish1.color){
                case "red":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .regular))!
                    break;
                case "blue":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .medium))!
                    break;
                case "orange":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .light))!
                    break;
                case "green":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .thin))!
                    break;
                case "purple":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .semibold))!
                    break;
                default:
                    break;
                }
                
                switch (fish2.color){
                case "red":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .regular))!
                    break;
                case "blue":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .medium))!
                    break;
                case "orange":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .light))!
                    break;
                case "green":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .thin))!
                    break;
                case "purple":
                    fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .semibold))!
                    break;
                default:
                    break;
                }
                
                switch (fish3.color){
                case "red":
                    fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .regular))!
                    break;
                case "blue":
                    fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .medium))!
                    break;
                case "orange":
                    fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .light))!
                    break;
                case "green":
                    fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .thin))!
                    break;
                case "purple":
                    fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .semibold))!
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
                
                var num = cluster.memberAnnotations.count
                
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
                someProtocol.removeValue(forKey: third!.key)
                var forth = (someProtocol.max(by: { a, b in a.value < b.value }))
                someProtocol.removeValue(forKey: forth!.key)
                var fifth = (someProtocol.max(by: { a, b in a.value < b.value }))
                
                
                
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
                if (third!.value == forth!.value){
                    
                    if (someProtocol2[forth!.key]! > someProtocol2[third!.key]!) {
                        
                        let placeholder = third
                        third = forth
                        forth = placeholder
                    }
                    
                }
                if (forth!.value == fifth!.value){
                    
                    if (someProtocol2[fifth!.key]! > someProtocol2[forth!.key]!) {
                        
                        let placeholder = forth
                        forth = fifth
                        fifth = placeholder
                    }
                    
                }
                
                
                
                
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
                if (third!.value == forth!.value){
                    
                    if (someProtocol2[forth!.key]! > someProtocol2[third!.key]!) {
                        
                        let placeholder = third
                        third = forth
                        forth = placeholder
                    }
                    
                }
                
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
                
                if (first!.value == second!.value){
                    
                    if (someProtocol2[second!.key]! > someProtocol2[first!.key]!) {
                        
                        let placeholder = first
                        first = second
                        second = placeholder
                    }
                    
                }
                
                
                
                var fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .regular))!
                var fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .regular))!
                var fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .regular))!
                
                switch (first?.key){
                case "red":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .regular))!
                    break;
                case "blue":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .medium))!
                    break;
                case "orange":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .light))!
                    break;
                case "green":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .thin))!
                    break;
                case "purple":
                    fishAnnotation1 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .semibold))!
                    break;
                default:
                    break;
                }
                if (second?.value != 0){
                    switch (second!.key){
                    case "red":
                        fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .regular))!
                        break;
                    case "blue":
                        fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .medium))!
                        break;
                    case "orange":
                        fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .light))!
                        break;
                    case "green":
                        fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .thin))!
                        break;
                    case "purple":
                        fishAnnotation2 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .semibold))!
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
                        fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .regular))!
                        break;
                    case "blue":
                        fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .medium))!
                        break;
                    case "orange":
                        fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .light))!
                        break;
                    case "green":
                        fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .thin))!
                        break;
                    case "purple":
                        fishAnnotation3 = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .semibold))!
                        break;
                    default:
                        break;
                    }
                    
                }
                else{
                    fishAnnotation3 = fishAnnotation1
                }
                
                
                annotationView.image = Merger.mergeMas(image1: fishAnnotation1, image2: fishAnnotation2, image3: fishAnnotation3, number: num)
                
                
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
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 30, weight: .medium))!
                    break;
                case "huge":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .medium))!
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
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular))!
                    break;
                case "huge":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .regular))!
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
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 30, weight: .thin))!
                    break;
                case "huge":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .thin))!
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
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 30, weight: .semibold))!
                    break;
                case "huge":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .semibold))!
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
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 30, weight: .light))!
                    break;
                case "huge":
                    annotationView.image = UIImage(named: "fishy.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 35, weight: .light))!
                    break;
                default:
                    break;
                }
                break;
                
            default:
                break;
                
            }
            
            annotationView.image = annotationView.image?.addingShadow(shadowColor: UIColor(white: 0, alpha: 0.1 ), offset: CGSize(width: -1, height: -1))
        }
        return annotationView
        
    }
}
class Merger: UIImage {
    
    
    static func merge2(image1:UIImage, image2:UIImage) -> UIImage{
       
                var bottomImage = image2.addingShadow()
                
                var topImage = image1.addingShadow()

                
                let size = CGSize(width: image1.size.width + 20, height: image1.size.height + 15)
                UIGraphicsBeginImageContextWithOptions(size, false, 2.0)
                
                let bottomAreaSize = CGRect(x: 0, y: 0, width: (bottomImage.size.width), height: (bottomImage.size.height))
                bottomImage.draw(in: bottomAreaSize, blendMode: .normal, alpha: 1)
       
                let topAreaSize = CGRect(x: 7, y: 7, width: (topImage.size.width), height: (topImage.size.height))
                       topImage.draw(in: topAreaSize, blendMode: .normal, alpha: 1)
        var newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
        
    }
    
    static func merge3(image1:UIImage, image2:UIImage, image3:UIImage) -> UIImage{
         
                var bottomImage = image3.addingShadow()
                var middleImage = image2.addingShadow()
                var topImage = image1.addingShadow()

                
                let size = CGSize(width: image1.size.width + 20, height: image1.size.height + 15)
                UIGraphicsBeginImageContextWithOptions(size, false, 2.0)
                
                let bottomAreaSize = CGRect(x: 0, y: 0, width: (bottomImage.size.width), height: (bottomImage.size.height))
                bottomImage.draw(in: bottomAreaSize, blendMode: .normal, alpha: 1)
                
                let middleAreaSize = CGRect(x:7, y: 7, width: (middleImage.size.width), height: (middleImage.size.height))
                middleImage.draw(in: middleAreaSize, blendMode: .normal, alpha: 1)
                let topAreaSize = CGRect(x: 14, y: 14, width: (topImage.size.width), height: (topImage.size.height))
                       topImage.draw(in: topAreaSize, blendMode: .normal, alpha: 1)
        var newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
        
    }
    
    static func mergeMas(image1:UIImage, image2:UIImage, image3:UIImage, number:Int) -> UIImage{
        
        var spacing = 55.5
        if (number > 9){
            spacing = 55
        }
        else{
            spacing = 55.5
        }
        
        
        var bottomImage = image3.addingShadow()
        var middleImage = image2.addingShadow()
        var topImage = image1.addingShadow()
        
        let size = CGSize(width: image1.size.width + 20, height: image1.size.height + 15)
        UIGraphicsBeginImageContextWithOptions(size, false, 2.0)
        
        let bottomAreaSize = CGRect(x: 0, y: 0, width: (bottomImage.size.width), height: (bottomImage.size.height))
        bottomImage.draw(in: bottomAreaSize, blendMode: .normal, alpha: 1)
        
        let middleAreaSize = CGRect(x:7, y: 7, width: (middleImage.size.width), height: (middleImage.size.height))
        middleImage.draw(in: middleAreaSize, blendMode: .normal, alpha: 1)
        let topAreaSize = CGRect(x: 14, y: 14, width: (topImage.size.width), height: (topImage.size.height))
               topImage.draw(in: topAreaSize, blendMode: .normal, alpha: 1)
        
        var circle:UIImage = UIImage(named: "circlie.fill", in: .none, with: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular))!
        
        var text = String(number)
        
       let font=UIFont(name: "HelveticaNeue", size: 10)!
       let text_style=NSMutableParagraphStyle()
       text_style.alignment=NSTextAlignment.center
       let text_color=UIColor.white
       let attributes=[NSAttributedString.Key.font:font, NSAttributedString.Key.paragraphStyle:text_style, NSAttributedString.Key.foregroundColor:text_color]

        
        let circleAreaSize = CGRect(x: 55, y: 3, width: (circle.size.width), height: (circle.size.height))
        circle.draw(in: circleAreaSize, blendMode: .normal, alpha: 1)
        
        let textAreaSize = CGRect(x: CGFloat(spacing), y: 8, width: (circle.size.width), height: (circle.size.height))
        text.draw(in: textAreaSize, withAttributes: attributes)
        
        
        var newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
        
    }
    
}


extension UIImage{
    
    func addingShadow(blur: CGFloat = 3, shadowColor: UIColor = UIColor(white: 0, alpha: 0.35 ), offset: CGSize = CGSize(width: -1, height: -1) ) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: size.width + 2 * blur, height: size.height + 2 * blur), false, 2)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setShadow(offset: offset, blur: blur, color: shadowColor.cgColor)
        draw(in: CGRect(x: blur - offset.width / 2, y: blur - offset.height / 2, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        return image
    }
    
}





