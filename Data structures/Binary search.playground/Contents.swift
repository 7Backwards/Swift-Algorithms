// Binary search (if the question has given an sorted array, almost always we should use this)

// What this does is always goes to the middle of the array and compares if the value is higher or lower or the same as the middle of the array, if it is lower it does a binarySearch on the lower range of the array, if not it does the opposite. It's has way better performance than simply trying to get the value from an array like we use to

extension RandomAccessCollection where Element: Comparable {
    func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
        let range = range ?? startIndex..<endIndex
        guard range.lowerBound < range.upperBound else {
            return nil
        }
        
        let size = distance(from: range.lowerBound, to: range.upperBound)
        let middle = index(range.lowerBound, offsetBy: size / 2)
        
        if self[middle] == value {
            return middle
        } else if self[middle] > value {
            return binarySearch(for: value, in: range.lowerBound..<middle)
        } else {
            return binarySearch(for: value, in: index(after: middle)..<range.upperBound)
        }
    }
} 


func binarySearch(for value: Int, in array: [Int]) -> Int? {
    
    func binarySearch2(for value: Int, in array: [Int], low: Int, high: Int) -> Int? {
        
        guard low <= high else {
            return nil
        }

        let mid = (low + high) / 2
        
        if array[mid] == value {
            return mid
        } else if array[mid] > value {
            return binarySearch2(for: value, in: array, low: low, high: mid - 1)
        } else {
            return binarySearch2(for: value, in: array, low: mid + 1, high: high)
        }
    }
    
    return binarySearch2(for: value, in: array, low: 0, high: array.count - 1)
}
