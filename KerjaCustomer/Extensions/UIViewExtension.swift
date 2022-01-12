//
//  UIViewExtension.swift
//  SehatQ
//  Copyright © 2019 PT SehatQ Harsana Emedika. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

extension UIView {
    
    func activityIndicator(show: Bool) {
        activityIndicator(show: show, style: .gray)
    }
    
    func addGradientClearToBlack() {
        let gradientLayer = CAGradientLayer()
        let firstColor = UIColor.clear.cgColor
        let secondColor = UIColor.black.withAlphaComponent(0.9).cgColor
        gradientLayer.colors = [firstColor, secondColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        self.layer.addSublayer(gradientLayer)
    }

    func activityIndicator(show: Bool, style: UIActivityIndicatorView.Style) {
        var spinner: UIActivityIndicatorView? = viewWithTag(NSIntegerMax - 1) as? UIActivityIndicatorView

        if spinner != nil {
            spinner?.removeFromSuperview()
            spinner = nil
        }

        if spinner == nil && show {
            spinner = UIActivityIndicatorView.init(style: style)
            spinner?.translatesAutoresizingMaskIntoConstraints = false
            spinner?.hidesWhenStopped = true
            spinner?.tag = NSIntegerMax - 1

            if Thread.isMainThread {
                spinner?.startAnimating()
            } else {
                DispatchQueue.main.async {
                    spinner?.startAnimating()
                }
            }

            if let validSpinner = spinner {
                insertSubview(validSpinner, at: 0)

                NSLayoutConstraint.init(item: validSpinner, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
                NSLayoutConstraint.init(item: validSpinner, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0).isActive = true
            }
            spinner?.isHidden = !show
        }
    }
    
    func disabledView() {
        self.isUserInteractionEnabled = false
//        self.backgroundColor = Constants.Colors.SearchBorderColor.color()
    }
    
    func enableView() {
        self.isUserInteractionEnabled = true
        self.backgroundColor = .white
    }
    
    func loadingIndicator(_ show: Bool, color: UIColor? = nil) {
        let tag = 2304885
        if show {
            self.isUserInteractionEnabled = false
            let tempView = UIView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
            tempView.backgroundColor = .white
            tempView.clipsToBounds = true
            tempView.alpha = 0.5
            
            let activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40.0, height: 40.0))
            activityIndicatorView.type = .ballPulse
            activityIndicatorView.color = color ?? UIColor.black//Constants.Colors.AppBaseDarkBlueColor.color()
            
            tempView.tag = tag
            tempView.addSubview(activityIndicatorView)
            activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
            tempView.placeAtTheCenterWithView(view: activityIndicatorView)

            addSubview(tempView)
            activityIndicatorView.startAnimating()
        } else {
            self.isUserInteractionEnabled = true
            if let tempView = self.viewWithTag(tag) {
                tempView.removeFromSuperview()
            }
        }
    }
    
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.4
        animation.values = [-10.0, 10.0, -10.0, 10.0, -5.0, 5.0, -2.5, 2.5, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
    func resize() {
        var newFrame = frame
        let width = self.width
        let newSize = sizeThatFits(CGSize(width: width,
                                          height: CGFloat.greatestFiniteMagnitude))
        newFrame.size = CGSize(width: width, height: newSize.height)
        frame = newFrame
    }
    
    func resizeToZero() {
        var newFrame = frame
        let width = self.width
        let newSize = sizeThatFits(CGSize(width: width,
                                          height: 0))
        newFrame.size = CGSize(width: width, height: newSize.height)
        frame = newFrame
    }

    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
//    public var viewHeightWithTabBar: CGFloat {
//        return CGFloat(self.height - Constants.tabBarHeight)
//    }
//
//    public var top: CGFloat {
//        get {
//            return frame.top
//        }
//        set(value) {
//            var frame = self.frame
//            frame.top = value
//            self.frame = frame
//        }
//    }
//
//    public var left: CGFloat {
//        get {
//            return frame.left
//        }
//        set(value) {
//            var frame = self.frame
//            frame.left = value
//            self.frame = frame
//        }
//    }
//
//    public var bottom: CGFloat {
//        get {
//            return frame.bottom
//        }
//        set(value) {
//            var frame = self.frame
//            frame.bottom = value
//            self.frame = frame
//        }
//    }
//
//    public var right: CGFloat {
//        get {
//            return frame.right
//        }
//        set(value) {
//            var frame = self.frame
//            frame.right = value
//            self.frame = frame
//        }
//    }
    
    public var width: CGFloat {
        get {
            return frame.width
        }
        set(value) {
            var frame = self.frame
            frame.size.width = value
            self.frame = frame
        }
    }
    
    public var height: CGFloat {
        get {
            return frame.height
        }
        set(value) {
            var frame = self.frame
            frame.size.height = value
            self.frame = frame
        }
    }
    
//    public var centerX: CGFloat {
//        get {
//            return frame.centerX
//        }
//        set(value) {
//            var frame = self.frame
//            frame.centerX = value
//            self.frame = frame
//        }
//    }
//
//    public var centerY: CGFloat {
//        get {
//            return frame.centerY
//        }
//        set(value) {
//            var frame = self.frame
//            frame.centerY = value
//            self.frame = frame
//        }
//    }
    
    func roundedView() {
        self.clipsToBounds = false
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.init(white: 0.8, alpha: 1).cgColor
    }
    
    func squareRoundedView() {
        self.clipsToBounds = false
        self.layer.cornerRadius = 5
    }
    
    func shadow() {
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowColor = UIColor.init(white: 0.3, alpha: 1).cgColor
        self.layer.opacity = 1
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10).cgPath
        self.layer.shadowRadius = 10
    }
    
    func addShadow(offset: CGSize, color: UIColor, borderColor: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.borderColor = borderColor.cgColor
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor = backgroundCGColor
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowOpacity = 0.4
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            let color = UIColor(cgColor: layer.shadowColor ?? UIColor.clear.cgColor)
            return color
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }

}

enum ViewLine: Int {
    case kBottom
    case kTop
}

extension UIView {
    
    func addLine(_ line: ViewLine, color: UIColor? = UIColor.lightGray) {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = color?.cgColor
        border.frame = CGRect(x: 0, y: line == .kBottom ? self.frame.size.height - width : 1, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }

    func placeAtTheCenterFromTop(_ constant: CGFloat, view: UIView) {
        addConstraint(NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: constant))
    }

    func placeAtTheCenterWithView(view: UIView) {
        addConstraint(NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0))
    }
    
    func shadow(color: UIColor, opacity: Float, sizeX: CGFloat, sizeY: CGFloat, shadowRadius: CGFloat) {
        layer.shadowColor   = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset  = CGSize(width: sizeX, height: sizeY)
        layer.shadowRadius  = shadowRadius
    }
    
    func border(color: UIColor, width: CGFloat, radius: CGFloat) {
        layer.borderColor    = color.cgColor
        layer.borderWidth    = width
        layer.cornerRadius   = radius
    }
    
//    func rotateWithAngle(_ angle: CGFloat, animated: Bool = true) {
//        let animatedDuration = animated ? Constants.animationDuration : 0
//        UIView.animate(withDuration: animatedDuration, animations: {
//            if angle != 0 {
//                self.transform = CGAffineTransform(rotationAngle: angle)
//            }
//            else {
//                self.transform = CGAffineTransform.identity
//            }
//        })
//    }
    
    func roundViewAtCorners(_ rectCorner: UIRectCorner, radii: CGSize, rect: CGRect) {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: rect, byRoundingCorners: rectCorner, cornerRadii: radii).cgPath
        self.layer.mask = maskLayer
    }
    
    func borderBeizerPath(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        DispatchQueue.main.async {
            if #available(iOS 11.0, *) {
                self.clipsToBounds = true
                self.layer.cornerRadius = radius
                self.layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
            } else {
                let path = UIBezierPath(roundedRect: self.bounds,
                                        byRoundingCorners: corners,
                                        cornerRadii: CGSize(width: radius, height: radius))
                let maskLayer = CAShapeLayer()
                maskLayer.frame = self.bounds
                maskLayer.path = path.cgPath
                self.layer.mask = maskLayer
                self.layer.masksToBounds = true
            }
        }
    }
    
    func makeItRounded(width: CGFloat = 0, borderColor: CGColor = UIColor.clear.cgColor, cornerRadius: CGFloat = 0){
        self.layer.borderWidth = width
        self.layer.masksToBounds = false
        self.layer.borderColor = borderColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}

extension UIView {
    
    // TODO: - please fix the code so we can remove swiftlint:disable
    // swiftlint:disable force_cast
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: self.classForCoder), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    // TODO: - please fix the code so we can remove swiftlint:disable
    // swiftlint:disable force_cast
    public func loadUINib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static func createFromNib<T: UIView>(_ type: T.Type) -> T {
        let view = T.nib().instantiate(
            withOwner: nil,
            options: nil).first as! T
        return view
    }

    func fixInView(_ container: UIView?) {
        guard let validView = container else { return }
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = validView.frame;
        validView.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: validView, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: validView, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: validView, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: validView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
    
    func toTheEdge(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        let topContraint = NSLayoutConstraint(
          item: subview,
          attribute: .top,
          relatedBy: .equal,
          toItem: self,
          attribute: .top,
          multiplier: 1.0,
          constant: 0)
        
        let bottomConstraint = NSLayoutConstraint(
          item: subview,
          attribute: .bottom,
          relatedBy: .equal,
          toItem: self,
          attribute: .bottom,
          multiplier: 1.0,
          constant: 0)
        
        let leadingContraint = NSLayoutConstraint(
          item: subview,
          attribute: .leading,
          relatedBy: .equal,
          toItem: self,
          attribute: .leading,
          multiplier: 1.0,
          constant: 0)
        
        let trailingContraint = NSLayoutConstraint(
          item: subview,
          attribute: .trailing,
          relatedBy: .equal,
          toItem: self,
          attribute: .trailing,
          multiplier: 1.0,
          constant: 0)
        
        addConstraints([
          topContraint,
          bottomConstraint,
          leadingContraint,
          trailingContraint])
    }
}

extension UITextField {
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder!: "", attributes: [NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}

//extension UILabel {
//    @discardableResult func setAttributedText(fromHtml html: String, withColor: UIColor = Constants.Colors.TermAndConditionGrayColor.color()) -> Bool {
//        guard let data = html.data(using: .utf8, allowLossyConversion: true) else {
//            SQLogger.log(">>> Could not create UTF8 formatted data from \(html)")
//            return false
//        }
//        do {
//            let mutableText = try NSMutableAttributedString(
//                data: data,
//                options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue],
//                documentAttributes: nil)
//            mutableText.replaceFonts(with: font, withColor: withColor, shouldRemoveLink: true)
//            self.attributedText = mutableText
//            return true
//        } catch (let error) {
//            SQLogger.log(">>> Could not create attributed text from \(html)\nError: \(error)")
//            return false
//        }
//    }
//}
//
//extension UITextView {
//    @discardableResult func setAttributedText(fromHtml html: String, withColor: UIColor = Constants.Colors.TermAndConditionGrayColor.color()) -> Bool {
//        guard let data = html.data(using: .utf8, allowLossyConversion: true) else {
//            SQLogger.log(">>> Could not create UTF8 formatted data from \(html)")
//            return false
//        }
//        do {
//            let mutableText = try NSMutableAttributedString(
//                data: data,
//                options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue],
//                documentAttributes: nil)
//            let validFont = font ?? Constants.Fonts.Regular.font(14)
//            mutableText.replaceFonts(with:validFont , withColor: withColor, shouldRemoveLink: false)
//            let paragraphStyle = NSMutableParagraphStyle()
//            paragraphStyle.lineSpacing = 8
//            paragraphStyle.paragraphSpacing = 0.35 * validFont.lineHeight
//            mutableText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: mutableText.length))
//            self.attributedText = mutableText
//            return true
//        } catch (let error) {
//            SQLogger.log(">>> Could not create attributed text from \(html)\nError: \(error)")
//            return false
//        }
//    }
//}

extension UIView {
    func maskRoundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius,
                                                    height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

extension UIView {

    enum BorderSide {
        case Left, Right, Top, Bottom
    }

    func addBorder(toSide side: BorderSide, withColor color: CGColor, andThickness thickness: CGFloat) {

        let border = CALayer()
        border.backgroundColor = color

        switch side {
        case .Left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height); break
        case .Right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height); break
        case .Top: border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness); break
        case .Bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness); break
        }

        layer.addSublayer(border)
    }
}

extension UIView {
    func addDashedLine(color: UIColor = UIColor.lightGray,
                       lineWidth: CGFloat = 0,
                       height: CGFloat = 0,
                       pattern: [NSNumber] = [4, 4],
                       direction: LineDashDirection = .horizontal) {
        _ = layer.sublayers?.filter({ $0.name == "DashedTopLine" }).map({ $0.removeFromSuperlayer() })
        self.backgroundColor = UIColor.clear
        let cgColor = color.cgColor
        
        let shapeLayer: CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let width: CGFloat = lineWidth > 0 ? lineWidth : frameSize.width
        let frameHeight: CGFloat = height > 0 ? height : frameSize.height
        let shapeRect = CGRect(x: 0, y: 0, width: width, height: frameHeight)
        
        shapeLayer.name = "DashedTopLine"
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: width / 2, y: frameSize.height / 2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = pattern
        
        let path: CGMutablePath = CGMutablePath()
        path.move(to: CGPoint(x:0, y:0))
        if direction == .horizontal {
            path.addLine(to :CGPoint(x: width, y : 0))
        } else {
            path.addLine(to :CGPoint(x: 0, y : height))
        }
        shapeLayer.path = path
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func removeDashedLine(){
        _ = layer.sublayers?.filter({ $0.name == "DashedTopLine" }).map({ $0.removeFromSuperlayer() })
    }
}

extension UIView {
    func setExclusiveTouchRecursively() {
        isExclusiveTouch = true
        subviews.forEach { subview in
            subview.setExclusiveTouchRecursively()
        }
    }
}

enum LineDashDirection {
    case vertical
    case horizontal
}
