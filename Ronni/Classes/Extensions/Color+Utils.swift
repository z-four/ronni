//
//  ZSwiftMessages.swift
//  Created by Z4
//

import Foundation
import UIKit

extension UIColor {
    
    //hex implementation
    public convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
    
    class func colorGreen () -> UIColor {
        return UIColor(hex: "ff99cc00")
    }
    
    class func colorRed () -> UIColor {
        return UIColor(hex: "FC413D")
    }
}
