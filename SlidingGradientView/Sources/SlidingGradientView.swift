import UIKit

private struct Strings {
    static let position = "position"
    static let animationKey = "slide"
}

public final class SlidingGradientView: UIImageView {

    let gradientWidth: CGFloat
    let slidingProperties: SlidingProperties

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

    private let gradientView: UIView = UIView()
    private let gradientMaskView: UIImageView = UIImageView()

    public init(image: UIImage?, properties: GradientProperties = .init()) {
        gradientWidth = properties.gradientWidth
        slidingProperties = properties.slidingProperties
        super.init(image: image)
        properties.gradientColors.forEach {
            gradientLayer.colors?.append($0.color.cgColor)
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
        addSubview(gradientMaskView)
        gradientMaskView.image = image
    }

    private func setupGradientView() {
        addSubview(gradientView)
        constrainEdges(gradientView, self)
    }

    private func constrainEdges(_ v1: UIView, _ v2: UIView) {
        v1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            v1.topAnchor.constraint(equalTo: v2.topAnchor),
            v1.leftAnchor.constraint(equalTo: v2.leftAnchor),
            v1.rightAnchor.constraint(equalTo: v2.rightAnchor),
            v1.bottomAnchor.constraint(equalTo: v2.bottomAnchor)
            ])
    }

    private func setupLayer() {
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
        gradientView.layer.mask = gradientMaskView.layer
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
        gradientMaskView.frame = self.bounds
    }

    public override func startAnimating() {
        guard gradientLayer.animationKeys()?.contains(Strings.animationKey) != true else {
            return
        }
        alpha = 1.0
        gradientLayer.isHidden = false
        updateConstraintsIfNeeded()
        layoutIfNeeded()
        addAnimation()
    }

    private func addAnimation() {
        let positionAnimation = CABasicAnimation(keyPath: Strings.position)
        let fromX = slidingProperties.fromX - layerPositionOffset
        let fromY = gradientLayer.position.y
        positionAnimation.fromValue = CGPoint(x: fromX, y: fromY)
        let toX = slidingProperties.toX + layerPositionOffset
        let toY = gradientLayer.position.y
        positionAnimation.toValue = CGPoint(x: toX, y: toY)
        positionAnimation.duration = slidingProperties.animationDuration
        positionAnimation.repeatCount = .infinity
        positionAnimation.isRemovedOnCompletion = false
        gradientLayer.add(positionAnimation, forKey: Strings.animationKey)
    }

    public override func stopAnimating() {
        stopAnimating(fadeOut: false)
    }

    public func stopAnimating(fadeOut: Bool = false, completion: (() -> Void)? = nil) {
        guard gradientLayer.isHidden == false else {
            return
        }
        if fadeOut {
            UIView.animate(withDuration: 0.3, animations: { [weak self] in
                self?.alpha = 0.0
                }, completion: { [weak self] _ in
                    self?.removeAnimationsAndHide(completion)
            })
        } else {
            removeAnimationsAndHide(completion)
        }
    }

    private func removeAnimationsAndHide(_ completion: (() -> Void)? = nil) {
        gradientLayer.position.x = -layerPositionOffset
        gradientLayer.removeAnimation(forKey: Strings.animationKey)
        gradientLayer.isHidden = true
        completion?()
    }
}
