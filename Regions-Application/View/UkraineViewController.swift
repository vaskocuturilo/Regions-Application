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
    
    @IBOutlet weak var personButton: UIButton!
    @IBOutlet weak var diplomaticButton: UIButton!
    @IBOutlet weak var militaryButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    
    var isPersonChecked = true
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
        textField.rightView = UIImageView(image: UIImage(named: "Ukraine-Flag"))
        
        isPersonChecked = true
        isDiplomaticChecked = false
        isMilitaryChecked = false
        title = "Ukraine"
        
        self.textField.autocapitalizationType = UITextAutocapitalizationType.allCharacters
        
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
            textField.rightView = UIImageView(image: UIImage(named: "Ukraine-Flag"))
            textField.backgroundColor = .white
            textField.textColor = .black
            isPersonChecked = true
            isDiplomaticChecked = false
            isMilitaryChecked = false
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
        if isPersonChecked {
            personData()
        } else if isDiplomaticChecked {
            diplomaticData()
            
        } else if isMilitaryChecked {
            militaryData()
        }
    }
    
    private func personData() {
        apiService.responseRegion(endpoints: Constants.Endpoints.Ukraine,region: textField.text!) { [self](isSucess, str) in
            if isSucess {
                messages.showMessage(label: label, message: str)
                textField.text?.removeAll()
            } else {
                if (str.contains("Could not connect to the server.")) {
                    jsonLoad.loadSpeciesInfoJSOn(resource: "ukrainePerson", label: label, text: textField.text!)
                    textField.text?.removeAll()
                }
            }
        }
    }
    
    private func diplomaticData() {
        apiService.responseRegion(endpoints: Constants.Endpoints.Ukraine,region: textField.text!) { [self](isSucess, str) in
            if isSucess {
                messages.showMessage(label: label, message: str)
                textField.text?.removeAll()
            } else {
                if (str.contains("Could not connect to the server.")) {
                    jsonLoad.loadSpeciesInfoJSOn(resource: "ukraineDiplomatic", label: label, text: textField.text!)
                    textField.text?.removeAll()
                }
            }
        }
    }
    
    private func militaryData() {
        apiService.responseRegion(endpoints: Constants.Endpoints.Ukraine,region: textField.text!) { [self](isSucess, str) in
            if isSucess {
                messages.showMessage(label: label, message: str)
                textField.text?.removeAll()
            } else {
                if (str.contains("Could not connect to the server.")) {
                    jsonLoad.loadSpeciesInfoJSOn(resource: "ukraineMilitary", label: label, text: textField.text!)
                    textField.text?.removeAll()
                }
            }
        }
    }
}
