//
//  RegionsTestCaseContainer.swift
//  Regions-ApplicationUITests
//
//  Created by Anton Smirnov on 08.10.2021.
//

import Foundation
import XCTest

class RegionsTestCaseContainer {
    
    private(set) lazy var application = XCUIApplication()
    private(set) lazy var screens:  RegionsScreens = RegionsScreens (container: self)

    
    // MARK: - Init
    init() {
        _ = Bundle(for: RegionsScreens.self)
    }
}
