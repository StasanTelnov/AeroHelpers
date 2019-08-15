//
//  UIView+ReuseIdentifiable.swift
//  Stockmann
//
//  Created by Stas Telnov on 24.06.2018.
//  Copyright © 2018 AERO. All rights reserved.
//

import UIKit

/// Protocol for views, which needed have unique name identifier
public protocol ReuseIdentifiable: UIView {
    /// Unique identifier for view class
    static var reuseIdentifier: String { get }
    
    /// Unique identifier for view object
    var reuseIdentifier: String { get }
}

/// Generate unique identifier for reusing
public extension ReuseIdentifiable {
    
    /// Unique identifier for view controller of class
    static var reuseIdentifier: String {
        return String(describing: self.self)
    }
    
    /// Unique identifier for view controller of object
    var reuseIdentifier: String {
        return Self.reuseIdentifier
    }
}
