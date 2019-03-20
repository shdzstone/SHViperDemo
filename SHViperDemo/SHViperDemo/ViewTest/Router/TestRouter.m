//
//  TestRouter.m
//  SHViperDemo
//
//  Created by stone on 2019/3/20.
//  Copyright © 2019 cdz's mac. All rights reserved.

#import "TestRouter.h"
#import "TestPresenter.h"
#import "TestView.h"
#import "TestInteractor.h"

@implementation TestRouter
//viper组件初始化
+ (UIView *)viewWithRouteSource:(UIViewController*)routeSource {
    TestView *view = [[TestView alloc] initWithFrame:CGRectZero];
    TestPresenter *presenter = [[TestPresenter alloc] init];
    TestInteractor *interactor = [[TestInteractor alloc] init];

    [view bindPresenter:presenter];
    [presenter bindView:view];
    [presenter bindInteractor:interactor];
    
    if ([view respondsToSelector:@selector(setRouteSource:)]) {
        view.routeSource = routeSource;
    }
    return view;
}

@end
