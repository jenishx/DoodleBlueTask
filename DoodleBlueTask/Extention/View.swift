//
//  View.swift
//  DoodleBlueTask
//
//  Created by jenish x on 27/07/20.
//  Copyright © 2020 jenish x. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
}
