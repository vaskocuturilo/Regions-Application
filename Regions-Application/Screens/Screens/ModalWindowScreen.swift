//
//  ModalWindowScreen.swift
//  Regions-ApplicationUITests
//
//  Created by Anton Smirnov on 09.10.2021.
//

import Foundation
import XCTest

fileprivate let AccessabilityRoot = Accessibility.Screen.ModalWindow.self
class ModalWindowScreen: RegionsBaseClass {
    override var root: XCUIElement {
        return self.application.otherElements[AccessabilityRoot.View]
    }
    
    public var agreeButton :XCUIElement {
        return self.application.textFields[AccessabilityRoot.GotItButton]
    }
    
    public func tapAgreeButton() {
        agreeButton.tap()
    }
}
