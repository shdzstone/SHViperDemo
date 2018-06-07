//
//  UIViewController+SHViperRouter.m
//  SHViper
//
//  Created by zuik on 2017/8/3.
//  Copyright © 2017 zuik. All rights reserved.
//

#import "UIViewController+SHViperRouter.h"

@implementation UIViewController (SHViperRouter)

- (BOOL)ZIK_isAppRootViewController {
    NSAssert([UIApplication sharedApplication].delegate.window.rootViewController, @"Can't find rootViewController");
    return [UIApplication sharedApplication].delegate.window.rootViewController == self;
}

- (BOOL)SH_isRemoving {
    UIViewController *destination = (UIViewController *)self;
    UIViewController *node = destination;
    while (node) {
        if (node.isMovingFromParentViewController ||
            (!node.parentViewController && !node.presentingViewController && ![node ZIK_isAppRootViewController])) {
            return YES;
        } else if (node.isBeingDismissed) {
            return YES;
        } else {
            node = node.parentViewController;
            continue;
        }
        break;
    }
    return NO;
}

@end
