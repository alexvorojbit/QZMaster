//
//  SFSymbols.swift
//  FitMom
//
//  Created by Alexandru Vorojbit on 5/7/20.
//  Copyright © 2020 Alexandru Vorojbit. All rights reserved.
//

import UIKit

struct SFSymbols {
    static let lightConfiguration = UIImage.SymbolConfiguration(weight: .light)
    static let regularConfiguration = UIImage.SymbolConfiguration(weight: .regular)
    static let meidumConfiguration = UIImage.SymbolConfiguration(weight: .medium)
    static let semiboldConfiguration = UIImage.SymbolConfiguration(weight: .semibold)
    static let boldConfiguration = UIImage.SymbolConfiguration(weight: .bold)
    
    static let closeButtonConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular)
    
    
    // MARK: - Play Fill -
    static let playButton = UIImage(systemName: "play.circle.fill", withConfiguration: regularConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
    
    
    // MARK: - Create Quiz -
    static let createQuizButton = UIImage(systemName: "note.text.badge.plus", withConfiguration: regularConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
    
    
    // MARK: - Plus Regular -
    static let plusButton = UIImage(systemName: "plus", withConfiguration: regularConfiguration)?.withTintColor(Colors.lightBlue, renderingMode: .alwaysOriginal)
    
    
    // MARK: - Close Button Filled -
    static let closeButton = UIImage(systemName: "xmark.circle.fill", withConfiguration: closeButtonConfig)?.withTintColor(Colors.lightBlue, renderingMode: .alwaysOriginal)
    
    
    // MARK: - Tab Bar Buttons -
    // MARK: Home
    static let homeButtonActive = UIImage(systemName: "house.fill", withConfiguration: semiboldConfiguration)?.withTintColor(UIColor.systemBlue, renderingMode: .alwaysOriginal)
    static let homeButtonInactive = UIImage(systemName: "house", withConfiguration: regularConfiguration)?.withTintColor(Colors.tabBarButtonInactive, renderingMode: .alwaysOriginal)
    
    // MARK: Plus
    static let plusButtonActive = UIImage(systemName: "plus.circle", withConfiguration: semiboldConfiguration)?.withTintColor(UIColor.systemBlue, renderingMode: .alwaysOriginal)
    static let plusButtonInactive = UIImage(systemName: "plus.circle", withConfiguration: regularConfiguration)?.withTintColor(Colors.tabBarButtonInactive, renderingMode: .alwaysOriginal)
    
    // MARK: Profile
    static let profileButtonActive = UIImage(systemName: "person.fill", withConfiguration: semiboldConfiguration)?.withTintColor(UIColor.systemBlue, renderingMode: .alwaysOriginal)
    static let profileButtonInactive = UIImage(systemName: "person", withConfiguration: regularConfiguration)?.withTintColor(Colors.tabBarButtonInactive, renderingMode: .alwaysOriginal)
}
