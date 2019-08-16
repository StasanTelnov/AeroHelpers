//
//  UIView+LoadingIndicator.swift
//  Stockmann
//
//  Created by Stas Telnov on 16.08.2018.
//  Copyright © 2018 AERO. All rights reserved.
//

import UIKit

// MARK: - loadingable view extension
/// Extension for views, which add and hide activity indicator, blocked user iteraction
public extension UIView {
    
    /// Show loading indicator over view. Is fogging is true, that over view dispay gray fogging
    /// - Parameters:
    ///   - fogging: if true, that view has gray layer
    ///   - indicatorStyle: style of indicator
    func showLoading(fogging: Bool = true, indicatorStyle: UIActivityIndicatorView.Style? = .none) {
        
        if viewWithTag(DefaultsValues.loadingViewTag) as? LoadingView != nil {
            return
        }
        
        let loadingView = LoadingView(on: self, fogging: fogging, style: indicatorStyle)
        
        let hSize = NSLayoutConstraint.sizeConstraint(loadingView, for: .horizontal)
        let vSize = NSLayoutConstraint.sizeConstraint(loadingView, for: .vertical)
        
        addConstraints(hSize)
        addConstraints(vSize)
    }
    
    /// Hide loading indicator if exists
    func hideLoading() {
        while let loadingView = viewWithTag(DefaultsValues.loadingViewTag) {
            guard (loadingView as? LoadingView) == nil else {
                loadingView.removeFromSuperview()
                return
            }
        }
    }
}


// MARK: -
// MARK: - config enums
private enum DefaultsValues {
    static let loadingViewTag = Int.max
    
    //swiftlint:disable object_literal
    static let foggingColor = UIColor(white: 216.0 / 255.0, alpha: 0.5)
    //swiftlint:enable object_literal
    
    static let indicatorStyle = UIActivityIndicatorView.Style.gray
}

private enum Directions: String {
    case horizontal = "H"
    case vertical = "V"
}


// MARK: - indicator container
private class LoadingView: UIView {
    
    init() {
        super.init(frame: .zero)
    }
    
    convenience init(on view: UIView, fogging: Bool = true, style: UIActivityIndicatorView.Style? = .none) {
        self.init()
        
        tag = DefaultsValues.loadingViewTag
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = fogging ? .clear : DefaultsValues.foggingColor
        
        addIndicator(style: style)
        
        view.addSubview(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addIndicator(style: UIActivityIndicatorView.Style? = .none) {
        var styleOfIndicator = DefaultsValues.indicatorStyle
        if let indicatorStyle = style {
            styleOfIndicator = indicatorStyle
        }
        
        let loadingIndicator = UIActivityIndicatorView(style: styleOfIndicator)
        loadingIndicator.startAnimating()
        
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(loadingIndicator)
        
        let centerX: NSLayoutConstraint = .centerConstraintIndicator(loadingIndicator, on: self, for: .horizontal)
        let centerY: NSLayoutConstraint = .centerConstraintIndicator(loadingIndicator, on: self, for: .vertical)
        addConstraints([centerX, centerY])
    }
}


// MARK: - constraints configure extension
private extension NSLayoutConstraint {
    static func centerConstraintIndicator(_ indicator: UIActivityIndicatorView, on view: UIView, for direction: Directions) -> NSLayoutConstraint {
        var attribute: NSLayoutConstraint.Attribute
        
        switch direction {
        case .horizontal:
            attribute = .centerX
        case .vertical:
            attribute = .centerY
        }
        
        return NSLayoutConstraint(item: indicator,
                                  attribute: attribute,
                                  relatedBy: .equal,
                                  toItem: view,
                                  attribute: attribute,
                                  multiplier: 1,
                                  constant: 0)
    }
    
    static func sizeConstraint(_ loadingView: UIView, for direction: Directions) -> [NSLayoutConstraint] {
        var option: NSLayoutConstraint.FormatOptions
        
        switch direction {
        case .horizontal:
            option = .alignAllCenterX
        case .vertical:
            option = .alignAllCenterY
        }
        
        let views = ["loadingView": loadingView]
        let format = "|-0-[loadingView]-0-|"
        
        return NSLayoutConstraint.constraints(withVisualFormat: "\(direction.rawValue):\(format)", options: option, metrics: nil, views: views)
    }
}
