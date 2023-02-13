//
//  CredentialStore.swift
//  Voluntracker
//
//  Created by Baird, Seth J on 2/9/23.
//

import Foundation

class CredentialStore {

    struct User: Codable {
        let username: String
        var password: String
        var hours, goal: Int
    }
    
    static func printAllUsers() {
        for (_, val) in
                UserDefaults.standard.dictionaryRepresentation() {
//            print("data encountered: \(val)")

            if let value = val as? Data {
                do{
                    let data = try JSONDecoder().decode(User.self, from: value)
                    let currentUser = data as User
                    print("un: \(currentUser.username) | pw: \(currentUser.password)")
                }
                catch let error {
                    print("error: \(error)")
                }
            }

        }
    }

    static func storeUser(u: User) -> (){
        do {
            let data = try JSONEncoder().encode(u)
            UserDefaults.standard.set(data, forKey: u.username)
//            print("Stored element with username \(u.username)")
            print("store updated")
            printAllUsers()
        } catch let error {
            print("JSON error \(error) on username \(u.username)")
        }
    }
    
    static func contains(un: String) -> Bool{
        do {
            _ = try JSONDecoder().decode(User.self, from: UserDefaults.standard.data(forKey: un) ?? Data())
            return true
        } catch _ {
            return false
        }
    }
    
    static func setPassword(un: String, pw: String) -> Result<User, Error>{
        do {
            var currUser = try getUser(un: un).get()
            currUser.password = pw
            storeUser(u: currUser)
            print("store updated")
            printAllUsers()
            return .success(currUser)
        } catch let err {
            print("No such user \(un)")
            return .failure(err)
        }
    }
    
    static func setGoal(un: String, newGoal: Int) -> Result<User, Error>{
        do {
            var currUser = try getUser(un: un).get()
            currUser.goal = newGoal
            storeUser(u: currUser)
            print("store updated")
            printAllUsers()
            return .success(currUser)
        } catch let err {
            print("No such user \(un)")
            return .failure(err)
        }
    }
    
    static func updateHoursTo(user: User, newHours: Int){
            var currUser = user
            currUser.hours = newHours
            storeUser(u: currUser)
        
            print("store updated")
            printAllUsers()
    }
    
    static func getUser(un: String) -> Result<User, Error>{
        do {
            let data = try JSONDecoder().decode(User.self, from: UserDefaults.standard.data(forKey: un) ?? Data())
//            print("Got element with username \(un), password is \((data as User).password)")
            return .success(data)
        } catch let err {
            print("No such user \(un)")
            return .failure(err)
        }
    }
    
    static func removeUser(un: String){
            UserDefaults.standard.removeObject(forKey: un)
    }
    
}
