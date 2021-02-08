//
//  TakeQuizSingleAppCell.swift
//  QZ Master
//
//  Created by Alexandru Vorojbit on 12/21/20.
//

import UIKit

class TakeQuizSingleQuizCell: UICollectionViewCell {
    
    var takeQuizItems: SectionItems? {
        didSet {
            nameLabel.text = takeQuizItems?.sectionName
            imageView.loadImageUsingCacheWithUrlString(urlString: takeQuizItems?.sectionImage ?? "")
        }
    }
    
    lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1).bold()
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .label
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var nameTopConstraint: NSLayoutConstraint!
    var imageViewBottomConstraint: NSLayoutConstraint!
    
    
    // Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = UIColor.systemGray6
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    
    // Sets up the UI components for this cell and adds them to the contentview
    private func setupViews() {
        addSubview(imageView)
        addSubview(nameLabel)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 350),

            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            nameLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -24)
        ])
        
        self.nameTopConstraint = nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24)
        self.nameTopConstraint.isActive = true
        
        self.imageViewBottomConstraint = imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        self.imageViewBottomConstraint.isActive = true
        
        
//        let stackView = VerticalStackView(arrangedSubviews: [name, imageView], spacing: 25)
//        addSubview(stackView)
//        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
//
//        self.topConstraint = stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24)
//        self.topConstraint.isActive = true
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
