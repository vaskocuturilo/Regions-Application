//
//  RegionsTestCase.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 08.10.2021.
//

import Foundation
import XCTest

class RegionsTestCase: XCTestCase {
    
    private let container = RegionsTestCaseContainer()
    
    private let springboardApplication = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    
    func launch() {
        container.application.launchEnvironment["dst_autotest_mode"] = "true"
        container.application.launchArguments.append("-DST_CLEAN_STATE")
        container.application.launch()
    }
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        launch()
    }
    
    override func tearDown() {
        terminate()
        super.tearDown()
    }
    
    func terminate() {
        container.application.terminate()
    }
    
    var screenWaitingSeconds: TimeInterval {
        return 15
    }
    
    var application: XCUIApplication {
        return container.application
    }
    
    var screens: RegionsScreens {
        return container.screens
    }
    
    public func waitForElementToAppear(element: XCUIElement, timeout: TimeInterval = 15,  file: String = #file, line: UInt = #line) {
        let expectation = XCTNSPredicateExpectation(
            predicate: NSPredicate(format: "exists == true"),
            object: element
        )
        let result = XCTWaiter().wait(
            for: [expectation],
            timeout: timeout
        )
        switch result {
        case .completed:
            break
        default:
            let message = "Failed to find \(element) after \(timeout) seconds."
            XCTFail(message)
        }
    }
    
    public func tapAlertButtonIfExists(named: String) {
        
        let button = application.buttons[named]
        if button.exists {
            button.tap()
        }
        
        let sheetButton = application.sheets.buttons[named]
        if sheetButton.exists {
            sheetButton.tap()
        }
        
        let alertButton = application.alerts.buttons[named]
        if alertButton.exists {
            alertButton.tap()
        }
    }
}
