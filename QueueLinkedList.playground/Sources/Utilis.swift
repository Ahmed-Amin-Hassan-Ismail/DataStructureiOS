import Foundation



public func example(_ description: String, action: () -> Void ) {
    
    print("---- example of \(description) ---- \n")
    
    action()
}
