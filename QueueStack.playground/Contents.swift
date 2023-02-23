import UIKit

//MARK: - Double Stack Implementation

/* */

/* Basic Implementation */
protocol Queue {
    
    associatedtype Element
    
    var isEmpty: Bool { get }
    var peek: Element? { get }
    
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
}

struct QueueStack<T>: Queue {
typealias Element = T
    
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    
    
    var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    var peek: T? {
        return !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    
    mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        
        return leftStack.popLast()
    }
}

extension QueueStack: CustomStringConvertible {
  public var description: String {
    String(describing: leftStack.reversed() + rightStack)
  }
}

var queue = QueueStack<String>()
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
queue
queue.dequeue()
queue
queue.peek
