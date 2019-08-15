//
//  UIView+XibLoadable.swift
//  Stockmann
//
//  Created by Stas Telnov on 20.06.2018.
//  Copyright © 2018 AERO. All rights reserved.
//

//import SnapKit
import UIKit

/// protocol for views, which needed loading itself from xib file
public protocol XibLoadable: UIView {
    func loadXib()
}

/// extension for loading views from xib on storyboards and manual inits
public extension XibLoadable {
    
    /// load view from xib on storyboards and manual init
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
