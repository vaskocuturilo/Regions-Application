//
//  ViewController.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 09.08.2021.
//

import UIKit
import Foundation
import Alamofire

class RussiaViewController: UIViewController {
    
    let label = UILabel()
    var sampleTextField =  UITextField()
    
    let transition = SlideTransition()
    
    let check = Reachability()
    let messages = Messages()
    let apiService = APIServices()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLabel()
        setupTextField(text: "Enter russian region here")
        setupImage(imageName: "playstore")
    }
    
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        
        guard let menuViewController = storyboard?.instantiateViewController(identifier: "MenuViewController") as? MenuTableView else {
            return
        }
        menuViewController.didTypeMenu = { menuType in
            
            self.transitionToNewContent(menuType)
        }
        
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }
    
    func transitionToNewContent(_ menuType: MenuTableView.MenuType){
        let title = String(describing: menuType).capitalized
        self.title = title
        
        switch menuType {
        case .russia:
            setupLabel()
            setupTextField(text: "Enter russian region here")
            setupImage(imageName: "playstore")
            break
        case .ukraine:
            setupLabel()
            setupTextField(text: "Enter ukraine region here")
            setupImage(imageName: "ukr")
            break
            
        case .abhaziya:
            setupLabel()
            setupTextField(text: "Enter abhaziya region here")
            setupImage(imageName: "abh")
            break
            
        case .poland:
            setupLabel()
            setupTextField(text: "Enter poland region here")
            setupImage(imageName: "poland")
            break
            
        }
    }
    
    func setupImage(imageName: String) {
        let imageName = imageName
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 20, y: 400, width: 24, height: 24)
        view.addSubview(imageView)
    }
    
    func setupLabel() {
        label.text = "Enter region code"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        self.view.addSubview(label)
        // SET AUTOLAYOUT ANCHORS
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 50).isActive = true
        label.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 20).isActive = true
        label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300).isActive = true
        label.sizeToFit()
    }
    
    func setupTextField(text: String) {
        sampleTextField = UITextField(frame: CGRect(x: 50, y: 400, width: 300, height: 40))
        sampleTextField.placeholder = text
        sampleTextField.font = UIFont.systemFont(ofSize: 15)
        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
        sampleTextField.keyboardType = UIKeyboardType.default
        sampleTextField.returnKeyType = UIReturnKeyType.done
        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        sampleTextField.delegate = self
        self.view.addSubview(sampleTextField)
        
    }
}

extension RussiaViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.isPresenting = false
        return transition
    }
}

extension RussiaViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newStringInTextField = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        
        if check.isConnectedToNetwork() {
            if textField.text?.isEmpty ?? true {
                label.text = "Region is empty"
            } else {
                apiService.responseRegion(region: newStringInTextField!) { [self](isSucess, str) in
                    if isSucess {
                        messages.showMessage(label: label, message: str)
                        textField.text?.removeAll()
                    } else {
                        messages.showErrorMessage(message: str)
                        print(str)
                    }
                }
            }
            return true
            
        } else {
            print("Load from json")
            return false
        }
    }
}

