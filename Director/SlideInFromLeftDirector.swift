//
//  SlideDirector.swift
//  Director
//
//  Created by James Tang on 18/1/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import UIKit

class SlideInFromLeftDirector: Director {

    @IBInspectable var delay: CGFloat = 0
    @IBInspectable var duration: CGFloat = 0.7
    @IBInspectable var damping: CGFloat = 0.7
    @IBInspectable var velocity: CGFloat = 0.7
    @IBInspectable var curve: String = ""

    override func start() {

        for view in self.views {
            view.transform = CGAffineTransformMakeTranslation(-CGRectGetMaxX(view.frame), 0)
        }

        UIView.animateWithDuration( NSTimeInterval(duration),
            delay: NSTimeInterval(delay),
            usingSpringWithDamping: damping,
            initialSpringVelocity: velocity,
            options: getAnimationOptions(curve),
            animations: {

                    let translate = CGAffineTransformIdentity

                for view in self.views {
                    view.transform = translate
                }

            }, { finished in

                self.complete()
        })
    }

    func getAnimationOptions(curve: String) -> UIViewAnimationOptions {
        switch curve {
        case "easeIn":
            return UIViewAnimationOptions.CurveEaseIn
        case "easeOut":
            return UIViewAnimationOptions.CurveEaseOut
        case "easeInOut":
            return UIViewAnimationOptions.CurveEaseInOut
        case "linear":
            return UIViewAnimationOptions.CurveLinear
        case "spring":
            return UIViewAnimationOptions.CurveLinear
        default:
            return UIViewAnimationOptions.CurveLinear
        }
    }
}
