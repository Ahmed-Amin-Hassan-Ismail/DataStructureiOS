import UIKit


//MARK: - Doubly Linked List Queue

/* Basic Implementation */

protocol Queue {
    
    associatedtype Element
    
    var isEmpty: Bool { get }
    var peek: Element? { get }
    
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
}


/* Implementation */

struct QueueLinkedList<T>: Queue {
    typealias Element = T
    
    // properties
    private var list = DoublyLinkedList<T>()
    
    var isEmpty: Bool {
        list.isEmpty
    }
    
    var peek: T? {
        return list.first?.value
    }

    mutating func enqueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }

    mutating func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }
        return list.remove(element)
    }
}

extension QueueLinkedList: CustomStringConvertible {
  public var description: String {
    String(describing: list)
  }
}

example("Queue Linked List") {
    var queue = QueueLinkedList<String>()
    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    queue
    queue.dequeue()
    queue
    queue.peek
}

