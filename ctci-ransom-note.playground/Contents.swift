
// https://www.hackerrank.com/challenges/ctci-ransom-note/problem

func checkMagazine(magazine: [String], note: [String]) -> Void {
    
    var magazineDictionary: [String: Int] = [:]
    
    for word in magazine {
        if let _ = magazineDictionary[word] {
            magazineDictionary[word]! += 1
        } else {
            magazineDictionary[word] = 1
        }
    }
    
    for noteWord in note {
        if let magDic = magazineDictionary[noteWord], magDic > 0 {
            magazineDictionary[noteWord]! -= 1
        } else {
            print("No")
            return 
        }
    }
    
    print("Yes")
}
