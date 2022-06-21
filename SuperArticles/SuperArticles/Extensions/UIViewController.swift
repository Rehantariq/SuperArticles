//
//  UIViewController.swift
//  SuperArticles
//
//  Created by Rehan tariq on 20/06/2022.
//

import UIKit

extension UIViewController {
    
    class var storyboardID : String {
        return "\(self)"
    }
    static func instanticate( appStoryboard : AppStoryboard  = .Main) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}

enum AppStoryboard : String {
    
    case Main
    case Articles
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController >(viewControllerClass: T.Type) -> T {
        
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        return self.instance.instantiateViewController(withIdentifier:  storyboardID ) as! T
    }
}
