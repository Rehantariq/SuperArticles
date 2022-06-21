//
//  UIColor.swift
//  SuperArticles
//
//  Created by Rehan tariq on 21/06/2022.
//

import UIKit

extension UIColor {
    
    static func applyTheme() {
        UINavigationBar.appearance().setBackgroundImage( primaryColor.image() , for: .default)
        let attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .regular) ]
        UINavigationBar.appearance().titleTextAttributes = attributes // Title fonts
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        let navigationTitleFont = UIFont.systemFont(ofSize: 22, weight: .bold)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : accentColor , NSAttributedString.Key.font: navigationTitleFont ] // Title color
        UINavigationBar.appearance().tintColor = accentColor //  bar buttons
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    static var primaryColor: UIColor {
        if #available(iOS 11.0, *) {
            if let color = UIColor(named: "primary"){
                return color
            }
        }
        return   .black
    }
    
    static var accentColor: UIColor {
        if #available(iOS 11.0, *) {
            if let color = UIColor(named: "accent"){
                return color
            }
        }
        return   .darkGray
    }
    
    static var primaryLightColor: UIColor {
        if #available(iOS 11.0, *) {
            if let color = UIColor(named: "primary_light"){
                return color
            }
        } else {
        }
        return   .darkGray
    }
    
    static var textColor: UIColor {
        if #available(iOS 11.0, *) {
            if let color = UIColor(named: "text"){
                return color
            }
        }
        return   .black
    }
    
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
    
}
