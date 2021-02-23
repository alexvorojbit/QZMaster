//
//  BusinessCell.swift
//  QZ Master
//
//  Created by Alexandru Vorojbit on 12/21/20.
//

import UIKit

class MultipleQuizCell: UICollectionViewCell {
    
    var quizes: SectionItems? {
        didSet {
            nameLabel.text = quizes?.quizName
            imageView.loadImageUsingCacheWithUrlString(urlString: quizes?.image ?? "")
        }
    }
    
    // UI components
    let imageView: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFit
        img.layer.cornerRadius = 16
        img.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1).bold()
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .label
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let playButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(SFSymbols.playButton, for: .normal)
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.3, alpha: 0.3)
        return view
    }()
    
    
    // Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .systemGreen
        layer.cornerRadius = 16
        clipsToBounds = true
       
        imageView.backgroundColor = .purple
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        
        playButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        playButton.constrainWidth(constant: 44)
        playButton.constrainHeight(constant: 44)
        
        setupViews()
    }
    
    // Sets up the UI components for this cell and adds them to the contentview
    private func setupViews() {
        
        let stackView = UIStackView(arrangedSubviews: [imageView, nameLabel, playButton])
        stackView.spacing = 16
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fillSuperview()
        
        addSubview(separatorView)
        separatorView.anchor(top: nil, leading: imageView.leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: -8, right: 0), size: .init(width: 0, height: 0.5))
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        
        didSet {
            var transform = CGAffineTransform.identity
            if isHighlighted {
               transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }
            UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.4, options: .curveEaseOut, animations: {
                self.transform = transform
            })
        }
    }

}
