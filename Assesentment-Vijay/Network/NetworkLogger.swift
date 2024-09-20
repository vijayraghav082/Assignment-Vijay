//
//  AppDelegate.swift
//  Assesentment-Vijay
//
//  Created by Vijay Singh Raghav on 20/09/24.
//

import Foundation

class NetworkLogger {
     
    class func prettyPrint(json: Data?, request: URLRequest?, statusCode: Int)  {
        if let url = request?.url {
            print("URL: \(url)")
        }
        if let headerFields = request?.allHTTPHeaderFields {
            print("HeaderFields:  \(headerFields)")
        }
        if let data = request?.httpBody,
           !data.isEmpty {
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data)                
                let dataObject = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
                let string = String(data: dataObject, encoding: String.Encoding.utf8)
                if let string  = string {
                    print("Paramter \(string)")
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        
        do {
            if let json {
                let jsonObject = try JSONSerialization.jsonObject(with: json)
                let dataObject = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
                let string = String(data: dataObject, encoding: String.Encoding.utf8)
                if let string  = string {
                    print("Request: \(request?.url?.absoluteString ?? "") \n Responsse: \(statusCode) \n \(string)")
                }
            }
        } catch {
            print(error.localizedDescription)
        }       
    }
}

struct Console {
    static func log(_ any: Any?) {
        #if DEBUG
        print(any ?? "")
        #endif
    }
}
