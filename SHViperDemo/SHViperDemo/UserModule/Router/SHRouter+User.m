//
//  SHRouter+User.m
//  SHViperDemo
//
//  Created by cdz on 2018/6/7.
//Copyright © 2018年 cdz's mac. All rights reserved.
//

#import "SHRouter+User.h"

#import "UserBuilder.h"
#import "SHDataService+User.h"

@implementation SHRouter(UserLogin)
+ (UIViewController *)viewForUser {
    
    return [UserBuilder viewControllerWithRouter:[SHRouter sharedInsatnce] dataService:[SHDataService sharedInsatnce]];
}

@end

