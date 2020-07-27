//
//  Application.swift
//  DoodleBlueTask
//
//  Created by jenish x on 27/07/20.
//  Copyright © 2020 jenish x. All rights reserved.
//

import Foundation
import UIKit



extension UIApplication {

    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)

        } else if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
