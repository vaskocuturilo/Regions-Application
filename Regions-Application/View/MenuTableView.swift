//
//  MenuTableView.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 09.08.2021.
//

import UIKit

class MenuTableView: UITableViewController {
    
    var didTypeMenu: ((MenuType) -> Void)?
    
    enum MenuType: Int {
        case russia
        case ukraine
        case belarus
        case armenia
        case czech
        case poland
        case moldova
        case lithuania
        case turkey
        case estonia
        case germany
        case slovakia
        case bulgaria
        case austria
        case greece
        case ireland
        case romania
        case hungary
        case norway
        case switzerland
        case france
        case croatia
        case montenegro
        case slovenia
        case kosovo
        case camera
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in
            self? .didTypeMenu?(menuType)
        }
    }
}
