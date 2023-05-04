//
//  Transaction.swift
//  MyNance
//
//  Created by Baird, Seth J on 5/2/23.
//

import Foundation

class Transaction: Codable, CustomStringConvertible {
    var amount: Double
    
    enum TCategory: String, Codable, CaseIterable {
    case UTILITIES = "Utilities"
    case INCOME = "Income"
    case GROCERIES = "Groceries"
    }
    
    var category: TCategory
    var desc: String
    
    //customstringconvertible
    public var description: String { "Amount: \(amount), Category: \(category.rawValue), Description: \(desc) "}
    
    init(amount: Double, category: TCategory, description: String) {
        self.amount = amount
        self.category = category
        self.desc = description
    }
    
    init() {
        self.amount = 0
        self.category = TCategory.UTILITIES
        self.desc = "DEFAULT TRANSCATION"
    }
    

}
