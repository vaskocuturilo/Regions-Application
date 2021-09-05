//
//  MyPopShow.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 04.09.2021.
//

import Foundation
import UIKit

class MyPopUpShow {
    
    let singleWindow = SingelPopUpWindow()
    
    public func isWasAlreadyShown(textField: UITextField, title: String, description: String, key: String) {
        if !UserDefaults.standard.bool(forKey: key) {
            UserDefaults.standard.set(true, forKey: key)
            textField.resignFirstResponder()
            singleWindow.handleShowPopUp(title: title, description: description)
        } else {
            textField.becomeFirstResponder()
        }
    }
}
