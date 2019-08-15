//
//  UIView+XibLoadable.swift
//  Stockmann
//
//  Created by Stas Telnov on 20.06.2018.
//  Copyright © 2018 AERO. All rights reserved.
//

import UIKit

/// Protocol for views, which needed loading itself from xib file
public protocol XibLoadable: UIView {
    func loadXib()
}

/// Loading view from xib.
public extension XibLoadable {
    
    /// Loading view from xib in current bundle. Generate fatal error if xib file dont exists.
    ///
    /// Xib file name should equal to class name
    func loadXib() {
        
        let nibName = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        guard let loadedView = view else {
            fatalError("Xib of \(nibName) not found and dont loaded")
        }
        
        loadedView.frame = bounds
        addSubview(loadedView)
        
        loadedView.backgroundColor = .clear
    }
}
