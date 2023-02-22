import UIKit

//MARK: - Stack Answer Chanllenges


//TODO: - Challenge 1: Reverse an Array

let array: [Int] = [1, 2, 3, 4, 5]

func printInReverse<T>(_ values: [T]) {
    
    var stack = Stack<T>()
    
    for value in values {
        stack.push(value)
    }
    
    while let value = stack.pop() {
        print(value)
    }
}

printInReverse(array)



//TODO: - Challenge 2: Balance the parentheses

let testString1 = "h((e))llo(world)("

func checkParentheses(_ string: String) -> Bool {
    
    var stack = Stack<Character>()
    
    for char in string {
        
        if char == "(" {
            stack.push(char)
        } else if char == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.pop()
            }
        }
    }
    
    return stack.isEmpty
}

print(checkParentheses(testString1))
