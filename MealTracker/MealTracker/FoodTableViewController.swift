//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by Baird, Seth J on 4/25/23.
//

import Foundation
import UIKit

var meals: [Meal] {
    var breakfast = Meal(name: "breakfast", food: [])
    var lunch = Meal(name: "lunch", food: [])
    var dinner = Meal(name: "dinner", food: [])
    
    return [breakfast, lunch, dinner]
}

class FoodTableViewController: UITableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[section].food.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "Food")!
    }
    
}
