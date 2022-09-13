import UIKit

let raceLengthKm: Int = 5
var elapsedMin: Double = 6.25
var traveledKm: Int = 1

var pace: Double = (elapsedMin / Double(traveledKm))
print(pace)
var remainingDistKm = raceLengthKm-traveledKm
var totalTimeMin = Double(raceLengthKm) * pace
var remainingTimeMin = Double(remainingDistKm) * pace

print("At the current pace, it will take an additional \(remainingTimeMin) minutes to finish the race.")

print("At the current pace, the total time will be \(totalTimeMin) minutes for the \(raceLengthKm) kilometers")



let currGpa: Double = 2.8
let targetGpa: Double = 3.0
var currCredits: Int = 25
var addCredits: Int = 15

var calc =

//finalgpa = ((currgpa*currcredits) + (addcredits*calc))/(currcredits+addcredits)

print("To achieve a target GPA of \(targetGpa), the GPA for the next \(addCredits) credits needs to be \(calc) or higher.")



var mealCost: Double = 142.42
if(mealCost <= 50){
    mealCost -= 10;
}

if(mealCost > 50 && mealCost < 100){
    mealCost -= 20;
}

if(mealCost >= 100){
    mealCost *= 0.7
}

enum ServiceTypes {
    case bad, soso, good, excellent, superior
}
var service = ServiceTypes.excellent

var tip: Double = 0;
switch service {
    case .bad:
        tip = 0
    case .soso:
        tip = mealCost * 0.1
    case .good:
        tip = mealCost * 0.15
    case .excellent:
        tip = mealCost * 0.20
    case .superior:
        tip = mealCost * 0.25
}

print("Total = \(mealCost), tip = \(tip)")
