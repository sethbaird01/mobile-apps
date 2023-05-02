//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by Baird, Seth J on 4/25/23.
//

import Foundation
import UIKit

var meals: [Meal] {
    let breakfast = Meal(name: "breakfast", food: [Food(name: "BreakfastFood1", description: "a"), Food(name: "BreakfastFood2", description: "b"), Food(name: "BreakfastFood3", description: "c")])
    let lunch = Meal(name: "lunch", food: [Food(name: "LunchFood1", description: "a"), Food(name: "LunchFood2", description: "b"), Food(name: "LunchFood3", description: "c")])
    let dinner = Meal(name: "dinner", food: [Food(name: "DinnerFood1", description: "a"), Food(name: "DinnerFood2", description: "b"), Food(name: "DinnerFood3", description: "c")])
    
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
        var element = tableView.dequeueReusableCell(withIdentifier: "Food")!
        var cc = element.defaultContentConfiguration()
        cc.text = meals[indexPath.section].food[indexPath.row].name
        cc.secondaryText = meals[indexPath.section].food[indexPath.row].description
        element.contentConfiguration = cc
        return element
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
    
}
