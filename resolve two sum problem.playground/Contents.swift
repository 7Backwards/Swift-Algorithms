import Foundation

// TASK: given an array of numbers return the first indexes where a sum of those values is equal to the target
// ex: [2,7,11,15,5,3] target 20

func twoSum(nums: [Int], target: Int) -> [Int] {
    var numsDict: [Int: Int] = [:]

    nums.enumerated().forEach { index, num in
        numsDict[num] = index
    }    

    for (index, num) in nums.enumerated() {
        let wantedValue = target - num

        if let numDict = numsDict[wantedValue] {
            return [numDict, index]
        }
    }

    return []
}

print(twoSum(nums: [2,7,11,15,5,3], target: 20))
