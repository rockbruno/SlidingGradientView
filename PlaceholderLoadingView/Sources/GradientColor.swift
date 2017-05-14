import UIKit

public struct GradientColor {
    let color: UIColor
    let location: NSNumber

    init(color: UIColor, location: NSNumber) {
        self.color = color
        self.location = location
    }
}
