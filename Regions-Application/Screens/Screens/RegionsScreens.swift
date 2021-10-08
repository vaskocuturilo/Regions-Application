//
//  RegionsScreens.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 08.10.2021.
//

import Foundation
import XCTest

class RegionsScreens {
    
    private let container: RegionsTestCaseContainer
    
    init(container: RegionsTestCaseContainer ) {
        self.container = container
    }
    
    lazy var rootScreen = RootScreen(application: container.application)
    lazy var russiaScreen = RussiaScreen(application: container.application)
}
