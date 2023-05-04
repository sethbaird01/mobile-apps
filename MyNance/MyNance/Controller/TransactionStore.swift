//
//  TransactionStore.swift
//  MyNance
//
//  Created by Baird, Seth J on 5/4/23.
//

// lots of code taken from my past Voluntracker project
import Foundation
class TransactionStore {
    //prints all transactions found in db (run on startup)
    static func getAllTransactions() -> [Transaction] {
        var out: [Transaction] = []
        for (_, val) in
                UserDefaults.standard.dictionaryRepresentation() {

            if let value = val as? Data {
                do{
                    let data = try JSONDecoder().decode(Transaction.self, from: value)
                    let currentTransaction = data as Transaction
//                    print("!!! desc: \(currentTransaction.description) | amout: \(currentTransaction.amount)")
                    out.append(currentTransaction)
                }
                catch let error {
                    print("!!! error: \(error)")
                }
            }

        }
        return out
    }
    
//    static func printDebugKeys() {
//        print("!!! \( UserDefaults.standard.dictionaryRepresentation().keys)")
//    }

    //converts a transaction to JSON and stores it in UD
    static func storeTransaction(transaction: Transaction) -> (){
        do {
            let data = try JSONEncoder().encode(transaction)
            UserDefaults.standard.set(data, forKey: transaction.desc)
            print("!!! store updated")
            print(" !!!\(getAllTransactions())")
        } catch let error {
            print("!!! JSON error \(error) on description \(transaction.desc)")
        }
    }
    
    //checks UD for given transaction
    static func contains(description: String) -> Bool{
        do {
            _ = try JSONDecoder().decode(Transaction.self, from: UserDefaults.standard.data(forKey: description) ?? Data())
            return true
        } catch _ {
            return false
        }
    }
    
    //looks for given description in UD and returns a JSON-decoded version if present
    static func getTransaction(description: String) -> Result<Transaction, Error>{
        do {
            let data = try JSONDecoder().decode(Transaction.self, from: UserDefaults.standard.data(forKey: description) ?? Data())
            return .success(data)
        } catch let err {
            print("!!! No such  \(description)")
            return .failure(err)
        }
    }
    
    static func removeTransaction(description: String){
            UserDefaults.standard.removeObject(forKey: description)
    }
    
}
