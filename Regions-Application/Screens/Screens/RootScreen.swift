//
//  RootScreen.swift
//  Regions-ApplicationUITests
//
//  Created by Anton Smirnov on 08.10.2021.
//

import Foundation
import XCTest

fileprivate let AccessibilityRoot = Accessibility.Screen.Root.self
class RootScreen: RegionsBaseClass {
    
    override var root: XCUIElement {
        return self.application.otherElements[AccessibilityRoot.View]
    }
    
    public var personButton: XCUIElement {
        return self.application.buttons[AccessibilityRoot.PersonButton]
    }
    
    public var menuButton: XCUIElement {
        return self.application.buttons["Menu"]
    }
    
    public func tapPersonButton() {
        personButton.tap()
    }
    
    public func tapMenuButton() {
        menuButton.tap()
    }
    
    public func tapTableItem(item: String) {
        return self.application.staticTexts[item].tap()
    }
}
