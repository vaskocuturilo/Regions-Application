//
//  IrelandViewController.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 02.09.2021.
//

import UIKit

class IrelandViewController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {
    
    let apiService = APIServices()
    let check = Reachability()
    let messages = Messages()
    let jsonLoad = JsonLoader()
    let showPopUp = MyPopUpShow()
    
    @IBOutlet weak var personButton: UIButton!
    @IBOutlet weak var diplomaticButton: UIButton!
    @IBOutlet weak var militaryButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    
    var isPersonChecked = true
    var isDiplomaticChecked = false
    var isMilitaryChecked = false
    var searchTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        textField.leftViewMode = .always
        textField.leftView = UIImageView(image: UIImage(named: "Ireland-Flag"))
        
        isPersonChecked = true
        isDiplomaticChecked = false
        isMilitaryChecked = false
        title = "Ireland"
        label.numberOfLines = 0
        
        textField.keyboardType = UIKeyboardType.alphabet
        textField.autocapitalizationType = UITextAutocapitalizationType.allCharacters
        
        showPopUp.isWasAlreadyShown(
            textField: self.textField,
            title: "Person number",
            description: Descriptions.EuropaUnion.Person,
            key: "isWasAlreadyShownIrelandPerson")
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
            textField.leftViewMode = .always
            textField.leftView = UIImageView(image: UIImage(named: "Ireland-Flag"))
            textField.backgroundColor = .white
            textField.textColor = .black
            isPersonChecked = true
            isDiplomaticChecked = false
            isMilitaryChecked = false
        }
    }
    
    @IBAction func didTapDiplomaticButton(_ sender: Any) {
        self.showAlert(title: "Information", message: "This feature will available soon.")
    }
    
    @IBAction func didTapMilitaryButton(_ sender: Any) {
        self.showAlert(title: "Information", message: "This feature will available soon.")
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
        }
    }
    
    private func personData() {
        apiService.responseRegion(endpoints: Constants.Endpoints.Ireland,region: textField.text!) { [self](isSucess, str) in
            if isSucess {
                messages.showMessage(label: label, message: str)
                textField.text?.removeAll()
            } else if (str.contains("Could not connect to the server.")) {
                jsonLoad.loadSpeciesInfoJSOn(resource: "irelandPerson", label: label, text: textField.text!)
                textField.text?.removeAll()
            }else {
                messages.showMessage(label: label, message: str)
                textField.text?.removeAll()
            }
        }
    }
}
