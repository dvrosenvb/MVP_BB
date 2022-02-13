//
//  ThemeManager.swift
//  BreakingBad
//
//  Created by Rosendo Vázquez Bailón on 12/02/22.
//

import Foundation

import UIKit
import SwiftUI

public struct ThemeManager {
    //MARK: - Constants -
    public static let BASE_URL = "https://www.breakingbadapi.com/api/"
    public static let CHAR_PATH = "characters?name="
    public static let PLACE_HOLDER = "Let's get cook..."
    
    //MARK: - Colors -
    public static let title_color = #colorLiteral(red: 0, green: 0.1882352941, blue: 0.05098039216, alpha: 1)
    public static let text_green_soft_color = #colorLiteral(red: 0.8862745098, green: 0.9215686275, blue: 0.8549019608, alpha: 1)
    public static let text_green_stone_color = #colorLiteral(red: 0, green: 0.09411764706, blue: 0.05098039216, alpha: 1)
    public static let elegant_Bg = #colorLiteral(red: 0.04031372124, green: 0.03760271357, blue: 0.04304046903, alpha: 1)
    
    
    public static func RegularFont(_ ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-Regular", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize, weight: .regular)
    }

    public static func MediumFont(_ ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-Medium", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize, weight: .medium)
    }
    
    public static func SemiboldFont(_ ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-SemiBold", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize, weight: .semibold)
    }
    
    public static func BoldFont(_ ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-Bold", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize, weight: .bold)
    }
    
    public static func ItalicFont(_ ofSize: CGFloat) -> UIFont {
        return UIFont.italicSystemFont(ofSize: ofSize)
    }
}

