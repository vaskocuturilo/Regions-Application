//
//  RootViewController.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 09.08.2021.
//

import UIKit
import Foundation

fileprivate let AccessibilityRoot = Accessibility.Screen.Root.self
class RootViewController: UIViewController {
    
    let transition = SlideTransition()
    let messages = Messages()
    
    lazy var personButton: CustomButton = {
        let button = CustomButton(frame: CGRect(x: 50, y: 200, width: 200, height: 50))
        button.accessibilityIdentifier = AccessibilityRoot.PersonButton
        return button
    } ()
    
    lazy var diplomaticButton: CustomButton = {
        let button = CustomButton(frame: CGRect(x: 50, y: 300, width: 200, height: 50))
        return button
    } ()
    
    lazy var militaryButton: CustomButton = {
        let button = CustomButton(frame: CGRect(x: 50, y: 400, width: 200, height: 50))
        return button
    } ()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = AccessibilityRoot.View
        setupButton(button: personButton, text: "Person auto number", 1)
        setupButton(button: diplomaticButton, text: "Diplomat auto number", 1)
        setupButton(button: militaryButton, text: "Military auto number", 1)
    }
    
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        
        guard let menuViewController = storyboard?.instantiateViewController(identifier: "menuTableView") as? MenuTableView else {
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
            setupButton(button: personButton, text: "Person auto number", 1)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 1)
            setupButton(button: militaryButton, text: "Military auto number", 1)
            break
        case .ukraine:
            setupButton(button: personButton, text: "Person auto number", 2)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 2)
            setupButton(button: militaryButton, text: "Military auto number", 2)
            break
        case .belarus:
            setupButton(button: personButton, text: "Person auto number", 3)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 3)
            setupButton(button: militaryButton, text: "Military auto number", 3)
            break
        case .armenia:
            setupButton(button: personButton, text: "Person auto number", 18)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 18)
            setupButton(button: militaryButton, text: "Military auto number", 18)
            break
        case .poland:
            setupButton(button: personButton, text: "Person auto number", 4)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 4)
            setupButton(button: militaryButton, text: "Military auto number", 4)
            break
        case .czech:
            setupButton(button: personButton, text: "Person auto number", 5)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 5)
            setupButton(button: militaryButton, text: "Military auto number", 5)
            break
        case .moldova:
            setupButton(button: personButton, text: "Person auto number", 6)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 6)
            setupButton(button: militaryButton, text: "Military auto number", 6)
            break
        case .lithuania:
            setupButton(button: personButton, text: "Person auto number", 7)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 7)
            setupButton(button: militaryButton, text: "Military auto number", 7)
            break
        case .turkey:
            setupButton(button: personButton, text: "Person auto number", 8)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 8)
            setupButton(button: militaryButton, text: "Military auto number", 8)
            break
        case .estonia:
            setupButton(button: personButton, text: "Person auto number", 9)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 9)
            setupButton(button: militaryButton, text: "Military auto number", 9)
            break
        case .germany:
            setupButton(button: personButton, text: "Person auto number", 10)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 10)
            setupButton(button: militaryButton, text: "Military auto number", 10)
            break
        case .slovakia:
            setupButton(button: personButton, text: "Person auto number", 11)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 11)
            setupButton(button: militaryButton, text: "Military auto number", 11)
            break
        case .bulgaria:
            setupButton(button: personButton, text: "Person auto number", 12)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 12)
            setupButton(button: militaryButton, text: "Military auto number", 12)
            break
        case .austria:
            setupButton(button: personButton, text: "Person auto number", 13)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 13)
            setupButton(button: militaryButton, text: "Military auto number", 13)
            break
        case .greece:
            setupButton(button: personButton, text: "Person auto number", 14)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 14)
            setupButton(button: militaryButton, text: "Military auto number", 14)
            break
        case .ireland:
            setupButton(button: personButton, text: "Person auto number", 15)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 15)
            setupButton(button: militaryButton, text: "Military auto number", 15)
            break
        case .romania:
            setupButton(button: personButton, text: "Person auto number", 16)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 16)
            setupButton(button: militaryButton, text: "Military auto number", 16)
            break
        case .hungary:
            setupButton(button: personButton, text: "Person auto number", 17)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 17)
            setupButton(button: militaryButton, text: "Military auto number", 17)
            break
        case .norway:
            setupButton(button: personButton, text: "Person auto number", 19)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 19)
            setupButton(button: militaryButton, text: "Military auto number", 19)
            break
        case .switzerland:
            setupButton(button: personButton, text: "Person auto number", 20)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 20)
            setupButton(button: militaryButton, text: "Military auto number", 20)
            break
        case .france:
            setupButton(button: personButton, text: "Person auto number", 21)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 21)
            setupButton(button: militaryButton, text: "Military auto number", 21)
            break
        case .croatia:
            setupButton(button: personButton, text: "Person auto number", 22)
            setupButton(button: diplomaticButton, text: "Diplomat auto number", 22)
            setupButton(button: militaryButton, text: "Military auto number", 22)
            break
        case .camera:
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "cameraViewController") as! CameraViewController
            self.navigationController?.pushViewController(VC, animated: true)
            break
        }
    }
    
    func setupButton(button: UIButton, text: String, _ menu: Int) {
        button.backgroundColor = .blue
        button.setTitle(text, for: .normal)
        button.tag = menu
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc
    func buttonAction(sender: UIButton) {
        if sender.tag == 1 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "russiaViewController") as! RussiaViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 2 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "ukraineViewController") as! UkraineViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 3 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "belarusViewController") as! BelarusViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 4 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "polandViewController") as! PolandViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 5 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "czechViewController") as! CzechViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 6 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "moldovaViewController") as! MoldovaViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 7 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "lithuaniaViewController") as! LithuaniaViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 8 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "turkeyViewController") as! TurkeyViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 9 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "estoniaViewController") as! EstoniaViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 10 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "germanyViewController") as! GermanyViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 11 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "slovakiaViewController") as! SlovakiaViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 12 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "bulgariaViewController") as! BulgariaViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 13 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "austriaViewController") as! AustriaViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 14 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "greeceViewController") as! GreeceViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 15 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "irelandViewController") as! IrelandViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 16 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "romaniaViewController") as! RomaniaViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 17 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "hungaryViewController") as! HungaryViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 18 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "armeniaViewController") as! ArmeniaViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 19 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "norwayViewController") as! NorwayViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 20 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "switzerlandViewController") as! SwitzerlandViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 21 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "franceViewController") as! FranceViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else if sender.tag == 22 {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "croatiaViewController") as! CroatiaViewController
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
}

extension RootViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.isPresenting = false
        return transition
    }
}


