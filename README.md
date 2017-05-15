# SlidingGradientView

[![Version](https://img.shields.io/cocoapods/v/SlidingGradientView.svg?style=flat)](http://cocoapods.org/pods/SlidingGradientView)
[![License](https://img.shields.io/cocoapods/l/SlidingGradientView.svg?style=flat)](http://cocoapods.org/pods/SlidingGradientView)
[![Platform](https://img.shields.io/cocoapods/p/SlidingGradientView.svg?style=flat)](http://cocoapods.org/pods/SlidingGradientView)

SlidingGradientView adds a sliding gradients to images in order to give the impression that something is loading. This is mostly meant to be used with images that resemble placeholders.

[![Loading](https://i.imgur.com/fARnxgL.gif)](http://cocoapods.org/pods/SlidingGradientView)

# Usage
```swift
let image = UIImage(named: "placeholderEvents")
let placeholderView = SlidingGradientView(image: image)
//addSubview and constraints
placeholderView.startAnimating()
```

## Customization

By default, SlidingGradientView uses a gradient that starts and end at `RGB 248 248 248` and traverses 120% of the image's bounds in 0.7 seconds. You can edit these properties by creating a `GradientProperties` object like this:

```swift
//Use UIColor.white.withAlphaComponent(0) for transparency, not UiColor.clear!
let gradientColors = [
                      GradientColor(color: UIColor.white.withAlphaComponent(0), location: 0),
                      GradientColor(color: UIColor.red, location: 0.5),
                      GradientColor(color: UIColor.white.withAlphaComponent(0), location: 1)
                     ]
let slidingProperties = SlidingProperties(fromPercentage: 50, toPercentage: 100, animationDuration: 3)
let properties = GradientProperties(gradientWidth: 300, gradientColors: gradientColors, slidingProperties: slidingProperties)
let placeHolder2 = SlidingGradientView(image: image, properties: properties)
```


# Installation

### CocoaPods

```ruby
pod "SlidingGradientView"
```

## Author

rockbruno, brunorochaesilva@gmail.com

## License

SlidingGradientView is available under the MIT license. See the LICENSE file for more info.
