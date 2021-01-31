//
//  SectionHeader.swift
//  FitMom
//
//  Created by Alexandru Vorojbit on 5/31/20.
//  Copyright © 2020 Alexandru Vorojbit. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    let titleLabel = UILabel()
//    let subtitleLabel = UILabel()
    let seeAllButton = ButtonRightImageLeftTitle()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
//        let separator = UIView(frame: .zero)
//        separator.translatesAutoresizingMaskIntoConstraints = false
//        separator.backgroundColor = .separator
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        addSubview(stackView)
        
        stackView.isUserInteractionEnabled = true
        
        NSLayoutConstraint.activate([
            
//            separator.heightAnchor.constraint(equalToConstant: 1.5),
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
//        stackView.setCustomSpacing(10, after: separator)
        
        style()
    }
    
    private func style() {
        titleLabel.textColor = .label
        titleLabel.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))
        
//        subtitleLabel.textColor = .label
        
//        seeAllButton.backgroundColor = .clear
//        seeAllButton.setTitle("SEE ALL", for: .normal)
//        seeAllButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
//        seeAllButton.setTitleColor(.label, for: .normal)
//        seeAllButton.tintColor = .label
//        seeAllButton.setImage(UIImage(systemName: "arrow.right", withConfiguration: SFSymbols.regularConfiguration), for: .normal)
//        seeAllButton.imageView?.contentMode = .scaleAspectFill
//        seeAllButton.contentHorizontalAlignment = .left
    }
    
}

