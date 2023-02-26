import Foundation



public func example(of description: String, action: () -> Void) {
    print("----example of \(description)----\n")
    action()
}
