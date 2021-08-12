//
//  Messages.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 11.08.2021.
//

import Foundation
import UIKit

class Messages {
    
    public func showMessage(label: UILabel, message: String) {
        label.text = message
    }
    
    public func showErrorMessage(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: nil))
        
        let alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = UIViewController()
        alertWindow.windowLevel = UIWindow.Level.alert + 1;
        alertWindow.makeKeyAndVisible()
        alertWindow.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}


