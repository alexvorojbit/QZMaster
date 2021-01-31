//
//  FMLabel.swift
//  FitMom
//
//  Created by Alexandru Vorojbit on 4/25/20.
//  Copyright © 2020 Alexandru Vorojbit. All rights reserved.
//

import UIKit

class QMLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(text: String, textColor: UIColor, font: UIFont, textAlign: NSTextAlignment, lineBreak: NSLineBreakMode, numberOfLines: Int) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = textColor
        self.font = font
        self.textAlignment = textAlign
        self.lineBreakMode = lineBreak
        self.numberOfLines = numberOfLines
        configure()
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
    }
}


class TakeCreateQuizLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(text: String, textColor: UIColor, font: UIFont) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = textColor
        self.font = font
        configure()
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
        setContentHuggingPriority(.defaultHigh, for: .horizontal)
        textAlignment = .left
    }
}


// MARK: - Personal Plan Label -

class PersonalPlanSmallLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        configure()
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
        textColor = Colors.lightBlue_darkWhite
        textAlignment = .left
        font = .systemFont(ofSize: 17.0, weight: .medium)
    }
}


// MARK: - Hero Label -

class HeroLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        configure()
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 28, weight: .bold)
        textColor = Colors.lightBlue_darkWhite
        textAlignment = .left
        lineBreakMode = .byWordWrapping
        numberOfLines = 3
    }
}


// MARK: - Offer Plan Label -

class OfferPlanLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(text: String, textColor: UIColor) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = textColor
        configure()
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
        font = .preferredFont(forTextStyle: .subheadline)
        textAlignment = .center
        minimumScaleFactor = 12
    }
}


// MARK: - Discount Label -

class DiscountLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        configure()
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
        font = .systemFont(ofSize: 12, weight: .semibold)
        textColor = Colors.lightBlue_darkWhite
        textAlignment = .center
        minimumScaleFactor = 10
    }
}

// MARK: - Offer Screen Feature Title Label -

class FeaturesTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        configure()
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 14, weight: .heavy)
        textColor = Colors.darkGray
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 12
    }
}


// MARK: - Offer Screen Feature List Label -

class FeaturesListLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        configure()
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 14, weight: .medium)
        textColor = Colors.darkGray
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 12
    }
}


// MARK: - Restore Purchase Text Label -

class RestorePurchaseTextLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        configure()
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 13, weight: .regular)
        textColor = Colors.darkGray
        textAlignment = .left
        lineBreakMode = .byWordWrapping
        numberOfLines = 30
    }
}

// MARK: - Water Settings Labels -

class WaterSettingsDailyDrinkLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        configure()
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 20, weight: .semibold)
        textColor = Colors.black
        textAlignment = .center
    }
}

class WaterSettingsDailyGoalQuantityLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        configure()
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 22, weight: .semibold)
        textColor = Colors.black
        textAlignment = .center
    }
}

class WaterSettingsLitreDropLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        configure()
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 12, weight: .regular)
        textColor = Colors.gray
        textAlignment = .center
    }
}
