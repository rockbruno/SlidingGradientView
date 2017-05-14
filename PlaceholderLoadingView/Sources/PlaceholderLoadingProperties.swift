import UIKit

public struct PlaceholderLoadingProperties {
    let gradientWidth: CGFloat
    let gradientColors: [GradientColor]
    let finalGradientXPosition: CGFloat
    let animationDuration: TimeInterval
    
    public init(gradientWidth: CGFloat, gradientColors: [GradientColor],
         finalGradientXPosition: CGFloat, animationDuration: TimeInterval) {
        self.gradientWidth = gradientWidth
        self.gradientColors = gradientColors
        self.finalGradientXPosition = finalGradientXPosition
        self.animationDuration = animationDuration
    }
    
    public static let `default` = PlaceholderLoadingProperties(
                            gradientWidth: UIScreen.main.bounds.width / 2.2,
                            gradientColors: [
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
                            ],
                            finalGradientXPosition: UIScreen.main.bounds.width * 1.2,
                            animationDuration: 0.7)
}
