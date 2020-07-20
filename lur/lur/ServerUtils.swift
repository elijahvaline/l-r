//
//  ServerUtils.swift
//  lur
//
//  Created by Elijah Valine on 7/19/20.
//  Copyright © 2020 Elijah Valine. All rights reserved.
//

import Foundation


class ServerUtils {
    
    //static let serverUrl = "http://192.168.86.24:8081";

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
    
    static func addFish(){
        // prepare json data
        
        let json: [String: Any] = ["date": "1/1/2020",
                                   "latitude": 1,
                                   "longitude": 1.0,
                                   "size" : 1,
                                   "type": 2]

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
