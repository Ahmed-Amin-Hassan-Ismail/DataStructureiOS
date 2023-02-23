import UIKit


//MARK: - Queue Ring Buffer

/* Known as Circular Buffer with fixed size array */

/* Basic Implementation */

protocol Queue {
    associatedtype Element
    
    var isEmpty: Bool { get }
    var peek: Element? { get }
    
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
}


/* Implementation */

struct QueueRingBuffer<T>: Queue {
    typealias Element = T
    
    // properties
    private var ringBuffer: RingBuffer<T>
    
    // Init
    init(count: Int) {
        ringBuffer = RingBuffer<T>(count: count)
    }
    
    var isEmpty: Bool {
        return ringBuffer.isEmpty
    }
    
    var peek: T? {
        return ringBuffer.first
    }
    
    mutating func enqueue(_ element: T) -> Bool {
        return ringBuffer.write(element)
    }
    
    mutating func dequeue() -> T? {
        return ringBuffer.read()
    }
}

extension QueueRingBuffer: CustomStringConvertible {
  public var description: String {
   String(describing: ringBuffer)
  }
}


example("Queue Ring Buffer") {
    var queue = QueueRingBuffer<String>(count: 10)
    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    queue
    queue.dequeue()
    queue
    queue.peek
}



