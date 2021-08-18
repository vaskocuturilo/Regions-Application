//
//  APIServices.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 11.08.2021.
//

import Foundation
import Alamofire

class APIServices {
    
    public func responseRegion(endpoints: String, region: String, completionHandler: @escaping (Bool, String) -> ()) {
        let parameters: Parameters = [
            "region": region
        ]
        
        AF.request(endpoints, parameters: parameters).response { response in
            switch (response.result) {
            case .success( let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    let region = (json as AnyObject).value(forKey: "description") as! String
                    if response.response?.statusCode == 200 {
                        completionHandler(true, region)
                    } else {
                        completionHandler(false,region)
                    }
                } catch let error as NSError {
                    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                        completionHandler(false, utf8Text)
                    }else {
                        completionHandler(false, error.localizedDescription)
                        
                    }
                }
                break
                
            case .failure(let error):
                print("Request error: \(error.localizedDescription)")
                completionHandler(false, error.localizedDescription)
                break
            }
        }
    }
}
