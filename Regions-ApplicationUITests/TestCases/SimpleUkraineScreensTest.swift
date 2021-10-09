//
//  SimpleUkraineScreensTest.swift
//  Regions-ApplicationUITests
//
//  Created by Anton Smirnov on 09.10.2021.
//

import XCTest

class SimpleUkraineScreensTest: RegionsTestCase {
    
    func testSimpleScreens() throws {
        waitForElementToAppear(element: screens.rootScreen.root)
        screens.rootScreen.tapMenuButton()
        
        waitForElementToAppear(element: screens.rootScreen.root)
        screens.rootScreen.tapTableItem(item: "Ukraine")
        
        waitForElementToAppear(element: screens.rootScreen.root)
        screens.rootScreen.tapPersonButton()
        
        tapAlertButtonIfExists(named: "Got it!")
        
        waitForElementToAppear(element: screens.ukraineScreen.root)
        screens.ukraineScreen.enterRegionCode(code: "AI")
        
        waitForElementToAppear(element: screens.ukraineScreen.root)
        XCTAssert(screens.ukraineScreen.root.exists, "Киевская область")
    }
}
