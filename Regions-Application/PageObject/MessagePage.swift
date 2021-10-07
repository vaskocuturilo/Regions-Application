//
//  MessagePage.swift
//  Regions-ApplicationUITests
//
//  Created by Anton Smirnov on 07.10.2021.
//

import Foundation
import XCTest

struct MessagePage: Page {
    let application: XCUIApplication
    
    func checkMessage(message: String) -> Self {
        let message = application.staticTexts[message]
        XCTAssertTrue(message.waitForExistence(timeout: 5))
        
        return self
    }
}
