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
    
    let code: String
    
    let name: String
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
                
                let result = speciesList.first {$0.code == text}
                
                label.text = result?.name
                
            } catch {
                messages.showErrorMessage(message: "Can not load JSON file.")
            }
        }
    }
}
