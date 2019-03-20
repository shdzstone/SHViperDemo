//
//  ControllerRouter.h
//  SHViperDemo
//
//  Created by stone on 2019/3/20.
//  Copyright © 2019 cdz's mac. All rights reserved.

#import <Foundation/Foundation.h>

// 处理View跳转和viper组件初始化
@interface ControllerRouter : NSObject
+ (UIViewController *)viewWithParm:(NSDictionary *)parm;
+ (void)bindViewPresenter:(UIViewController *)view;
@end
