//
//  LoadJson.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 11.08.2021.
//

import Foundation
import UIKit


/// Enum JsonLoader
public enum JsonLoader {
    /// The function readJsonData. For read data from JSON file.
    /// - Parameter name: name of file.
    /// - Parameter bundle: bundle for file searching
    /// - Parameter file: this is paramert for XCTFail
    /// - Parameter line: this is parametr for XCTFail
    public static func readJsonData(
        fromFileName name: String,
        in bundle: Bundle,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Data {
        do {
            let path = bundle.path(
                forResource: name,
                ofType: "json"
            )!
            return try String(contentsOfFile: path).data(using: .utf8)!
        } catch {
            let message = "Can't find the file \(name).json"
            print(message, file, line)
            fatalError()
        }
    }
    
    public static func readCodable<T>(
        fromFileName name: String,
        in bundle: Bundle,
        file: StaticString = #file,
        line: UInt = #line
    ) -> T
    where T: Codable
    {
        do {
            let jsonData = readJsonData(
                fromFileName: name,
                in: bundle,
                file: file,
                line: line
            )
            return try JSONDecoder().decode(T.self, from: jsonData)
        } catch {
            let message = "Can't load Json data from file \(name)."
            print(message, file, line)
            fatalError()
        }
    }
}
