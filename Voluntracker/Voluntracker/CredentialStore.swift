//
//  CredentialStore.swift
//  Voluntracker
//
//  Created by Baird, Seth J on 2/9/23.
//

import Foundation

class CredentialStore {

    //struct holding all user information
    struct User: Codable {
        let username: String
        var password: String
        var hours, goal: Int
    }
    
    //prints all users found in db (run on startup)
    static func printAllUsers() {
        for (_, val) in
                UserDefaults.standard.dictionaryRepresentation() {

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

    //converts a user to JSON and stores it in UD
    static func storeUser(u: User) -> (){
        do {
            let data = try JSONEncoder().encode(u)
            UserDefaults.standard.set(data, forKey: u.username)
            print("store updated")
            printAllUsers()
        } catch let error {
            print("JSON error \(error) on username \(u.username)")
        }
    }
    
    //checks UD for given user
    static func contains(un: String) -> Bool{
        do {
            _ = try JSONDecoder().decode(User.self, from: UserDefaults.standard.data(forKey: un) ?? Data())
            return true
        } catch _ {
            return false
        }
    }
    
    //sets password of given user by saving a duplicate to UD
    //then returns the new user
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
    
    //sets goal and returns new user by same method of setPassword()
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
    
    //sets hours and returns new user
    //no need to check is username exists since caller fn already has User
    static func updateHours(user: User, newHours: Int) -> User{
            var currUser = user
            currUser.hours = newHours
            storeUser(u: currUser)
        
            print("store updated")
        print("\(currUser.username) -> \(newHours)")
        return currUser
    }
    
    //looks for given username in UD and returns a JSON-decoded version if present
    static func getUser(un: String) -> Result<User, Error>{
        do {
            let data = try JSONDecoder().decode(User.self, from: UserDefaults.standard.data(forKey: un) ?? Data())
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
