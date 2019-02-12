////
////  ArcProgressView.swift
////  skincoach
////
////  Created by Achin Kumar on 09/03/18.
////  Copyright © 2018 vinsol. All rights reserved.
////
//
//import UIKit
//
//@IBDesignable
//class ArcProgressView: UIView {
//    var progressLayer: CAShapeLayer!
//    var trackLayer: CAShapeLayer!
//    
//    private var progress: Float = 0.0
//    private var lastProgress: Float = 0.0
//    
//    @IBInspectable
////    var trackColor = UIColor.Common.TrackColor
//    
//    @IBInspectable
//    public var progressColor = UIColor.Risk.LowBackgroundColor
//   
//    private var progressRedColorRes = UIColor.Risk.HighBackgroundColor
//    
//    @IBInspectable
//    var strokeWidth = CGFloat(6)
//    
//    private var startAngle: Float = 135
//    private var totalSweep: Float = 270
//    
//    private let animationDuration = 0.5     // seconds
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        set()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        set()
//    }
//    
//    func set(trackColor: UIColor? = nil, progressColor: UIColor? = nil, progressRedColor: UIColor? = nil, strokeWidth: CGFloat? = nil, startAngle: Float? = nil, totalSweep: Float? = nil) {
//        subviews.forEach { $0.removeFromSuperview() }
//        if let trackColor = trackColor { self.trackColor = trackColor }
//        if let progressColor = progressColor { self.progressColor = progressColor }
//        if let progressRedColor = progressRedColor { self.progressRedColorRes = progressRedColor }
//        if let strokeWidth = strokeWidth { self.strokeWidth = strokeWidth }
//        if let startAngle = startAngle { self.startAngle = startAngle }
//        if let totalSweep = totalSweep { self.totalSweep = totalSweep }
//        
//        self.backgroundColor = UIColor.clear
//        displayTrack()
//        displayProgress()
//    }
//    
//    func set(progress: Float) {
//        var progress = progress
//        if progress > 1.0 { progress = 1.0 }
//        if progress < 0.0 { progress = 0.0 }
//        lastProgress = self.progress
//        self.progress = progress
//        
//        show(animated: true)
//    }
//    
//    private func displayTrack() {
//        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - strokeWidth)/2, startAngle: CGFloat(startAngle.degreesToRadians), endAngle: CGFloat((135.0 + totalSweep).degreesToRadians), clockwise: true)
//        if trackLayer != nil {
//            trackLayer.removeFromSuperlayer()
//        }
//        trackLayer = CAShapeLayer()
//        trackLayer.path = circlePath.cgPath
//        trackLayer.fillColor = UIColor.clear.cgColor
//        trackLayer.strokeColor = trackColor.cgColor
//        trackLayer.lineWidth = CGFloat(strokeWidth)
//        trackLayer.lineCap = CAShapeLayerLineCap.round
//        
//        layer.addSublayer(trackLayer)
//    }
//    
//    private func displayProgress() {
//        if progressLayer != nil {
//            progressLayer.removeFromSuperlayer()
//        }
//        
//        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - strokeWidth)/2, startAngle: CGFloat(startAngle.degreesToRadians), endAngle: CGFloat((startAngle + totalSweep).degreesToRadians), clockwise: true)
//
//        let color = RiskLevel.forPercent(progress * 100).color.cgColor
//        
//        progressLayer = CAShapeLayer()
//        progressLayer.path = circlePath.cgPath
//        progressLayer.fillColor = UIColor.clear.cgColor
//        progressLayer.strokeColor = color
//        progressLayer.lineWidth = CGFloat(strokeWidth)
//        progressLayer.lineCap = CAShapeLayerLineCap.round
//        progressLayer.strokeEnd = 0.0
//        
//        layer.addSublayer(progressLayer)
//        show()
//    }
//    
//    private func show(animated: Bool = false) {
//        // We want to animate the strokeEnd property of the rogressLayer
//        let animation = CABasicAnimation(keyPath: "strokeEnd")
//        
//        // Animate from 0 (no circle) to 1 (full circle)
//        animation.fromValue = lastProgress
//        animation.toValue = progress
//        
//        if animated {
//            let progressDelta = abs(progress - lastProgress)
//            let effectiveDuration = animationDuration// * Double(progressDelta)
//            animation.duration =  effectiveDuration
//        } else {
//            animation.duration = 0
//        }
//        
//        // Do a linear animation (i.e. the speed of the animation stays the same)
//        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        
//        // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
//        // right value when the animation ends.
//        progressLayer.strokeEnd = CGFloat(progress)
//        
//        progressLayer.strokeColor = Double(self.progress) < 0.75 ? progressColor.cgColor : progressRedColorRes.cgColor
//        
//        // Do the actual animation
//        progressLayer.add(animation, forKey: "animateCircle")
//    }
//}
//
//
//
//
//
//
//
//
//
//
