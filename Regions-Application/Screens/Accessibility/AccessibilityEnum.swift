//
//  AccessibilityEnum.swift
//  Regions-ApplicationUITests
//
//  Created by Anton Smirnov on 08.10.2021.
//

import Foundation

fileprivate protocol AccessibilityEnum {
    
    static func wrapIdentifier(_ label: String) -> String
    
}

fileprivate extension AccessibilityEnum {
    static func wrapIdentifier(_ label: String) -> String {
        return "\(self).\(label)"
    }
}

enum Accessibility {
    
    /// Screens
    enum Screen {
        enum Root: AccessibilityEnum {
            // root view
            public static let View = wrapIdentifier("View")
            
            // Buttons on main page
            public static let PersonButton = wrapIdentifier("PersonButton")
            public static let DiplomaticButton = wrapIdentifier("DiplomaticButton")
            public static let MilitaryButton = wrapIdentifier("MilitaryButton")
            public static let MenuButton = wrapIdentifier("Menu")
        }
        
        public enum ModalWindow: AccessibilityEnum {
            // root view
            public static let View = wrapIdentifier("View")
            
            // Field on person page
            public static let GotItButton = wrapIdentifier("RegionCodeField")
            
        }
        
        public enum Russia: AccessibilityEnum {
            // root view
            public static let View = wrapIdentifier("View")
            
            // Field on person page
            public static let RegionCodeField = wrapIdentifier("RegionCodeField")
            
        }
        
        public enum Ukraine: AccessibilityEnum {
            // root view
            public static let View = wrapIdentifier("View")
            
            // Field on person page
            public static let RegionCodeField = wrapIdentifier("RegionCodeField")
            
        }
    }
}

