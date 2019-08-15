//
//  UIViewController+Identifiable.swift
//  Stockmann
//
//  Created by Stas on 23/05/2019.
//  Copyright © 2019 AERO. All rights reserved.
//

import UIKit

/// Protocol for view controllers, which used segue with identifier.
///
/// Its already relalized, you can dont redeclare reuseIdentifier variable
public protocol Identifiable: UIViewController {
    
    /// Unique identifier for view controller class
    static var reuseIdentifier: String { get }
    
    /// Unique identifier for view controller object
    var reuseIdentifier: String { get }
}

/// Realize Identifiable protocol
public extension Identifiable {
    
    /// Unique identifier for view controller of class
    static var reuseIdentifier: String {
        return String(describing: self.self)
    }

    /// Unique identifier for view controller of object
    var reuseIdentifier: String {
        return Self.reuseIdentifier
    }
}
