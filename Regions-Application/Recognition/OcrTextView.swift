//
//  OcrTextView.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 29.08.2021.
//

import UIKit

class OcrTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: .zero, textContainer: textContainer)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 7.0
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.systemTeal.cgColor
        font = .systemFont(ofSize: 16.0)
    }
}
