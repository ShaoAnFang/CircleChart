//
//  NLCircleBarChart.swift
//  HiTA_Test_Circle_Chart
//
//  Created by Noel on 2018/9/27.
//  Copyright © 2018年 tw.com.valkyrie. All rights reserved.
//

import UIKit

extension CGPoint {
    mutating func shiftBy(x: CGFloat, y: CGFloat) {
        self = CGPoint(x: self.x + x, y: self.y + y)
    }
}


struct Circle {
    var radius: CGFloat = 0
    var center: CGPoint = CGPoint.zero
    func pointAtAngle(angle: CGFloat) -> CGPoint {
        let x = radius * cos(angle) + center.x
        let y = radius * sin(angle) + center.y
        return CGPoint(x: x, y: y)
    }
}

struct ChartData {
    var name: String = ""
    var value: CGFloat = 0.0
}

@objc enum tagDisplayFormat: Int {
    case nameAndPercentage;
    case name;
    case percentage;
    case none
}

class NLCircleBarChartView: UIView {
    private var barThicknessPercentage: CGFloat = 0.35
    private var circleMarginPercentage: CGFloat = 0.1
    private var dataList: [ChartData] = [] {
        didSet {
            totalValue = 0
            for item in dataList {
                totalValue += item.value
            }
        }
    }
    private var title: String = ""
    private var totalValue: CGFloat = 0.0
//    private var colors:[UIColor] = [UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1),
//                            UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1),
//                            UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1),
//                            UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)]
    private var colors: [UIColor] = []
//    private func getColor() -> UIColor {
//        guard let color = colors.first else {
//            return UIColor.black
//        }
//        colors.remove(at: 0)
//        colors.append(color)
//        return color
//    }
    private var textColor: UIColor = UIColor(white: 0.5, alpha: 1)
    private var contentText: NSAttributedString?
    private var tagHeight: CGFloat = 16
    private var tagFont: UIFont! = UIFont(name: "Helvetica", size: 12)
    private var tagView: UIView?
    private var tagMargin: CGFloat = 8
    private var dotToLabelMargin: CGFloat = 4
    private var dotRadius: CGFloat = 3
    public var chartIndicatorFormat: tagDisplayFormat = .percentage {
        didSet {
            self.setNeedsDisplay()
        }
    }
    public var bottomIndicatorFormat: tagDisplayFormat = .name {
        didSet {
            self.setNeedsDisplay()
        }
    }
    public var availableContentWidth: CGFloat {
        let tagViewHeight = tagView?.frame.height ?? 0
        let edge = min(self.frame.width, self.frame.height - tagViewHeight - 24)
        return edge * (1 - barThicknessPercentage)
    }
    
    public func customColorSet(colors: [UIColor]) {
        self.colors = colors
        if colors.count < dataList.count {
            for _ in colors.count..<dataList.count {
                let color = UIColor(red: CGFloat(arc4random() % 256)/255.0,
                                    green: CGFloat(arc4random() % 256)/255.0,
                                    blue: CGFloat(arc4random() % 256)/255.0,
                                    alpha: 1)
                self.colors.append(color)
            }
        }
    }
    
    public func drawChart(withDataSet data: [ChartData], colorSet: [UIColor]?, title: String?, content: NSAttributedString?, textColor: UIColor?) {
        if let t = title {
            self.title = t
        }
        if let colors = colorSet {
            self.colors = colors
        }
        if let textColor = textColor {
            self.textColor = textColor
        }
        if let content = content {
            self.contentText = content
        }
        dataList = data
        if colors.count < dataList.count {
            for _ in colors.count..<dataList.count {
                let color = UIColor(red: CGFloat(arc4random() % 256)/255.0,
                                    green: CGFloat(arc4random() % 256)/255.0,
                                    blue: CGFloat(arc4random() % 256)/255.0,
                                    alpha: 1)
                colors.append(color)
            }
        }
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        guard dataList.count != 0 else { return }
        self.makeTagViewInBoundary()
        let tagViewHeight = tagView?.frame.height ?? 0
        let edge = min(self.frame.width, self.frame.height - tagViewHeight - 24)
        let center = CGPoint(x: self.frame.width * 0.5, y: (self.frame.height - tagViewHeight) * 0.5)
        let outsideRadius = edge * (1 - circleMarginPercentage) * 0.5
        let insideRadius = outsideRadius * (1 - barThicknessPercentage)
        let outterCircle = Circle(radius: outsideRadius, center: center)
        let innerCircle = Circle(radius: insideRadius, center: center)
        let labelCircle = Circle(radius: edge * 0.5, center: center)
        var currentAngle = -CGFloat.pi / 2.0
        var leftBoundary: CGFloat = 0
        var rightBoundary: CGFloat = self.frame.width
        for i in 0..<dataList.count {
            let item = dataList[i]
            let outPoint1 = outterCircle.pointAtAngle(angle: currentAngle)
            let inPoint1 = innerCircle.pointAtAngle(angle: currentAngle)
            let valueAngle = item.value / totalValue * 2 * CGFloat.pi + currentAngle
            let outPoint2 = outterCircle.pointAtAngle(angle: valueAngle)
            let bezier = UIBezierPath()
            bezier.move(to: outPoint1)
            bezier.addLine(to: inPoint1)
            bezier.addArc(withCenter: innerCircle.center, radius: innerCircle.radius, startAngle: currentAngle, endAngle: valueAngle, clockwise: true)
            bezier.addLine(to: outPoint2)
            bezier.addArc(withCenter: outterCircle.center, radius: outterCircle.radius, startAngle: valueAngle, endAngle: currentAngle, clockwise: false)
            let shape = CAShapeLayer()
            shape.path = bezier.cgPath
//            shape.fillColor = self.getColor().cgColor
            shape.fillColor = colors[i].cgColor
            self.layer.addSublayer(shape)
            
            let nameLabel = UILabel()
            nameLabel.textColor = textColor
            var indicatedString = ""
            switch chartIndicatorFormat {
            case .none:
                break
            case .name:
                indicatedString = "\(item.name)"
            case .percentage:
                indicatedString = "\((item.value / totalValue * 1000).rounded() / 10)%"
            case .nameAndPercentage:
                indicatedString = "\(item.name) - \((item.value / totalValue * 1000).rounded() / 10)%"
            }

            nameLabel.text = indicatedString
            nameLabel.font = UIFont(name: "Arial", size: 12)
            let size = nameLabel.sizeThatFits(CGSize(width: CGFloat.infinity, height: CGFloat.infinity))
            let angleCenter = item.value / totalValue * 2 * CGFloat.pi * 0.5 + currentAngle
            let nameLocation = labelCircle.pointAtAngle(angle: angleCenter)
            if angleCenter > -CGFloat.pi / 2.0 && angleCenter < CGFloat.pi / 2.0 {
                nameLabel.frame = CGRect(x: nameLocation.x, y: nameLocation.y - size.height * 0.5, width: size.width, height: size.height)
                if nameLocation.x + size.width > rightBoundary { rightBoundary = nameLocation.x + size.width }
            } else {
                nameLabel.frame = CGRect(x: nameLocation.x - size.width, y: nameLocation.y - size.height * 0.5, width: size.width, height: size.height)
                if nameLocation.x - size.width < leftBoundary { leftBoundary = nameLocation.x - size.width }
            }
            self.addSubview(nameLabel)
            currentAngle = valueAngle
        }
        let valueLabel = UILabel()
        valueLabel.textColor = textColor
        if let content = self.contentText {
            valueLabel.attributedText = content
        } else {
            valueLabel.text = "\(Int(totalValue))"
            valueLabel.font = UIFont(name: "Menlo", size: 65)
        }
        valueLabel.frame = CGRect(x: 0, y: 0, width: edge * (1 - circleMarginPercentage) * (1 - barThicknessPercentage) * 0.9, height: edge * 0.3)
        valueLabel.center = CGPoint(x: center.x, y: center.y)
//        valueLabel.adjustsFontSizeToFitWidth = true
        valueLabel.textAlignment = .center
        self.addSubview(valueLabel)
        
        let titleLabel = UILabel()
        titleLabel.textColor = textColor
        titleLabel.text = title
        titleLabel.frame = CGRect(x: 0, y: 0, width: edge * (1 - circleMarginPercentage) * (1 - barThicknessPercentage) * 0.7 , height: edge * (1 - circleMarginPercentage) * (1 - barThicknessPercentage) * 0.7)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.3
        titleLabel.center = CGPoint(x: center.x, y: valueLabel.frame.origin.y * 0.95)
        titleLabel.textAlignment = .center
        self.addSubview(titleLabel)
        
        self.makeTagViewInBoundary(left: leftBoundary, right: rightBoundary)
    }
    
    private func makeTagViewInBoundary(left: CGFloat? = nil, right: CGFloat? = nil) {
        tagView?.removeFromSuperview()
        tagView = UIView()
        guard bottomIndicatorFormat != .none else { return }
        var pos = CGPoint(x: 8, y: 8)
        var width = self.frame.width
        if let leftBoundary = left, let rightBoundary = right {
            width = rightBoundary - leftBoundary
        }
        for i in 0..<dataList.count {
            let data = dataList[i]
            let tagLabel = UILabel()
            tagLabel.textColor = textColor
            tagLabel.font = tagFont
            
            var indicatedString = ""
            switch bottomIndicatorFormat {
            case .none:
                break
            case .name:
                indicatedString = "\(data.name)"
            case .percentage:
                indicatedString = "\((data.value / totalValue * 1000).rounded() / 10)%"
            case .nameAndPercentage:
                indicatedString = "\(data.name) - \((data.value / totalValue * 1000).rounded() / 10)%"
            }
            
            tagLabel.text = indicatedString
            let size = tagLabel.sizeThatFits(CGSize(width: CGFloat.infinity, height: CGFloat.infinity))
            if pos.x != 8 && pos.x + dotRadius + dotToLabelMargin + size.width > width {
                pos = CGPoint(x: 8, y: pos.y + tagHeight)
            }
            tagLabel.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            tagLabel.center = CGPoint(x: pos.x + dotRadius + dotToLabelMargin + size.width / 2.0, y: pos.y)
            
            let dotPath = UIBezierPath(arcCenter: pos, radius: dotRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
            let dotShape = CAShapeLayer()
            dotShape.path = dotPath.cgPath
            dotShape.fillColor = colors[i].cgColor

            tagView?.layer.addSublayer(dotShape)
            tagView?.addSubview(tagLabel)
            
            pos = CGPoint(x: pos.x + dotRadius + dotToLabelMargin + tagLabel.frame.width + tagMargin + dotRadius, y: pos.y)
        }
        
        tagView?.frame = CGRect(x: left ?? 0, y: self.frame.height - (pos.y + 8), width: width, height: pos.y + 8)
        self.addSubview(tagView ?? UIView())
    }
    
}
