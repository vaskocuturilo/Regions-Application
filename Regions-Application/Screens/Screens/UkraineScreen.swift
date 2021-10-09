//
//  UkraineScreen.swift
//  Regions-ApplicationUITests
//
//  Created by Anton Smirnov on 09.10.2021.
//

import Foundation
import XCTest
fileprivate let AccessabilityRoot = Accessibility.Screen.Ukraine.self
class UkraineScreen: RegionsBaseClass {
    override var root: XCUIElement {
        return self.application.otherElements[AccessabilityRoot.View]
    }
    
    public var regionCodeField :XCUIElement {
        return self.application.textFields[AccessabilityRoot.RegionCodeField]
    }
    
    public func enterRegionCode(code: String) {
        regionCodeField.tap()
        regionCodeField.typeText(code)
    }
}
