import Foundation



public func example(_ description: String, action: () -> Void) {
    
    print("---- Example of \(description) ----- \n")
    action()
}
