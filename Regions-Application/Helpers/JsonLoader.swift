//
//  JsonLoader.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 15.08.2021.
//

import Foundation
import UIKit

struct RegionsInfo: Decodable {
    let regions: [Region]
}
struct Region: Codable {
    
    let region: String
    
    let description: String
}

class JsonLoader {
    let messages = Messages()
    
    func loadSpeciesInfoJSOn(resource: String, label: UILabel, text: String) {
        if let filePath = Bundle.main.url(forResource: resource, withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: filePath)
                let decoder = JSONDecoder()
                let speciesInfo = try decoder.decode(RegionsInfo.self, from: data)
                let speciesList = speciesInfo.regions
                
                let result = speciesList.first {$0.region == text}
                
                if result?.description == nil {
                    label.text = "Region not found."
                } else {
                    label.text = result?.description
                }
                
            } catch {
                messages.showErrorMessage(message: "Can not load JSON file.")
            }
        }
    }
    
    func scanRegionForRussia(resource: String, textView: UITextView, text: String) {
        if let filePath = Bundle.main.url(forResource: resource, withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: filePath)
                let decoder = JSONDecoder()
                let speciesInfo = try decoder.decode(RegionsInfo.self, from: data)
                let speciesList = speciesInfo.regions
                
                let result = speciesList.first {$0.region == text}
                
                if result?.description == nil {
                    textView.text = "Region not found."
                } else {
                    textView.text = "The region is: " + result!.description
                }
                
            } catch {
                messages.showErrorMessage(message: "Can not load JSON file.")
            }
        }
    }
}
