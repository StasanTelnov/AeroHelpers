//
//  Collection+SafeGetter.swift
//  Redmond.Eat
//
//  Created by Stas on 02/10/2019.
//  Copyright © 2019 Redmond. All rights reserved.
//

import Foundation

public extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
