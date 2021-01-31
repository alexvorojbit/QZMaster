//
//  Constants.swift
//  FitMom
//
//  Created by Alexandru Vorojbit on 4/25/20.
//  Copyright © 2020 Alexandru Vorojbit. All rights reserved.
//

import UIKit

struct Colors {
    static let brightOrange        = UIColor(red: 247.0/255.0, green: 117.0/255.0, blue: 113.0/255.0, alpha: 1.0)
    static let orange              = UIColor(red: 241.0/255.0, green: 78.0/255.0, blue: 93.0/255.0, alpha: 1.0)
    static let darkOrange          = UIColor(red: 255.0/255.0, green: 69.0/255.0, blue: 58.0/255.0, alpha: 0.3)
//    static let red                 = UIColor(red: 231.0/255.0, green: 55.0/255.0, blue: 71.0/255.0, alpha: 1.0)
    static let red                 = UIColor(red: 247.0/255.0, green: 61.0/255.0, blue: 79.0/255.0, alpha: 1.0)
    static let lightRed            = UIColor(red: 237.0/255.0, green: 76.0/255.0, blue: 103.0/255.0, alpha: 1.0)
    static let lightBlue           = UIColor(red: 177.0/255.0, green: 183.0/255.0, blue: 215.0/255.0, alpha: 1.0)
    static let blue                = UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 228.0/255.0, alpha: 1.0)
    static let green               = UIColor(red: 91.0/255.0, green: 197.0/255.0, blue: 159.0/255.0, alpha: 1.0)
    static let mediumGray          = UIColor(red: 225.0/255.0, green: 225.0/255.0, blue: 225.0/255.0, alpha: 1.0)
    static let darkGray            = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
    static let veryDarkGray        = UIColor(red: 13.0/255.0, green: 13.0/255.0, blue: 13.0/255.0, alpha: 1.0)
    static let lightGray           = UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0)
    static let transparentGray     = UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 70.0/255.0, alpha: 0.5)
    static let gray                = UIColor(red: 175.0/255.0, green: 175.0/255.0, blue: 175.0/255.0, alpha: 1.0)
    static let black               = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    static let foodShadow          = UIColor(red: 149.0/255.0, green: 58.0/255.0, blue: 82.0/255.0, alpha: 1.0)
    static let facebookColor       = UIColor(red: 66.0/255.0, green: 103.0/255.0, blue: 178.0/255.0, alpha: 1.0)
    static let separator           = UIColor(red: 198.0/255.0, green: 200.0/255.0, blue: 219.0/255.0, alpha: 0.2)
    static let lightBlue_darkWhite = UIColor(named: "lightBlue_darkWhite")
    static let lightWhite_darkBlue = UIColor(named: "lightWhite_darkBlue")
    static let background          = UIColor(named: "background")
    static let middleGray          = UIColor(named: "middleGray")
    static let darkBlue            = UIColor(named: "darkBlue")
    static let takeQuizColorButtonOne    = UIColor(red: 103.0/255.0, green: 178.0/255.0, blue: 111.0/255.0, alpha: 1.0)
    static let takeQuizColorButtonTwo    = UIColor(red: 76.0/255.0, green: 162.0/255.0, blue: 205.0/255.0, alpha: 1.0)
    static let createQuizButtonColorOne = UIColor(red: 255.0/255.0, green: 126.0/255.0, blue: 95.0/255.0, alpha: 1.0)
    static let createQuizButtonColorTwo = UIColor(red: 254.0/255.0, green: 180.0/255.0, blue: 123.0/255.0, alpha: 1.0)
    static let tabBarButtonInactive = UIColor(red: 117.0/255.0, green: 117.0/255.0, blue: 117.0/255.0, alpha: 1.0)
    
}


struct Images {
    static let fmLogoRed        = UIImage(named: "fm-logo-red")
    static let fmLogoWhite      = UIImage(named: "fm-logo-white")
    static let fmLogoSquare     = UIImage(named: "fm-logo-square")
    static let facebookLogo     = UIImage(named: "facebook")
    static let googleLogo       = UIImage(named: "googleLogo")
    
    // MARK: - Tab Bar Icons -
    static let todayInactive    = UIImage(named: "today-i")
    static let todayActive    = UIImage(named: "today-a")
    static let workoutsInactive = UIImage(named: "workouts-i")
    static let workoutsActive = UIImage(named: "workouts-a")
    static let mealsInactive    = UIImage(named: "meals-i")
    static let mealsActive    = UIImage(named: "meals-a")
    static let measuresInactive = UIImage(named: "measures-i")
    static let measuresActive = UIImage(named: "measures-a")
    static let profileInactive  = UIImage(systemName: "person")
    static let profileActive  = UIImage(systemName: "person.fill")
    
    // MARK: - Onboard Images -
    static let createQuiz = UIImage(named: "create_quiz")
    static let testBrain = UIImage(named: "test_brain")
    static let improveMemory = UIImage(named: "improve_memory")
}


struct Keys {
    static let yourName           = "YourName"
    static let systemUnitsRow     = "SystemUnitsRow"
    static let weightSystemUnits  = "WeightSystemUnits"
    static let heightSystemUnits  = "HeightSystemUnits"
    static let currentWeightValue = "CurrentWeightValue"
    static let currentHeightValue = "CurrentHeightValue"
    static let weightGoalValue    = "WeightGoalValue"
    static let isBool             = "isBool"
}


struct Cells {
    static let systemUnitCell = "SystemUnitsCell"
}


struct SystemUnitsTitle {
    static let english = "English(pounds, inches, kCal)"
    static let metrics = "Metrics(kg, cm, kCal)"
}


struct LabelsText {
    static let personalPlanDescription = "This Recommended Plan includes professional workouts and plenty of fruits and vegetables, whole grains, lean proteins and high-quality fats. Enjoy lots of delicious food while still losing weight."
}
