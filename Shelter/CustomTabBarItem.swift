//
//  CustomTabBarItem.swift
//  Shelter
//
//  Created by Jismi Jesmani on 4/13/23.
//

import UIKit

class CustomTabBarItem: UITabBarItem {
    
    var selectionIndicator: UIView?
    var selectionColor: UIColor = .red // Change this to your desired color
    
    func setSelected(_ selected: Bool, in tabBar: UITabBar) {
        selectionIndicator?.isHidden = !selected
        updateSelectionIndicatorPosition(in: tabBar)
    }

    
    func updateSelectionIndicatorPosition(in tabBar: UITabBar) {
        guard let selectionIndicator = selectionIndicator else { return }

        let tabBarSize = tabBar.bounds.size
        let itemWidth = tabBarSize.width / CGFloat(tabBar.items?.count ?? 1)
        let itemIndex = CGFloat(tabBar.items?.firstIndex(of: self) ?? 0)
        let centerX = itemWidth * (itemIndex + 0.5)

        let centerY = tabBarSize.height / 2
        selectionIndicator.center = CGPoint(x: centerX, y: centerY)
    }

}

