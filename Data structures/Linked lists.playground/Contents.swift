// Linked lists

class LinkedNode<Element> {
    let value: Element
    var next: LinkedNode?
    
    init(value: Element, next: LinkedNode?) {
        self.value = value
        self.next = next
    }
    
    func printList() {
        var currentNode: LinkedNode? = self
        while currentNode != nil {
            print(currentNode?.value ?? -1)
            currentNode = currentNode?.next
        }
    }
}
