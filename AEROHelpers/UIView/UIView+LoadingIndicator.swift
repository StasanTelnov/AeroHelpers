//
//  UIView+LoadingIndicator.swift
//  Stockmann
//
//  Created by Stas Telnov on 16.08.2018.
//  Copyright © 2018 AERO. All rights reserved.
//

import UIKit

// MARK: - appearance

/// Defaults config for fog and indicator
public class LoadingIndicator: UIView {
    
    /// Color of fog. Default is light gray with alpha 0.4.
    @objc public dynamic var fogColor: UIColor?
    
    // Loading indicator style. Default is gray.
    @objc public dynamic var indicatorStyle: UIActivityIndicatorView.Style = .gray
    
    // Loading indicator color. Optional, default is nil.
    @objc public dynamic var indicatorColor: UIColor?
}

// MARK: - loadingable view extension
/// Extension for views, which add and hide activity indicator, blocked user iteraction
public extension UIView {
    
    /// Check, is loadingable view at now moment or nor
    var isLoadingProgress: Bool {
        
        guard viewWithTag(DefaultsValues.loadingViewTag) as? LoadingView == nil else {
            return true
        }
        
        return false
    }
    
    /// Show loading indicator over view. Is fogging is true, that over view dispay gray fogging
    /// - Parameters:
    ///   - fogging: If true, that view has gray layer.
    ///   - fogColor: Color of fogging. Default is light gray with alpha 0.4.
    ///   - indicatorStyle: Style of activity indicator. Default is nil.
    ///   - indicatorColor: Color of activity indicator. Default is nil.
    func showLoading(fogging: Bool = true, fogColor: UIColor? = .none, indicatorStyle: UIActivityIndicatorView.Style? = .none, indicatorColor: UIColor? = .none) {
        
        guard !isLoadingProgress else {
            return
        }
        
        let loadingView = LoadingView(on: self, fogging: fogging, fogColor: fogColor, loadingIndicator: indicatorStyle, color: indicatorColor)
        
        let hSize = NSLayoutConstraint.sizeConstraint(loadingView, for: .horizontal)
        let vSize = NSLayoutConstraint.sizeConstraint(loadingView, for: .vertical)
        
        addConstraints(hSize)
        addConstraints(vSize)
    }
    
    /// Hide loading indicator if exists
    func hideLoading() {
        while let loadingView = viewWithTag(DefaultsValues.loadingViewTag) as? LoadingView {
            loadingView.removeFromSuperview()
        }
    }
}


// MARK: -
// MARK: - config enums
private enum DefaultsValues {
    static let loadingViewTag = Int.max
}

private enum Directions: String {
    case horizontal = "H"
    case vertical = "V"
}


// MARK: - indicator container
private class LoadingView: UIView, ReuseIdentifiable {
    
    init() {
        super.init(frame: .zero)
    }
    
    convenience init(on view: UIView, fogging: Bool = true, fogColor: UIColor? = UIColor.lightGray.withAlphaComponent(0.4), loadingIndicator style: UIActivityIndicatorView.Style? = .none, color: UIColor? = .none) {
        self.init()
        
        tag = DefaultsValues.loadingViewTag
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = fogging ? (fogColor ?? LoadingIndicator.appearance().fogColor) : .clear
        
        addIndicator(style: style, color: color)
        
        bounds = view.bounds
        view.addSubview(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addIndicator(style: UIActivityIndicatorView.Style?, color: UIColor?) {
        var styleOfIndicator = LoadingIndicator.appearance().indicatorStyle
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
        
        guard let color = (color ?? LoadingIndicator.appearance().indicatorColor) else {
            return
        }
        loadingIndicator.color = color
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
