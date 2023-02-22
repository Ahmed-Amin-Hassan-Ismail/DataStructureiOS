import UIKit


//MARK: - Stack

// Basic implementation of the stack

struct Stack<Element> {
    private var storage: [Element] = []
    
    init() { }
    
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        storage.popLast()
    }
}

extension Stack: CustomDebugStringConvertible {
    var debugDescription: String {
         """
         -----Top-------
         \(storage.map { "\($0)"}.reversed().joined(separator: "\n") )
         """
    }
}


example(of: "Using Stack") {
    var stack = Stack<Int>()
    stack.push(5)
    stack.push(10)
    stack.push(15)
    stack.push(20)
    
    print(stack)
    
    
    stack.pop()
    
    print(stack)
}


