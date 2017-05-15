import UIKit

public struct SlidingProperties {
    let fromPercentage: CGFloat
    let toPercentage: CGFloat
    let animationDuration: TimeInterval
    
    public init(fromPercentage: CGFloat = 0, toPercentage: CGFloat = 120, animationDuration: TimeInterval = 0.7) {
        self.fromPercentage = fromPercentage
        self.toPercentage = toPercentage
        self.animationDuration = animationDuration
    }
}
