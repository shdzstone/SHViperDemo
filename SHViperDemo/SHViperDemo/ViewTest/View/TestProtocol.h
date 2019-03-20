//
//  TestProtocol.h
//  SHViperDemo
//
//  Created by stone on 2019/3/20.
//  Copyright © 2019 cdz's mac. All rights reserved.

#import <Foundation/Foundation.h>

//v提供的对外接口
@protocol TestProtocol <NSObject>
#pragma mark - viper
@property(nonatomic,weak)UIViewController *routeSource;

#pragma mark - public instance variable/method

#pragma mark - injectionn methods

@end
