//
//  UserBuilder.h
//  SHViperDemo
//
//  Created by cdz on 2018/6/7.
//Copyright © 2018年 cdz's mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SHViperViewPrivate,SHViperRouter,UserDataService;
@interface UserBuilder : NSObject

///Change this method, add your arguments for initializing the module
+ (UIViewController *)viewControllerWithRouter:(id<SHViperRouter>)router dataService:(id<UserDataService>)dataService;
+ (void)buildView:(id<SHViperViewPrivate>)view router:(id<SHViperRouter>)router  dataService:(id<UserDataService>)dataService;

@end

NS_ASSUME_NONNULL_END
