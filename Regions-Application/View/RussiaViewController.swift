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
    
    @IBOutlet weak var personButton: UIButton!
    @IBOutlet weak var diplomaticButton: UIButton!
    @IBOutlet weak var militaryButton: UIButton!
    
    var isPersonChecked = false
    var isDiplomaticChecked = false
    var isMilitaryChecked = false
    
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
        
        personButton.setUpLayer(sampleButton: personButton, title: "Person")
        personButton.setUpLayer(sampleButton: diplomaticButton, title: "Diplomatic")
        personButton.setUpLayer(sampleButton: militaryButton, title: "Military")
        
        personButton.setTitle("Person ✓", for: .normal)
        personButton.setTitleColor(.green, for: .normal)
        
        textField.rightViewMode = .always
        textField.rightView = UIImageView(image: UIImage(named: "Russia-flag"))
    }
    
    @IBAction func didTapPersonButton(_ sender: Any) {
        isPersonChecked = !isPersonChecked
        if isPersonChecked {
            
            diplomaticButton.setTitle("Diplomatic", for: .normal)
            diplomaticButton.setTitleColor(.white, for: .normal)
            
            militaryButton.setTitle("Military", for: .normal)
            militaryButton.setTitleColor(.white, for: .normal)
            
            personButton.setTitle("Person ✓", for: .normal)
            personButton.setTitleColor(.green, for: .normal)
            textField.rightViewMode = .always
            textField.rightView = UIImageView(image: UIImage(named: "Russia-flag"))
            textField.backgroundColor = .white
        }
    }
    
    
    @IBAction func didTapDiplomaticButton(_ sender: Any) {
        isDiplomaticChecked = !isDiplomaticChecked
        if isDiplomaticChecked {
            personButton.setTitle("Person", for: .normal)
            personButton.setTitleColor(.white, for: .normal)
            
            militaryButton.setTitle("Military", for: .normal)
            militaryButton.setTitleColor(.white, for: .normal)
            
            diplomaticButton.setTitle("Diplomatic ✓", for: .normal)
            diplomaticButton.setTitleColor(.green, for: .normal)
            textField.backgroundColor = .red
        }
    }
    
    @IBAction func didTapMilitary(_ sender: Any) {
        isMilitaryChecked = !isMilitaryChecked
        if isMilitaryChecked {
            diplomaticButton.setTitle("Diplomatic", for: .normal)
            diplomaticButton.setTitleColor(.white, for: .normal)
            
            militaryButton.setTitle("Military", for: .normal)
            militaryButton.setTitleColor(.white, for: .normal)
            
            militaryButton.setTitle("Military ✓", for: .normal)
            militaryButton.setTitleColor(.green, for: .normal)
            
            textField.rightViewMode = .always
            textField.rightView = UIImageView(image: UIImage(named: "Russia-flag"))
            textField.backgroundColor = .black
        }
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
            apiService.responseRegion(endpoints: Constants.Endpoints.Russia,region: textField.text!) { [self](isSucess, str) in
                if isSucess {
                    messages.showMessage(label: label, message: str)
                    textField.text?.removeAll()
                } else {
                    if (str.contains("Could not connect to the server.")) {
                        let alert = UIAlertController(title: "Warning", message: "Could not connect to the server.", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        textField.text?.removeAll()
                    } else {
                        messages.showMessage(label: label, message: str)
                    }
                }
            }
        } else if (check.isConnectedToNetwork() == false) {
            jsonLoad.loadSpeciesInfoJSOn(resource: "russiPerson", label: label, text: textField.text!)
            textField.text?.removeAll()
        } else {
            messages.showMessage(label: label, message: "Error")
        }
    }
}
