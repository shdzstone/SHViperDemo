//
//  ControllerProtocol.h
//  SHViperDemo
//
//  Created by stone on 2019/3/20.
//  Copyright © 2019 cdz's mac. All rights reserved.

#import <Foundation/Foundation.h>

@class TestView;
//v提供的对外接口
@protocol ControllerProtocol <NSObject>
#pragma mark - viper
- (UIViewController *)viewController;

#pragma mark - public instance variable/method
@property(nonatomic,strong)TestView *testView;
#pragma mark - injectionn methods

@end
