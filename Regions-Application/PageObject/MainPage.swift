//
//  MainPage.swift
//  Regions-ApplicationUITests
//
//  Created by Anton Smirnov on 07.10.2021.
//

import Foundation
import XCTest

struct MainPage: Page {
    var application: XCUIApplication
    
    private enum Identifiers {
        static let personButton = "Person auto number"
    }
    
    func tapPersonButton() -> RussiaPage {
        application.staticTexts[Identifiers.personButton].tap()
        
        return RussiaPage(application: application)
    }
}
