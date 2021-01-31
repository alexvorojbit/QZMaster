//
//  UIView+.swift
//  PagingDemo
//
//  Created by Alex Nagy on 29/09/2020.
//

import UIKit

public extension UIView {
    func pinTo(_ view: UIView) {
//        let topPadding = view.frame.height * 0.8
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: CGFloat(UIDevice.getFloatValue(iphone: 2, ipad: 2))).isActive = true
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: CGFloat(UIDevice.getFloatValue(iphone: 0.8, ipad: 0.8))).isActive = true
        widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 3/4).isActive = true
    }
}


class TakeCreateQuizView: UIView {
    
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
        layer.cornerRadius                        = bounds.height / 4
        backgroundColor                           = UIColor.systemGray5
        translatesAutoresizingMaskIntoConstraints = false
    }
}
