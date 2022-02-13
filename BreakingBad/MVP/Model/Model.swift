//
//  Model.swift
//  BreakingBad
//
//  Created by Rosendo Vázquez Bailón on 12/02/22.
//

import Foundation

struct BBChar:Codable {
    let char_id:Int?
    let name:String?
    let birthday:String?
    let occupation:[String?]
    let img:String?
    let status:String?
    let nickname:String?
    let appearance:[Int?]
    let portrayed:String?
    let category:String?
    let better_call_saul_appearance:[Int?]
}
