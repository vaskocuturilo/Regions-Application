//
//  RussiaViewController.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 14.08.2021.
//

import UIKit

class RussiaViewController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {
    
    let apiService = APIServices()
    let check = Reachability()
    let messages = Messages()
    let jsonLoad = JsonLoader()
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    var searchTimer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let backBTN = UIBarButtonItem(image: UIImage(named: "Image"),
                                      style: .plain,
                                      target: navigationController,
                                      action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backBTN
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        textField.delegate = self
        self.textField.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidEditingChanged(_ textField: UITextField) {
        
        if searchTimer != nil {
            searchTimer?.invalidate()
            searchTimer = nil
        }
        
        searchTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(searchForKeyword(_:)), userInfo: textField.text!, repeats: false)
    }
    
    @objc func searchForKeyword(_ timer: Timer) {
        if (check.isConnectedToNetwork() == true) {
            apiService.responseRegion(region: textField.text!) { [self](isSucess, str) in
                if isSucess {
                    messages.showMessage(label: label, message: str)
                    textField.text?.removeAll()
                } else {
                    if (str.contains("Could not connect to the server.")) {
                        let alert = UIAlertController(title: "Warning", message: "Could not connect to the server.", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    } else {
                        messages.showMessage(label: label, message: str)
                    }
                }
            }
        } else if (check.isConnectedToNetwork() == false) {
            jsonLoad.loadSpeciesInfoJSOn(label: label, text: textField.text!)
            textField.text?.removeAll()
        } else {
            messages.showMessage(label: label, message: "Error")
        }
    }
}
