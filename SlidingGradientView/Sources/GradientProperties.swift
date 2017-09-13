import UIKit

public struct GradientProperties {
    let gradientWidth: CGFloat
    let gradientColors: [GradientColor]
    let slidingProperties: SlidingProperties
    
    public init(gradientWidth: CGFloat = defaultGradientWidth,
                gradientColors: [GradientColor] = defaultGradientColors,
                slidingProperties: SlidingProperties = defaultSlidingProperties) {
        self.gradientWidth = gradientWidth
        self.gradientColors = gradientColors
        self.slidingProperties = slidingProperties
    }
    
    public init() {
        self.init(gradientWidth: GradientProperties.defaultGradientWidth,
                  gradientColors: GradientProperties.defaultGradientColors,
                  slidingProperties: GradientProperties.defaultSlidingProperties)
    }
    
    public static let defaultGradientWidth = UIScreen.main.bounds.width / 2.2
    public static let defaultGradientColors = [
        GradientColor(
            color:
            UIColor(red: 241.0 / 255.0,
                    green: 241.0 / 255.0,
                    blue: 241.0 / 255.0,
                    alpha: 1.0),
            location: 0),
        GradientColor(
            color:
            UIColor(red: 246.0 / 255.0,
                    green: 246.0 / 255.0,
                    blue: 246.0 / 255.0,
                    alpha: 1.0),
            location: 0.25),
        GradientColor(
            color:
            UIColor(red: 248.0 / 255.0,
                    green: 248.0 / 255.0,
                    blue: 248.0 / 255.0,
                    alpha: 1.0),
            location: 0.50),
        GradientColor(
            color:
            UIColor(red: 246.0 / 255.0,
                    green: 246.0 / 255.0,
                    blue: 246.0 / 255.0,
                    alpha: 1.0),
            location: 0.75),
        GradientColor(
            color:
            UIColor(red: 241.0 / 255.0,
                    green: 241.0 / 255.0,
                    blue: 241.0 / 255.0,
                    alpha: 1.0),
            location: 1.0)
    ]
    public static let defaultSlidingProperties = SlidingProperties()
}
