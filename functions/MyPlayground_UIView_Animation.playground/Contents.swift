//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
containerView.backgroundColor = UIColor.yellowColor()
let xcp = XCPlaygroundPage.currentPage
xcp.liveView = containerView

//XCPShowView("containerView", view: containerView)

let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
view.center = CGPoint(x: containerView.center.x-10, y: containerView.center.y)
view.backgroundColor = UIColor.redColor()
containerView.addSubview(view)

UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.01, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
    view.center.x += 10
    }) { (YES) -> Void in

}