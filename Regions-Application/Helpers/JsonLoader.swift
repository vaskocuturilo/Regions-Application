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
    
    func loadSpeciesInfoJSOn(label: UILabel, text: String) {
        if let filePath = Bundle.main.url(forResource: "russia", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: filePath)
                let decoder = JSONDecoder()
                let speciesInfo = try decoder.decode(RegionsInfo.self, from: data)
                let speciesList = speciesInfo.regions
                
                let result = speciesList.compactMap {$0.code.contains(text) ? $0.name : nil }
                
                label.text = result.joined(separator: ",")
                
            } catch {
                messages.showErrorMessage(message: "Can not load JSON file.")
            }
        }
    }
}
