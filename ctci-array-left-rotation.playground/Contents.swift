/*
 * Complete the 'rotLeft' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts following parameters:
 *  1. INTEGER_ARRAY a
 *  2. INTEGER d
 */

// https://www.hackerrank.com/challenges/ctci-array-left-rotation/problem

func rotLeft(a: [Int], d: Int) -> [Int] {
    var newArray = a
    func rotLeftOnce(a: inout [Int]) {
        let firstValue = a.first
        
        a.removeFirst()
        
        if let firstValue {
            a.append(firstValue)
        }
    }
    
    for i in 1...d {
        rotLeftOnce(a: &newArray)
    }
    
    return newArray
}

let array = [1,2,3,4,5]

let newArray = rotLeft(a: array, d: 2)

print(newArray)
