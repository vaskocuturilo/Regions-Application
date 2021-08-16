//
//  PolandViewController.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 14.08.2021.
//

import UIKit

class PolandViewController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let backBTN = UIBarButtonItem(image: UIImage(named: "Image"),
                                              style: .plain,
                                              target: navigationController,
                                              action: #selector(UINavigationController.popViewController(animated:)))
                navigationItem.leftBarButtonItem = backBTN
                navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
