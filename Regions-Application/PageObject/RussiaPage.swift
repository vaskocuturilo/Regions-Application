//
//  RussiaPage.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 07.10.2021.
//

import Foundation
import XCTest

struct RussiaPage: Page {
    var application: XCUIApplication
    
    private enum Identifiers {
        static let regionField = "codeField"
    }
    
    func enterCountry(code: String) -> MessagePage {
        let regionCode = application.textFields[Identifiers.regionField]
        regionCode.tap()
        regionCode.typeText(code)
        
        return MessagePage(application: application)
    }
}
