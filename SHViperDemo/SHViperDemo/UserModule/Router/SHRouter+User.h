//
//  SHRouter+User.h
//  SHViperDemo
//
//  Created by cdz on 2018/6/7.
//Copyright © 2018年 cdz's mac. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SHRouter.h"
#import "UserDataService.h"

NS_ASSUME_NONNULL_BEGIN

@interface SHRouter(User)<NSObject>
+ (UIViewController *)viewForUser;

@end


NS_ASSUME_NONNULL_END
