//
//  UICollectionViewCell+Identifier.swift
//  FitMom
//
//  Created by Alex Vorojbit on 05/31/2020.
//  Copyright © 2020 Alexandru Vorojbit. All rights reserved.
//

import UIKit

/*
 Simple extension that adds the "identifier" property to all UICollectionReusableView,
 it uses its own class name as the identifier so it should always be unique
*/

//protocol SelfConfiguringCell {
//    func configure(with item: SectionItems)
//}

extension UICollectionReusableView {
    static var identifier: String {
        return "\(self)"
    }
}
