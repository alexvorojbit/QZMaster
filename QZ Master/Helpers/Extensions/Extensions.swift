//
//  Extensions.swift
//  FitMom
//
//  Created by Alexandru Vorojbit on 4/26/20.
//  Copyright © 2020 Alexandru Vorojbit. All rights reserved.
//

import UIKit

extension UITextField {
    
    // MARK: - TextField Border Bottom -
    
    func setBottomBorder(backGroundColor: UIColor, borderColor: UIColor) {
        self.layer.backgroundColor = backGroundColor.cgColor

        // defines the layers shadow
        self.layer.shadowOffset    = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity   = 1.0
        self.layer.shadowRadius    = 0.0
        self.layer.shadowColor     = borderColor.cgColor
    }
    
    
    // MARK: - Shake Input -
    
    func shake() {
        let animation          = CABasicAnimation(keyPath: "position")
        animation.duration     = 0.07
        animation.repeatCount  = 4
        animation.autoreverses = true
        animation.fromValue    = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue      = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
}


extension UILabel {
    
    // MARK: - Label Bottom Border -
    
    func setBottomBorder(backGroundColor: UIColor, borderColor: UIColor) {
        self.layer.backgroundColor = backGroundColor.cgColor

        // defines the layers shadow
        self.layer.shadowOffset    = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity   = 1.0
        self.layer.shadowRadius    = 0.0
        self.layer.shadowColor     = borderColor.cgColor
    }
    
    
    // MARK: - Add Character Spacing -
    
    func setTextSpacingBy(value: Double) {
        if let textString    = self.text {
        let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: value, range: NSRange(location: 0, length: attributedString.length - 1))
        attributedText       = attributedString
        }
    }
}


extension UIView {
    
    // MARK: - Gradient -
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer        = CAGradientLayer()
        gradientLayer.frame      = bounds
        gradientLayer.colors     = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations  = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint   = CGPoint(x: 1.0, y: 0.0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    // MARK: - Bottom Border -
    func setAllaroundBorder(radius:CGFloat, color:UIColor = UIColor.clear) -> UIView{
        let roundView: UIView = self
        roundView.layer.cornerRadius = CGFloat(radius)
        roundView.layer.borderWidth = 1
        roundView.layer.borderColor = color.cgColor
        roundView.clipsToBounds = true
        return roundView
    }
    
    
    // MARK: - Round Corners -
    func roundCorners(_ corners: UIRectCorner, radius: Double) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    
    func corner(radius: CGFloat = 25) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
//    func round(corners: UIRectCorner, radius: CGFloat) {
//        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        self.layer.mask = mask
//    }
    
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
}


// MARK: - Selected and Deselected buttons -

extension UIButton {
    
    func selectedFoodButton() {
        self.layer.borderColor   = Colors.red.cgColor
        self.setTitleColor(Colors.red, for: .normal)
        self.layer.shadowColor   = Colors.foodShadow.cgColor
        self.layer.shadowOffset  = CGSize(width: 0, height: 5)
        self.layer.shadowRadius  = 5
        self.layer.shadowOpacity = 0.4
    }
    
    func deselectedFoodButton() {
        self.layer.shadowColor   = .none
        self.layer.shadowOffset  = .zero
        self.layer.shadowRadius  = 0
        self.layer.shadowOpacity = .zero
        self.layer.borderColor   = Colors.gray.cgColor
        self.setTitleColor(Colors.black, for: .normal)
    }
    
    
    
    func applyGradient(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer           = CAGradientLayer()
        gradientLayer.colors        = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations     = [0.0, 1.0]
        gradientLayer.startPoint    = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint      = CGPoint(x: 1, y: 0)
        gradientLayer.frame         = self.bounds 
        gradientLayer.cornerRadius  = self.bounds.height / 5
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}


// MARK: - Image Rounded Border -

extension UIImageView {
    
    func makeRounded() {
        
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}


//extension UIView {
//
//    func addSeparator(ofHeight height : CGFloat) {
//        let lineView = UIView()
//        lineView.backgroundColor = .red
//        self.addSubview(lineView)
//        let constraintString = "V:|-\(self.frame.size.height - height)-[v0(\(height))]|"
//        self.addConstraintsWithFormat("H:|[v0]|", views: lineView)
//        self.addConstraintsWithFormat(constraintString, views: lineView)
//    }
//
//    MARK: - Constraints Extension
//
//    func addConstraintsWithFormat(_ format: String, views: UIView...) {
//        var viewsDictionary                            = [String: UIView]()
//        for (index, view) in views.enumerated() {
//        let key                                        = "v\(index)"
//        view.translatesAutoresizingMaskIntoConstraints = false
//        viewsDictionary[key]                           = view
//        }
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
//    }
//}







// MARK: - UIView Borders

//extension UIView {
//
//    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
//        let border             = CALayer()
//        border.backgroundColor = color.cgColor
//        border.frame           = CGRect(x:0,y: 0, width:self.frame.size.width, height:width)
//        self.layer.addSublayer(border)
//    }
//
//    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
//        let border             = CALayer()
//        border.backgroundColor = color.cgColor
//        border.frame           = CGRect(x: self.frame.size.width - width,y: 0, width:width, height:self.frame.size.height)
//        self.layer.addSublayer(border)
//    }
//
//    func addBottomBorderWithColor(color: UIColor, height: CGFloat) {
//        let border             = CALayer()
//        border.backgroundColor = color.cgColor
//        border.frame           = CGRect(x:0, y:0, width: 0, height: height)
//        self.layer.addSublayer(border)
//    }
//
//    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
//        let border             = CALayer()
//        border.backgroundColor = color.cgColor
//        border.frame           = CGRect(x: 0, y: 0, width: width, height: 1)
//        self.layer.addSublayer(border)
//    }
//
//    func addMiddleBorderWithColor(color: UIColor, width: CGFloat) {
//        let border             = CALayer()
//        border.backgroundColor = color.cgColor
//        border.frame           = CGRect(x:self.frame.size.width/2, y:0, width:width, height:self.frame.size.height)
//        self.layer.addSublayer(border)
//    }
//
//    func setUIViewBottomBorder(backGroundColor: UIColor, borderColor: UIColor) {
//        self.layer.backgroundColor = backGroundColor.cgColor
//
//        // defines the layers shadow
//        self.layer.shadowOffset    = CGSize(width: 94.0, height: 1.0)
//        self.layer.shadowOpacity   = 1.0
//        self.layer.shadowRadius    = 0.0
//        self.layer.shadowColor     = borderColor.cgColor
//    }
//}


// MARK: - UIStackView Border Color

//extension UIStackView {
//
//    func addBorder(color: UIColor, backgroundColor: UIColor, thickness: CGFloat) {
//        let insetView = UIView(frame: bounds)
//        insetView.backgroundColor = backgroundColor
//        insetView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        insertSubview(insetView, at: 0)
//
//        let borderBounds = CGRect(
//            x: thickness,
//            y: thickness,
//            width: frame.size.width - thickness * 2,
//            height: frame.size.height - thickness * 2)
//
//        let borderView = UIView(frame: borderBounds)
//        borderView.backgroundColor = color
//        borderView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        insertSubview(borderView, at: 0)
//    }
//}


extension UIFont {
    func withTraits(traits:UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits)) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0) //size 0 means keep the size as it is
    }

    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }

    func italic() -> UIFont {
        return withTraits(traits: .traitItalic)
    }
}


// MARK: - Gradient

extension UIView {

    enum axis {
        case vertical, horizontal, custom(angle: CGFloat)
    }

    func setGradientBackgroundColor(colors: [UIColor], axis: axis, cornerRadius: CGFloat? = nil, apply: ((UIView) -> ())? = nil) {
        layer.sublayers?.filter { $0.name == "gradientLayer" }.forEach { $0.removeFromSuperlayer() }
        self.layoutIfNeeded()

        let cgColors = colors.map { $0.cgColor }

        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = cgColors
        gradient.name = "gradientLayer"
        gradient.locations = [0.0, 1.0]

        switch axis {
            case .horizontal:
                gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
                gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
            case .custom(let angle):
                calculatePoints(for: angle, gradient: gradient)
            default:
                break
        }

        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)

        guard let cornerRadius = cornerRadius else { return }

        let circularPath = CGMutablePath()

        circularPath.move(to: CGPoint.init(x: cornerRadius, y: 0))
        circularPath.addLine(to: CGPoint.init(x: self.bounds.width - cornerRadius, y: 0))
        circularPath.addQuadCurve(to: CGPoint.init(x: self.bounds.width, y: cornerRadius), control: CGPoint.init(x: self.bounds.width, y: 0))
        circularPath.addLine(to: CGPoint.init(x: self.bounds.width, y: self.bounds.height - cornerRadius))
        circularPath.addQuadCurve(to: CGPoint.init(x: self.bounds.width - cornerRadius, y: self.bounds.height), control: CGPoint.init(x: self.bounds.width, y: self.bounds.height))
        circularPath.addLine(to: CGPoint.init(x: cornerRadius, y: self.bounds.height))
        circularPath.addQuadCurve(to: CGPoint.init(x: 0, y: self.bounds.height - cornerRadius), control: CGPoint.init(x: 0, y: self.bounds.height))
        circularPath.addLine(to: CGPoint.init(x: 0, y: cornerRadius))
        circularPath.addQuadCurve(to: CGPoint.init(x: cornerRadius, y: 0), control: CGPoint.init(x: 0, y: 0))


        let maskLayer = CAShapeLayer()
        maskLayer.path = circularPath
        maskLayer.fillRule = CAShapeLayerFillRule.evenOdd
        maskLayer.fillColor = UIColor.red.cgColor
        self.layer.mask = maskLayer

        apply?(self)
    }

    func calculatePoints(for angle: CGFloat, gradient: CAGradientLayer) {

        var ang = (-angle).truncatingRemainder(dividingBy: 360)
        if ang < 0 { ang = 360 + ang }
        let n: CGFloat = 0.5

        switch ang {
            case 0...45, 315...360:
                let a = CGPoint(x: 0, y: n * tanx(ang) + n)
                let b = CGPoint(x: 1, y: n * tanx(-ang) + n)
                gradient.startPoint = a
                gradient.endPoint = b
            case 45...135:
                let a = CGPoint(x: n * tanx(ang - 90) + n, y: 1)
                let b = CGPoint(x: n * tanx(-ang - 90) + n, y: 0)
                gradient.startPoint = a
                gradient.endPoint = b
            case 135...225:
                let a = CGPoint(x: 1, y: n * tanx(-ang) + n)
                let b = CGPoint(x: 0, y: n * tanx(ang) + n)
                gradient.startPoint = a
                gradient.endPoint = b
            case 225...315:
                let a = CGPoint(x: n * tanx(-ang - 90) + n, y: 0)
                let b = CGPoint(x: n * tanx(ang - 90) + n, y: 1)
                gradient.startPoint = a
                gradient.endPoint = b
            default:
                let a = CGPoint(x: 0, y: n)
                let b = CGPoint(x: 1, y: n)
                gradient.startPoint = a
                gradient.endPoint = b

        }
    }

    private func tanx(_ 𝜽: CGFloat) -> CGFloat {
        return tan(𝜽 * CGFloat.pi / 180)
    }

}
