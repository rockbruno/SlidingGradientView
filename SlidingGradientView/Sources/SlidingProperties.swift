import UIKit

public struct SlidingProperties {
    let fromX: CGFloat
    let toX: CGFloat
    let animationDuration: TimeInterval
    
    public init(fromX: CGFloat = 0, toX: CGFloat = UIScreen.main.bounds.width * 1.2, animationDuration: TimeInterval = 0.7) {
        self.fromX = fromX
        self.toX = toX
        self.animationDuration = animationDuration
    }
}
