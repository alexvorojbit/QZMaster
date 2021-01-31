//
//  UILabel+.swift
//  PagingDemo
//
//  Created by Alex Nagy on 29/09/2020.
//

import UIKit

public extension UILabel {
    func edgeTo(view: UIImageView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
