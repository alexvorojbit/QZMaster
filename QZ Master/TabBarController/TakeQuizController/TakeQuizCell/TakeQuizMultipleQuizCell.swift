//
//  TakeQuizMultipleAppCell.swift
//  QZ Master
//
//  Created by Alexandru Vorojbit on 1/23/21.
//

import UIKit

class TakeQuizMultipleQuizCell: BaseTakeQuizCell {
    
//    var section: Section?
    
    override var takeQuizItems: Section! {
        didSet {
            sectionName.text = takeQuizItems.sectionName
            
            multipleQuizController.quizes = takeQuizItems.quizes
            multipleQuizController.collectionView.reloadData()
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
    
    let multipleQuizController = TakeQuizMultipleQuizController(mode: .small)


    // Initialiser
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        layer.cornerRadius = 16
        setupViews()
    }


    /// Sets up the UI components for this cell and adds them to the contentview
    private func setupViews() {
        
        let stackView = VerticalStackView(arrangedSubviews: [
            sectionName,
            multipleQuizController.view
            ], spacing: 12)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
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
