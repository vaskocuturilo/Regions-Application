//
//  SimplePageObjectTest.swift
//  Regions-ApplicationUITests
//
//  Created by Anton Smirnov on 07.10.2021.
//

import XCTest
import Foundation

class SimplePageObjectTest: BaseCase {
    
    func testSimplePageObject() throws {
        
    MainPage(application: application)
        .tapPersonButton()
        .enterCountry(code: "29")
        .checkMessage(message: "Архангельская область")
    }
}
