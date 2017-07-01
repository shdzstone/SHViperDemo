//
//  NSObject+Swizzing.h
//  QObjcTour
//
//  Created by cdzdev on 2017/7/1.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (Swizzing)
+ (BOOL)jr_swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_;
+ (BOOL)jr_swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError**)error_;
@end

// MethodSwizzle类
BOOL ClassMethodSwizzle(Class klass, SEL origSel, SEL altSel);
BOOL MethodSwizzle(Class klass, SEL origSel, SEL altSel);
