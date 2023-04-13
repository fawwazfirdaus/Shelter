//
//  CustomTabBar.swift
//  Shelter
//
//  Created by Jismi Jesmani on 4/13/23.
//

import UIKit

class CustomTabBar: UITabBar {

    @IBInspectable var tabBarHeight: CGFloat = 60.0 // You can adjust this value to your desired height
    @IBInspectable var horizontalInset: CGFloat = 16.0 // Horizontal gap on the left and right sides
    @IBInspectable var bottomInset: CGFloat = 35.0 // Vertical gap at the bottom of the tab bar

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var newSize = super.sizeThatFits(size)
        newSize.height = tabBarHeight
        return newSize
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let newTabBarFrame = CGRect(
            x: horizontalInset,
            y: (superview?.bounds.height ?? 0) - tabBarHeight - bottomInset,
            width: (superview?.bounds.width ?? 0) - 2 * horizontalInset,
            height: tabBarHeight
        )
        
        frame = newTabBarFrame
        layer.cornerRadius = tabBarHeight / 2
        clipsToBounds = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        itemPositioning = .fill
        itemWidth = (frame.width - 2 * horizontalInset) / CGFloat(items?.count ?? 1)
        itemSpacing = 0
    }
    

}


