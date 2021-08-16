//
//  ViewController.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 09.08.2021.
//

import UIKit
import Foundation

class RootViewController: UIViewController {
    
    let transition = SlideTransition()
    let messages = Messages()
    
    lazy var button: CustomButton = {
        let button = CustomButton(frame: CGRect(x: 100, y: 400, width: 200, height: 50))
        return button
    } ()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupButton(text: "Person auto number", 1)
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
            setupButton(text: "Person auto number", 1)
            break
        case .ukraine:
            setupButton(text: "Person auto number", 2)
            break
        case .abhaziya:
            setupButton(text: "Person auto number", 4)
            break
            
        case .poland:
            setupButton(text: "Person auto number", 3)
            break
            
        }
    }
    
    func setupButton(text: String, _ menu: Int) {
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
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "polandViewController") as! PolandViewController
            self.navigationController?.pushViewController(VC, animated: true)
        } else {
            messages.showErrorMessage(message: "No View Controller found.")
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
