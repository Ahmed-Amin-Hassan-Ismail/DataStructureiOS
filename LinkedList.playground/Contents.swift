import UIKit



//MARK: - Linked List


class Node<Value> {
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else { return "\(value)"}
        return "\(value) -> " + String(describing: next) + " "
    }
}

struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    init() { }
    
    var isEmpty: Bool {
        return (head == nil)
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else { return "Empty List"}
        return String(describing: head)
    }
}


//MARK: - Add New Values

// push operation

extension LinkedList {
    mutating func push(_ value: Value) {
        self.head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
}

example(of: "Push") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print(list)
}


// append operation

extension LinkedList {
    mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        tail = tail!.next
    }
}

example(of: "append") {
  var list = LinkedList<Int>()
  list.append(1)
  list.append(2)
  list.append(3)
  print(list)
}


// inser(after:) operation

extension LinkedList {
    func node(at index: Int) -> Node<Value>? {
        
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    @discardableResult
    mutating func insert(_ value: Value,
                         after node: Node<Value>) -> Node<Value> {
        
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
}


example(of: "inserting at a particular index") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  print("Before inserting: \(list)")
  var middleNode = list.node(at: 1)!
  for _ in 1...4 {
    middleNode = list.insert(-1, after: middleNode)
  }
  print("After inserting: \(list)")
}
