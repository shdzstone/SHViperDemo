//
//  ForwardedTarget.m
//  QObjcTour
//
//  Created by cdzdev on 2017/7/2.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import "ForwardedTarget.h"

@implementation ForwardedTarget

/*
 *  注意，看接口中没有可以支持重定向类方法。
 *  目前，只支持重定向实例方法。
 */
- (void)forwardedInstanceMethodWithArg:(NSString*)string {
    MPLog(@"重定向来的instance method实现 %@   %@", NSStringFromSelector(_cmd),string);

}


@end
