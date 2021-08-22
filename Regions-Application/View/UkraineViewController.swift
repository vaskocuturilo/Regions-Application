//
//  UkraineViewController.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 11.08.2021.
//

import UIKit

class UkraineViewController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {
    
    let apiService = APIServices()
    let check = Reachability()
    let messages = Messages()
    let jsonLoad = JsonLoader()
    
    var searchTimer: Timer?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
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
        textField.tintColor = .clear
        textField.becomeFirstResponder()
        self.textField.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        
        textField.addShadowToTextField(cornerRadius: 3)
        textField.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        
        label.text = ""
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
            apiService.responseRegion(endpoints: Constants.Endpoints.Ukraine, region: textField.text!) { [self](isSucess, str) in
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
            jsonLoad.loadSpeciesInfoJSOn(resource: "", label: label, text: textField.text!)
            textField.text?.removeAll()
        } else {
            messages.showMessage(label: label, message: "Error")
        }
    }
}
