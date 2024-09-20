//
//  UIViewController+Extension.swift
//  Assesentment-Vijay
//
//  Created by Vijay Singh Raghav on 20/09/24.
//

import UIKit
import Foundation

extension UIViewController {
    
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiate(storyboard: AppStoryboard) -> Self {
        return storyboard.viewController(viewControllerClass: self)
    }
}
