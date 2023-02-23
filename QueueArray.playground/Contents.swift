import UIKit

//MARK: - Queue


/* Basic Implementation */
protocol Queue {
    associatedtype Element
    
    var isEmpty: Bool { get }
    var peek: Element? { get }
    
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
}


/* Array Basic Implementaion */
struct QueueArray<T>: Queue {
    
    typealias Element = T
    
    // Properties
    private var array: [T] = []
    
    init() { }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var peek: T? {
        return array.first
    }
    
    
    mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}

extension QueueArray: CustomDebugStringConvertible {
    var debugDescription: String {
        String(describing: array)
    }
}

example("Queue Array") {
    var queue = QueueArray<String>()
    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    queue
    queue.dequeue()
    queue
    queue.peek
}

