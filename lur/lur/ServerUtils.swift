//
//  ServerUtils.swift
//  lur
//
//  Created by Elijah Valine on 7/19/20.
//  Copyright © 2020 Elijah Valine. All rights reserved.
//

import Foundation


class ServerUtils {
    
    func getServerHelloWorld(returnWith: @escaping (String)->()) {
        let session = URLSession.shared
        if let url = URL(string: "http://192.168.86.24:8081/") {
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
    
    func getServerVersion(returnWith: @escaping (String)->()) {
           let session = URLSession.shared
           if let url = URL(string: "http://192.168.86.24:8081/version") {
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
}
