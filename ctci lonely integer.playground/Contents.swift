// https://www.hackerrank.com/challenges/ctci-lonely-integer

func findLonely(arr: [Int]) -> Int {
    var dictionary: [Int: Int] = [:]
    
    for value in arr {
        if let _ = dictionary[value] {
            dictionary[value]! += 1
        } else {
            dictionary[value] = 1
        }
    }
    
    if let lonely = dictionary.first(where: { dic in
        dic.value == 1
    }) {
        
        return lonely.key
    }
    
    return 0
}
