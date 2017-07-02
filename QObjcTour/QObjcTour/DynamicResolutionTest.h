//
//  DynamicResolutionTest.h
//  QObjcTour
//
//  Created by cdzdev on 2017/7/2.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DynamicResolutionTest : NSObject

- (void)message;
- (void)noIMPInstanceMethodWithArg:(NSString*)string;
+ (void)noIMPClassMethodWithArg:(NSString*)string;

- (void)forwardedInstanceMethodWithArg:(NSString*)string;
@end
