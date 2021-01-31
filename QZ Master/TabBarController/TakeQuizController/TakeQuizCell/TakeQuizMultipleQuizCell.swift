//
//  TakeQuizMultipleAppCell.swift
//  QZ Master
//
//  Created by Alexandru Vorojbit on 1/23/21.
//

import UIKit

class TakeQuizMultipleQuizCell: UICollectionViewCell {
    
    var takeQuizItems: SectionItems? {
        didSet {
            sectionName.text = takeQuizItems?.sectionName
            quizName.text = takeQuizItems?.quizName
            imageView.loadImageUsingCacheWithUrlString(urlString: takeQuizItems?.image ?? "")
        }
    }
    
    let sectionName: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1).bold()
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .label
        label.textAlignment = .left
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()

    let imageView: UIImageView = {
        let img = UIImageView()
//        img.contentMode = .scaleAspectFit
        img.layer.cornerRadius = 16
        img.clipsToBounds = true
        img.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return img
    }()
    
    let quizName: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3).bold()
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    let playButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(SFSymbols.playButton, for: .normal)
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return button
    }()


    // Initialiser
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = .systemGray6
        layer.cornerRadius = 16
        clipsToBounds = true
        
    }


    /// Sets up the UI components for this cell and adds them to the contentview
    private func setupViews() {
        
        let stackViewHorizontal = UIStackView(arrangedSubviews: [imageView, quizName, playButton])
        stackViewHorizontal.translatesAutoresizingMaskIntoConstraints = false
        stackViewHorizontal.spacing = 10
        addSubview(stackViewHorizontal)
        
        let stackViewVertical = VerticalStackView(arrangedSubviews: [sectionName, stackViewHorizontal])
        addSubview(stackViewVertical)
//        stackViewVertical.alignment = .center
        stackViewVertical.fillSuperview(padding: .init(top: 0, left: 0, bottom: 0, right: 24))
        
//        NSLayoutConstraint.activate([
//            sectionName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
//        ])
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
