import UIKit


//MARK: - Stack

// Basic implementation of the stack

struct Stack<Element> {
    
    //MARK: - Variables
    
    private var storage: [Element]
    
    
    //MARK: - Init
    
    init(_ elements: [Element]) {
        storage = elements
    }
    
    
    //MARK: - Mutating Methods
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        storage.popLast()
    }
    
    
    //MARK: - Non-Mutating Methods
    
    func peek() -> Element? {
        storage.last
    }
    
    func isEmpty() -> Bool {
        peek() == nil
    }
}

//MARK: - ExpressibleByArrayLiteral

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        storage = elements
    }
}

//MARK: - CustomDebugStringConvertible

extension Stack: CustomDebugStringConvertible {
    var debugDescription: String {
         """
         -----Top-------
         \(storage.map { "\($0)"}.reversed().joined(separator: "\n") )
         """
    }
}


example(of: "initializing a stack from an array") {
  let array = ["A", "B", "C", "D"]
  var stack = Stack(array)
  print(stack)
  stack.pop()
}


example(of: "initializing a stack from an array literal") {
  var stack: Stack = [1.0, 2.0, 3.0, 4.0]
  print(stack)
  stack.pop()
}

