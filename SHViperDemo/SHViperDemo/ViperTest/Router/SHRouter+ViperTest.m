//
//  SHRouter+ViperTest.m
//  SHViperDemo
//
//  Created by cdz on 2018/6/7.
//Copyright © 2018年 cdz's mac. All rights reserved.
//

#import "SHRouter+ViperTest.h"

#import "ViperTestBuilder.h"
#import "SHDataService+ViperTest.h"

@implementation SHRouter(UserLogin)
+ (UIViewController *)viewForViperTest {
    
    return [ViperTestBuilder viewControllerWithRouter:[SHRouter sharedInsatnce] dataService:[SHDataService sharedInsatnce]];
}

@end

