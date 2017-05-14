import UIKit

private struct Strings {
    static let position = "position"
    static let animationKey = "slide"
}

public final class PlaceholderLoadingView: UIImageView {

    let gradientWidth: CGFloat
    let distance: CGFloat
    
    private var layerPositionOffset: CGFloat = 0
    
    private let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.colors = []
        gradient.locations = []
        gradient.isOpaque = true
        gradient.isHidden = true
        return gradient
    }()
    
    private let maskImageView = UIImageView()
    private let gradientView: UIView = UIView()
    
    public init(image: UIImage?,
         properties: PlaceholderLoadingProperties = .default) {
        gradientWidth = properties.gradientWidth
        distance = properties.finalGradientXPosition
        super.init(image: image)
        animationDuration = properties.animationDuration
        properties.gradientColors.forEach {
            gradientLayer.colors?.append($0.color)
            gradientLayer.locations?.append($0.location)
        }
        setUp()
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    private func setUp() {
        setupMaskView()
        setupGradientView()
        setupLayer()
    }
    
    private func setupMaskView() {
        addSubview(maskImageView)
        maskImageView.image = image
    }
    
    private func setupGradientView() {
        addSubview(gradientView)
        constrainGradientView()
    }
    
    private func constrainGradientView() {
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: topAnchor),
            gradientView.leftAnchor.constraint(equalTo: leftAnchor),
            gradientView.rightAnchor.constraint(equalTo: rightAnchor),
            gradientView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupLayer() {
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
        gradientView.layer.mask = maskImageView.layer
    }
    
    override public func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradientLayer.frame = CGRect(x: 0, y: 0, width: gradientWidth, height: gradientView.frame.size.height)
        layerPositionOffset = gradientLayer.position.x
        gradientLayer.position.x = -layerPositionOffset
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        //Can't constrain masks.
        maskImageView.frame = self.bounds
    }
    
    override public func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        let shouldResumeAnimation = gradientLayer.isHidden == false
        if shouldResumeAnimation {
            startAnimating()
        }
    }
    
    override public func startAnimating() {
        guard gradientLayer.animationKeys()?.contains(Strings.animationKey) != true else {
            return
        }
        gradientLayer.isHidden = false
        updateConstraintsIfNeeded()
        layoutIfNeeded()
        addAnimation()
    }
    
    private func addAnimation() {
        let positionAnimation = CABasicAnimation(keyPath: Strings.position)
        let fromX = -layerPositionOffset
        let fromY = gradientLayer.position.y
        positionAnimation.fromValue = CGPoint(x: fromX, y: fromY)
        let toX = distance + layerPositionOffset
        let toY = gradientLayer.position.y
        positionAnimation.toValue = CGPoint(x: toX, y: toY)
        positionAnimation.duration = animationDuration
        positionAnimation.repeatCount = .infinity
        gradientLayer.add(positionAnimation, forKey: Strings.animationKey)
    }
    
    override public func stopAnimating() {
        guard gradientLayer.isHidden == false else {
            return
        }
        gradientLayer.position.x = -layerPositionOffset
        gradientLayer.removeAnimation(forKey: Strings.animationKey)
        gradientLayer.isHidden = true
    }
}
