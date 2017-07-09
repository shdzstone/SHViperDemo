//
//  DynamicResolutionTest.h
//  QObjcTour
//
//  Created by cdzdev on 2017/7/2.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DynamicResolutionTest : NSObject {
    //动态添加getter、setter
    NSMutableDictionary *book;
}

//声明了两个setter/getter
@property(nonatomic) NSString *title;
@property(nonatomic) NSString *author;

- (void)message;
- (void)noIMPInstanceMethodWithArg:(NSString*)string;
+ (void)noIMPClassMethodWithArg:(NSString*)string;

- (void)forwardedInstanceMethodWithArg:(NSString*)string;
@end
