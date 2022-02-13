//
//  StringXtension.swift
//  BreakingBad
//
//  Created by Rosendo Vázquez Bailón on 12/02/22.
//

import Foundation

extension String {
    func setName(_ name: String) -> String {
        return replacingOccurrences(of:" ", with: "+")
    }
}
