import Foundation



// Time Complexity : is a measure time required to an algorithm as i/p increases

// MARK: - Constant Time O(1)

public func checkFirst(name: [String]) {
    
    if let first = name.first {
        print(first)
    } else {
        print("no names")
    }
}

// MARK: ----------------------------------------------------------------------------------------


// MARK: - Linear Time O(n)

public func printNames(names: [String]) {
    
    for name in names {
        print(name)
    }
}

// MARK: ----------------------------------------------------------------------------------------


// MARK: - Quadratic Time O(n2)

public func printNames2(names: [String]) {
    
    for _ in names {
        for name in names {
            print(name)
        }
    }
}

// MARK: ----------------------------------------------------------------------------------------


// MARK: - Logarithmic Time O(log n)

func sortByMiddle(_ value: Int, in array: [Int]) -> Bool {
    
    guard !array.isEmpty else { return false}
    
    let middleIndex = array.count / 2
    
    if value <= array[middleIndex] {
        for index in 0...middleIndex {
            if array[index] == value {
                return true
            }
        }
    } else {
        for index in middleIndex..<array.count {
            if array[index] == value {
                return true
            }
        }
    }
    
    return false
}

// MARK: ----------------------------------------------------------------------------------------


// MARK: - Space Complexity

public func printSorted(_ array: [Int]) {
    
    guard !array.isEmpty else { return }
    
    var currentCount = 0
    var minValue = Int.min
    
    for value in array {
        if value == minValue {
            print(value)
            currentCount += 1
        }
    }
    
    while currentCount < array.count {
        
        var currentValue = array.max()!
        for value in array {
            if value < currentValue && value > minValue {
                currentValue = value
            }
        }
            for value in array {
                if value == currentValue {
                    print(value)
                    currentCount += 1
            }
        }
        minValue = currentValue
    }
}


/*
 
 Key points
 
 • Time complexity is a measure on the time required to run an algorithm as the input size increases.
 • You should know about constant time, logarithmic time, linear time, quasilinear time and quadratic time and be able to order them by cost.
 • Space complexity is a measure of the resources required for the algorithm to run.
 • Big O notation is used to represent the general form of time and space complexity.
 • Time and space complexity are high-level measures of scalability; they do not measure the actual speed of the algorithm itself.
 • For small data sets, time complexity is usually irrelevant. For example, a quasilinear algorithm can be slower than a quadratic algorithm when n is small.
 
 */
