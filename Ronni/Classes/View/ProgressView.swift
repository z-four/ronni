//
//  ProgressView.swift
//  Pods
//
//  Created by Administrator on 08.07.17.
//
//

import Foundation

@IBDesignable
public class ProgressView: UIView {
    private let kLineWidth: CGFloat = 2.0
    
    private let kAnimationDuration: CFTimeInterval = 0.9
    private let kAnimationType = "transform.rotation"
    private let kAnimationKey = "rotationAnimation"
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createLayers()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        createLayers()
    }
    
    private func createLayers() {
        let centerPoint = CGPoint(x: frame.width / 2, y: frame.height / 2)
        let startAngle = CGFloat(3 * Double.pi / 2)
        let endAngle = CGFloat(Double.pi)
        //let color = UIColor.lightGray.withAlphaComponent(0.2)
      
//        let backgroundLayer = getProgressViewLayer(centerPoint: centerPoint, startAngle: startAngle, endAngle: endAngle, clockwise: false, color: color)
        let progressLayer = getProgressViewLayer(centerPoint: centerPoint, startAngle: startAngle, endAngle: endAngle)
        
        layer.addSublayer(progressLayer)
       // layer.addSublayer(backgroundLayer)
    }
    
    private func getProgressViewLayer (centerPoint: CGPoint, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool = true, color: UIColor = UIColor.white) -> CAShapeLayer {
        
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(arcCenter: centerPoint, radius: centerPoint.x - kLineWidth, startAngle: startAngle, endAngle:endAngle, clockwise: clockwise).cgPath
        layer.backgroundColor = UIColor.clear.cgColor
        layer.fillColor = nil
        layer.lineWidth = kLineWidth
        layer.strokeStart = 0.0
        layer.strokeEnd = 1.0
        layer.strokeColor = color.cgColor
        
        return layer
    }
    
    public func stop() {
        layer.removeAllAnimations()
    }
    
    public func start() {
        let animation = CABasicAnimation(keyPath: kAnimationType)
        animation.byValue = 2 * Double.pi
        animation.repeatCount = .infinity
        animation.duration = kAnimationDuration
        animation.isRemovedOnCompletion = false
        
        layer.add(animation, forKey: kAnimationKey)
    }
}
