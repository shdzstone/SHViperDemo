//
//  MemoryManagementTest.m
//  QObjcTour
//
//  Created by cdzdev on 2017/7/1.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import "MemoryManagementTest.h"

@implementation MemoryManagementTest


- (void)memoryManagementTest {
    NSMutableArray* ary = [NSMutableArray array];
    NSString *str = [NSString stringWithFormat:@"test"];
    [str retain];
    [ary addObject:str];
    MPLog(@"%@%lu",str,(unsigned long)[str retainCount]);
    [str retain];
    [str release];
    [str release];
    MPLog(@"%@%lu",str,(unsigned long)[str retainCount]);
    [ary removeAllObjects];
    MPLog(@"%@%lu",str,(unsigned long)[str retainCount]);
    
}

@end
