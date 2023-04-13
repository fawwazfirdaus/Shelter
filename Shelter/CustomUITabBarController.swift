//
//  CustomUITabBarController.swift
//  Shelter
//
//  Created by Jismi Jesmani on 4/13/23.
//

import UIKit

class CustomUITabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Remove the title and adjust imageInsets for each tab bar item
        if let items = tabBar.items {
            for (index, item) in items.enumerated() {
                item.title = nil
                item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
                
                if let customItem = item as? CustomTabBarItem {
                    setupSelectionIndicator(for: customItem)
                    customItem.setSelected(index == selectedIndex, in: tabBar) // Updated call
                }
            }
        }
    }
    
    private func setupSelectionIndicator(for customItem: CustomTabBarItem) {
        let indicatorRadius: CGFloat = 16
        let indicator = UIView(frame: CGRect(x: 0, y: 0, width: indicatorRadius * 2, height: indicatorRadius * 2))
        indicator.backgroundColor = customItem.selectionColor
        indicator.layer.cornerRadius = indicatorRadius
        indicator.isHidden = true

        customItem.selectionIndicator = indicator
        tabBar.insertSubview(indicator, belowSubview: tabBar.subviews[tabBar.items?.firstIndex(of: customItem) ?? 0 + 1])
    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
