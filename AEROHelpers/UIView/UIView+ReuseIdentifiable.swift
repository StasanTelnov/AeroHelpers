//
//  UIView+ReuseIdentifiable.swift
//  Stockmann
//
//  Created by Stas Telnov on 24.06.2018.
//  Copyright © 2018 AERO. All rights reserved.
//

import UIKit

/// protocol for views, which needed have unique name identifier
public protocol ReuseIdentifiable: UIView {
    static var reuseIdentifier: String { get }
}

/// extend protocol for generate unique identifier for reusing (cells for example)
public extension ReuseIdentifiable {
    
    /// unique name identifier
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
