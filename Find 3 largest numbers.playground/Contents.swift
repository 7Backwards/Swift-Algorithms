import UIKit

// TASK: three largest number task
// Given an array, return tree largest numbers in ascending order (without using sort)

func threeLargestNumbers(array: [Int]) -> [Int] {
    if array.count < 3 {
        return []
    }
    
    if array.count == 3 {
        return array
    }
    
    var threeLargestNumbers = [0,0,0]
    
    func rearrangeThreeLargestNumbersArray(arrElement: Int) {
        if arrElement > threeLargestNumbers[2] {
            threeLargestNumbers[0] = threeLargestNumbers[1]
            threeLargestNumbers[1] = threeLargestNumbers[2]
            threeLargestNumbers[2] = arrElement
        } else if arrElement > threeLargestNumbers[1] {
            threeLargestNumbers[0] = threeLargestNumbers[1]
            threeLargestNumbers[1] = arrElement
        } else if arrElement > threeLargestNumbers[0] {
            threeLargestNumbers[0] = arrElement
        } else {
            return
        }
    }
    
    for arrElement in array {
        rearrangeThreeLargestNumbersArray(arrElement: arrElement)
    }
    
    return threeLargestNumbers
}

let array = [1,65,21,523,1,6,324,1,6,3,12,26,7,3,3243,6,7,32]

print("Info1: \(threeLargestNumbers(array: array))")
