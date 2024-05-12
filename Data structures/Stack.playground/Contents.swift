// Stack

struct Stack<Element> {
    private var storage: [Element] = []
    
    mutating func push(element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        storage.popLast()
    }
    
    func peek() -> Element? {
        storage.last
    }
}
