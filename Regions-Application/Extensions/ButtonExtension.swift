//
//  ButtonExtension.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 22.08.2021.
//

import Foundation
import UIKit

extension UIButton
{
    func setUpLayer(sampleButton: UIButton?, title: String) {
        sampleButton!.setTitle(title, for: .normal)
        sampleButton?.tintColor =  .white
        sampleButton!.layer.borderWidth = 1.0
        sampleButton!.layer.borderColor = UIColor.white.withAlphaComponent(3.0).cgColor
        sampleButton!.layer.cornerRadius = 5.0
        
        sampleButton!.layer.shadowRadius =  3.0
        sampleButton!.layer.shadowColor =  UIColor.white.cgColor
        sampleButton!.layer.shadowOpacity =  0.3
    }
}

