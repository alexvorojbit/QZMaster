//
//  AppFullscreenHeaderCell.swift
//  QZ Master
//
//  Created by Alexandru Vorojbit on 1/11/21.
//

import UIKit

class QuizFullscreenHeaderCell: UITableViewCell {
    
    let takeQuizSingleAppCell = TakeQuizSingleQuizCell()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(takeQuizSingleAppCell)
        takeQuizSingleAppCell.fillSuperview()
        layer.cornerRadius = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
