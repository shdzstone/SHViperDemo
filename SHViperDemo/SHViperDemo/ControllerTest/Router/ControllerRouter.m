//
//  ControllerRouter.m
//  SHViperDemo
//
//  Created by stone on 2019/3/20.
//  Copyright © 2019 cdz's mac. All rights reserved.

#import "ControllerRouter.h"
#import "ControllerPresenter.h"
#import "ControllerView.h"
#import "ControllerInteractor.h"

@implementation ControllerRouter
//viper组件初始化
+ (UIViewController *)viewWithParm:(NSDictionary *)parm {
    ControllerView *view = [[ControllerView alloc] initWithParm:parm];
    ControllerPresenter *presenter = [ControllerPresenter new];
    ControllerInteractor *interactor = [ControllerInteractor new];

    [view bindPresenter:presenter];
    [presenter bindView:view];
    [presenter bindInteractor:interactor];
    return view;
}

+ (void)bindViewPresenter:(UIViewController *)view {
    if ([view isKindOfClass:[ControllerView class]]) {
        ControllerView *viewController = (ControllerView *)view;
        ControllerPresenter *presenter = [ControllerPresenter new];
        ControllerInteractor *interactor = [ControllerInteractor new];

        [viewController bindPresenter:presenter];
        [presenter bindView:viewController];
        [presenter bindInteractor:interactor];
    }
}

@end
