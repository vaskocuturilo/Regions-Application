//
//  SimpleRussiaScreensTest.swift
//  Regions-ApplicationUITests
//
//  Created by Anton Smirnov on 08.10.2021.
//

import XCTest

class SimpleRussiaScreensTest: RegionsTestCase {
    
    func testSimpleScreens() throws {
        
        waitForElementToAppear(element: screens.rootScreen.root)
        screens.rootScreen.tapPersonButton()
        
        tapAlertButtonIfExists(named: "Got it!")
        
        waitForElementToAppear(element: screens.russiaScreen.root)
        screens.russiaScreen.enterRegionCode(code: "29")
        
        waitForElementToAppear(element: screens.russiaScreen.root)
        XCTAssert(screens.russiaScreen.root.exists, "Архангельская область")
    }
}
