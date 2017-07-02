//
//  main.m
//  QObjcTour
//
//  Created by cdzdev on 2017/6/29.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MemoryManagementTest.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        MemoryManagementTest *test = [[MemoryManagementTest alloc] init];
        [test memoryManagementTest];

        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
