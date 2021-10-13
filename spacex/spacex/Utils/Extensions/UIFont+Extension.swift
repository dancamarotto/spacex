//
//  UIFont+Extension.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/10/21.
//

import UIKit

extension UIFont {
    class func avenirNextFont(ofSize size: CGFloat) ->  UIFont {
        UIFont(name: "Avenir Next", size: size) ?? systemFont(ofSize: size)
    }
}
