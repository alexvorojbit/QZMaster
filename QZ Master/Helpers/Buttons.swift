//
//  GFButton.swift
//  Followers
//
//  Created by Alexandru Vorojbit on 4/23/20.
//  Copyright © 2020 Alexandru Vorojbit. All rights reserved.
//

import UIKit

class QMButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
    
    
    init(backgroundColor: UIColor, title: String, titleColor: UIColor, borderWidth: CGFloat) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.layer.borderWidth = borderWidth
//        self.layer.borderColor = borderColor
        configure()
    }
    
    
    private func configure() {
        layer.borderColor                         = Colors.lightBlue_darkWhite?.cgColor
        layer.cornerRadius                        = bounds.height / 2
        titleLabel?.font                          = UIFont.systemFont(ofSize: 16, weight: .medium)
        translatesAutoresizingMaskIntoConstraints = false
    }
}


// MARK: - FOOD BUTTONS

class FoodButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
    
    
    init(title: String, borderColor: CGColor, titleColor: UIColor, tag: Int) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.borderColor = borderColor
        self.setTitleColor(titleColor, for: .normal)
        self.tag = tag
        configure()
    }
    
    
    private func configure() {
        layer.borderWidth                         = 1
        backgroundColor                           = Colors.lightBlue_darkWhite
        contentEdgeInsets                         = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
        layer.cornerRadius                        = frame.size.height / 2
        titleLabel?.font                          = UIFont.systemFont(ofSize: 15, weight: .regular)
        translatesAutoresizingMaskIntoConstraints = false
    }
}


class TakeQuizButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
    
    
    private func configure() {
        layer.cornerRadius                        = bounds.height / 5
        applyGradient(colorOne: Colors.takeQuizColorButtonOne, colorTwo: Colors.takeQuizColorButtonTwo)
        setTitleColor(UIColor.white, for: .normal)
//        layer.shadowOffset = CGSize(width: 0, height: 1)
//        layer.shadowColor = UIColor.systemGray3.cgColor
//        layer.shadowRadius = 10
//        layer.shadowOpacity = 0.5
        translatesAutoresizingMaskIntoConstraints = false
    }
}


class CreateQuizButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
    
    
    private func configure() {
        layer.cornerRadius                        = bounds.height / 5
        applyGradient(colorOne: Colors.createQuizButtonColorOne, colorTwo: Colors.createQuizButtonColorTwo)
        setTitleColor(UIColor.white, for: .normal)
//        layer.shadowOffset = CGSize(width: 0, height: 1)
//        layer.shadowColor = UIColor.systemGray3.cgColor
//        layer.shadowRadius = 10
//        layer.shadowOpacity = 0.5
        translatesAutoresizingMaskIntoConstraints = false
    }
}


class ButtonRightImageLeftTitle: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard imageView != nil else { return }
        
        imageEdgeInsets = UIEdgeInsets(top: 5, left: ((titleLabel?.bounds.width)! + 3), bottom: 5, right: 0)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -((imageView?.bounds.width)!), bottom: 0, right: 0 )
        
    }
}


// MARK: - Water Settings Buttons -

class DropButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
    
    
    init(text: String, titleColor: UIColor, borderColor: UIColor, tag: Int) {
        super.init(frame: .zero)
        self.setTitle(text, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.layer.borderColor = borderColor.cgColor
        self.tag = tag
        configure()
    }
    
    
    private func configure() {
        layer.cornerRadius                        = bounds.height / 2
        titleLabel?.font                          = UIFont.systemFont(ofSize: 16, weight: .medium)
        layer.borderWidth = 1
        backgroundColor = .clear
        clipsToBounds = true
        contentEdgeInsets                         = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
