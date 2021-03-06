//
//  RussiaViewController.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 14.08.2021.
//

import UIKit
fileprivate let AccessibilityRoot = Accessibility.Screen.Russia.self
class RussiaViewController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {
    
    let apiService = APIServices()
    let check = Reachability()
    let messages = Messages()
    let jsonLoad = JsonLoader()
    let showPopUp = MyPopUpShow()
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var personButton: UIButton!
    @IBOutlet weak var diplomaticButton: UIButton!
    @IBOutlet weak var militaryButton: UIButton!
    
    var isPersonChecked = true
    var isDiplomaticChecked = false
    var isMilitaryChecked = false
    var searchTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = AccessibilityRoot.View
        let backBTN = UIBarButtonItem(image: UIImage(named: "Image"),
                                      style: .plain,
                                      target: navigationController,
                                      action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backBTN
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        textField.delegate = self
        textField.tintColor = .clear
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
        
        isPersonChecked = true
        isDiplomaticChecked = false
        isMilitaryChecked = false
        
        title = "Russia"
        
        label.numberOfLines = 0
        
        showPopUp.isWasAlreadyShown(
            textField: self.textField,
            title: "Person numbers",
            description: Descriptions.Russia.Person,
            key: "isWasAlreadyShownRussiaPerson")
        
        textField.accessibilityIdentifier = AccessibilityRoot.RegionCodeField
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
            textField.textColor = .black
            isPersonChecked = true
            isDiplomaticChecked = false
            isMilitaryChecked = false
            
            showPopUp.isWasAlreadyShown(
                textField: self.textField,
                title: "Person numbers",
                description: Descriptions.Russia.Person,
                key: "isWasAlreadyShownRussiaPerson")
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
            textField.textColor = .black
            isPersonChecked = false
            isDiplomaticChecked = true
            isMilitaryChecked = false
            
            showPopUp.isWasAlreadyShown(
                textField: self.textField,
                title: "Diplomatic numbers",
                description: Descriptions.Russia.Diplomatic,
                key: "isWasAlreadyShownRussiaDiplomatic")
        }
    }
    
    @IBAction func didTapMilitary(_ sender: Any) {
        isMilitaryChecked = !isMilitaryChecked
        if isMilitaryChecked {
            
            personButton.setTitle("Person", for: .normal)
            personButton.setTitleColor(.white, for: .normal)
            
            diplomaticButton.setTitle("Diplomatic", for: .normal)
            diplomaticButton.setTitleColor(.white, for: .normal)
            
            militaryButton.setTitle("Military ✓", for: .normal)
            militaryButton.setTitleColor(.green, for: .normal)
            
            textField.rightViewMode = .always
            textField.rightView = UIImageView(image: UIImage(named: "Russia-flag"))
            textField.backgroundColor = .black
            textField.textColor = .white
            
            
            isPersonChecked = false
            isDiplomaticChecked = false
            isMilitaryChecked = true
            
            showPopUp.isWasAlreadyShown(
                textField: self.textField,
                title: "Military numbers",
                description: Descriptions.Russia.Military,
                key: "isWasAlreadyShownRussiaMilitary")
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
        apiService.responseRegion(endpoints: Constants.Endpoints.Russia,region: textField.text!) { [self](isSucess, str) in
            if isSucess {
                messages.showMessage(label: label, message: str)
                textField.text?.removeAll()
            } else if (str.contains("Could not connect to the server.")) {
                jsonLoad.loadSpeciesInfoJSOn(resource: "russiaPerson", label: label, text: textField.text!)
                textField.text?.removeAll()
            } else {
                messages.showMessage(label: label, message: str)
                textField.text?.removeAll()
            }
        }
    }
    
    private func diplomaticData() {
        apiService.responseRegion(endpoints: Constants.Endpoints.Russia,region: textField.text!) { [self](isSucess, str) in
            if isSucess {
                messages.showMessage(label: label, message: str)
                textField.text?.removeAll()
            } else {
                if (str.contains("Could not connect to the server.")) {
                    jsonLoad.loadSpeciesInfoJSOn(resource: "russiaDiplomatic", label: label, text: textField.text!)
                    textField.text?.removeAll()
                }
            }
        }
    }
    
    private func militaryData() {
        apiService.responseRegion(endpoints: Constants.Endpoints.Russia,region: textField.text!) { [self](isSucess, str) in
            if isSucess {
                messages.showMessage(label: label, message: str)
                textField.text?.removeAll()
            } else {
                if (str.contains("Could not connect to the server.")) {
                    jsonLoad.loadSpeciesInfoJSOn(resource: "russiaMilitary", label: label, text: textField.text!)
                    textField.text?.removeAll()
                }
            }
        }
    }
}
