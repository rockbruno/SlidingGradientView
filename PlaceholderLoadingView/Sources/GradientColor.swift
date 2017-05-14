import UIKit

public struct GradientColor {
    let color: UIColor
    let location: NSNumber
    
    public init() {
        self.color = UIColor.blue
        self.location = 0
    }
    
    public init(color: UIColor, location: NSNumber) {
        self.color = color
        self.location = location
    }
}
