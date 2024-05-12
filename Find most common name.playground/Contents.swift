let names = [
    "Alice", "Bob", "Charlie", "David", "Eve", "Frank",
    "Grace", "Helen", "Isaac", "Julia", "Kevin", "Liam",
    "Mia", "Nora", "Oscar", "Piper", "Quinn", "Rachel",
    "Steve", "Tina", "Uma", "Victor", "Wendy", "Xavier",
    "Yara", "Zack", "Alice", "Alice", "Bob", "Charlie"
]

let startTime = Date()

var namesRepeatedDictionary: [String : Int] = [:]

names.forEach { name in
    if let _ = namesRepeatedDictionary[name] {
        namesRepeatedDictionary[name]! += 1
    } else {
        namesRepeatedDictionary[name] = 1
    }
}

var mostRepeatedName: (String, Int) = ("", 0)

for name in namesRepeatedDictionary {
    if name.value > mostRepeatedName.1 {
        mostRepeatedName = (name.key, name.value)
    }
}

print(mostRepeatedName)
