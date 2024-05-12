// Binary Trees

class BinaryNode<Element> {
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(value: Element, leftChild: BinaryNode? = nil, rightChild: BinaryNode? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

extension BinaryNode {
    func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traverseInOrder(visit: visit)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        rightChild?.traverseInOrder(visit: visit)
        visit(value)
    }
}
