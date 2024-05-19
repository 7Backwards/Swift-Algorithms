import Foundation

// TASK: Spiral Traverse given an m x n matrix, return all of the matrix in spiral order
// input: matrix = [[1,2,3], [4,5,6], [7,8,9]]
// output: [1,2,3,6,9,8,7,4,5]

let matrix = [[1,2,3], [4,5,6], [7,8,9]]

func getMatrixElementsInSpiralOrder(matrix: [[Int]]) -> [Int] {
    var visitedIndexes: [(Int, Int)] = []
    var output: [Int] = []
    let leftRange = 0
    let rightRange = matrix[0].count - 1
    let topRange = 0
    let bottomRange = matrix.count - 1

    
    func addNextElementToSpiralOrder(index: (m: Int, n: Int)) {
        let m = index.m
        let n = index.n
        visitedIndexes.append((m, n))
        if n + 1 <= rightRange, !visitedIndexes.contains(where: { $0 == (m, n + 1)}) {
            output.append(matrix[m][n+1])
            addNextElementToSpiralOrder(index: (m, n + 1))
        } else if m + 1 <= bottomRange, !visitedIndexes.contains(where: { $0 == (m + 1, n)}) {
            output.append(matrix[m + 1][n])
            addNextElementToSpiralOrder(index: (m + 1, n))
        } else if n - 1 >= leftRange, !visitedIndexes.contains(where: { $0 == (m, n - 1)}) {
            output.append(matrix[m][n - 1])
            addNextElementToSpiralOrder(index: (m, n - 1))
        } else if m - 1 >= topRange, !visitedIndexes.contains(where: { $0 == (m - 1, n)}) {
            output.append(matrix[m - 1][n])
            addNextElementToSpiralOrder(index: (m - 1, n))
        }
    }
    output.append(matrix[0][0])
    addNextElementToSpiralOrder(index: (0,0))
    
    return output
}

print(getMatrixElementsInSpiralOrder(matrix: matrix))
