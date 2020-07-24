//
//  ServerUtils.swift
//  lur
//
//  Created by Elijah Valine on 7/19/20.
//  Copyright © 2020 Elijah Valine. All rights reserved.
//

import Foundation


struct DataSet: Decodable {
    
    struct SingleFish: Decodable{
        let id: Int
        let date: String
        let latitude: Double
        let longitude: Double
        let size: Int
        let type: Int
    }
    
    let fish: [SingleFish]
}

class ServerUtils {
    //pi
    //    static let serverUrl = "http://192.168.86.24:8081";
    //mac
    static let serverUrl = "http://192.168.86.36:8081";
    
    static func getServerHelloWorld(returnWith: @escaping (String)->()) {
        let session = URLSession.shared
        if let url = URL(string: serverUrl) {
            let task = session.dataTask(with: url, completionHandler: { data, response, error in
                // Check the response
                print(error)
                print(response)
                if let dataString = String(data: data!, encoding: .utf8) {
                    returnWith(dataString)
                }
                
            })
            task.resume()
        }
    }
    
    static func getServerVersion(returnWith: @escaping (String)->()) {
        let session = URLSession.shared
        if let url = URL(string: serverUrl + "/version") {
            let task = session.dataTask(with: url, completionHandler: { data, response, error in
                // Check the response
                print(error)
                print(response)
                if let dataString = String(data: data!, encoding: .utf8) {
                    returnWith(dataString)
                }
                
            })
            task.resume()
        }
    }
    
    static func getFish(returnWith: @escaping (DataSet)->()) {
        
        
        let session = URLSession.shared
        let decoder = JSONDecoder()
        
        
        if let url = URL(string: serverUrl + "/getFish") {
            
            
            
            let task = session.dataTask(with: url, completionHandler: { data1, response, error in
                print("here")
                
                print(error)
                print(response)
                
                if let dataString = String(data: data1!, encoding: .utf8) {
                    print(dataString)
                    
                    do {
                        
                        let fishSet = try decoder.decode(DataSet.self, from: Data(dataString.utf8))
                        returnWith(fishSet)
                        
                    }
                        
                    catch let jsonError {
                        print("Error Serializing JSON", jsonError)
                    }
                }
                
            })
            print("notThere")
            task.resume()
        }
    }
    
    static func addFish(fishLatitude:Double, fishLongitude:Double, fishType:Int, fishSize:Int ){
        // prepare json data
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        let todaysDate:String = formatter.string(from: today)
        
        let json: [String: Any] = ["date": todaysDate,
                                   "latitude": fishLatitude,
                                   "longitude": fishLongitude,
                                   "size" : fishSize,
                                   "type": fishType]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: serverUrl + "/addFish")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // insert json data to the request
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        
        task.resume()
    }
}
