//
//  EducationalCell.swift
//  QZ Master
//
//  Created by Alexandru Vorojbit on 12/21/20.
//

import UIKit

class EducationalCell: UICollectionViewCell {
    
    var educational: SectionItems? {
        didSet {
            nameLabel.text = educational?.sectionName
            educationalImageView.loadImageUsingCacheWithUrlString(urlString: educational?.image ?? "")
        }
    }
    
    // UI components
    lazy var educationalImageView: UIImageView = {
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
    
    
    // Initialiser
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.systemGray6
        layer.cornerRadius = 16
        clipsToBounds = true
        
        setupViews()
    }
    
    
    /// Sets up the UI components for this cell and adds them to the contentview
    private func setupViews() {
//        addSubview(educationalImageView)
//        addSubview(nameLabel)
//
//        NSLayoutConstraint.activate([
//            educationalImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            educationalImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            educationalImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            educationalImageView.heightAnchor.constraint(equalToConstant: 350),
//
//            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
//            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
//            nameLabel.bottomAnchor.constraint(equalTo: educationalImageView.topAnchor, constant: -24)
//        ])
        
        let stackView = VerticalStackView(arrangedSubviews: [nameLabel, educationalImageView], spacing: 12)
        addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 24, left: 24, bottom: 24, right: 24))
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
