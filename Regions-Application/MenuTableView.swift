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
        case abhaziya
        case poland
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in
            print("Dissmising \(menuType)")
            self? .didTypeMenu?(menuType)
        }
    }
}
