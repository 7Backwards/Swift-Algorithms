import Foundation

struct MaxHeap {
    var heap: [Int] = []
    
    func parentIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func leftChildIndex(_ index: Int) -> Int {
        return 2 * index + 1
    }
    
    func rightChildIndex(_ index: Int) -> Int {
        return 2 * index + 2
    }
    
    mutating func insert(_ value: Int) {
        heap.append(value)
        heapifyUp(from: heap.count - 1)
    }
    
    mutating func extractMax() -> Int? {
        if heap.isEmpty {
            return nil
        }
        if heap.count == 1 {
            return heap.removeFirst()
        }
        let maxValue = heap[0]
        heap[0] = heap.removeLast()
        heapifyDown(from: 0)
        return maxValue
    }
    
    mutating func heapifyUp(from index: Int) {
        var index = index
        while index > 0 && heap[parentIndex(index)] < heap[index] {
            heap.swapAt(parentIndex(index), index)
            index = parentIndex(index)
        }
    }
    
    mutating func heapifyDown(from index: Int) {
        var index = index
        while true {
            let leftIndex = leftChildIndex(index)
            let rightIndex = rightChildIndex(index)
            var largestIndex = index
            
            if leftIndex < heap.count && heap[leftIndex] > heap[largestIndex] {
                largestIndex = leftIndex
            }
            
            if rightIndex < heap.count && heap[rightIndex] > heap[largestIndex] {
                largestIndex = rightIndex
            }
            
            if largestIndex == index {
                break
            }
            
            heap.swapAt(index, largestIndex)
            index = largestIndex
        }
    }
    
    func peek() -> Int? {
        return heap.first
    }
    
    func size() -> Int {
        return heap.count
    }
}

func kLargestNumbers(array: [Int], k: Int) -> [Int] {
    guard array.count >= k else {
        return []
    }
    
    var maxHeap = MaxHeap()
    
    for value in array {
        maxHeap.insert(value)
    }
    
    var result = [Int]()
    for _ in 0..<k {
        if let maxValue = maxHeap.extractMax() {
            result.append(maxValue)
        }
    }
    
    return result.sorted()
}

let array = [1, 65, 21, 523, 1, 6, 324, 1, 6, 3, 12, 26, 7, 3, 3243, 6, 7, 32]
let k = 3
print("Largest \(k) Numbers: \(kLargestNumbers(array: array, k: k))")
// Output should be: [523, 324, 3243]
