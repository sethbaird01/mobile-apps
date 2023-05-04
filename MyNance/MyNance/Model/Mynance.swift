//
//  Mynance.swift
//  MyNance
//
//  Created by Baird, Seth J on 5/4/23.
//

import Foundation

class Mynance {
    //computed and dynamic vars
    
    static var balance: Double {
        mnTransactions.map { $0.amount }.reduce(0, +)
    }
    
    static var mnTransactions: [Transaction] { TransactionStore.getAllTransactions()
    }
    
}
