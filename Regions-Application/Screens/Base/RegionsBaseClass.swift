//
//  RegionsBaseClass.swift
//  Regions-ApplicationUITests
//
//  Created by Anton Smirnov on 08.10.2021.
//

import Foundation
import XCTest

class RegionsBaseClass {
    
    let application: XCUIApplication
    
    init(application: XCUIApplication) {
        self.application = application
    }
    
    var root: XCUIElement {
        fatalError("Use subclass of AuthorizationBaseClass instead base class")
    }
}
