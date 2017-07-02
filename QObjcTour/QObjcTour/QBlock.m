//
//  QBlock.m
//  QObjcTour
//
//  Created by cdzdev on 2017/6/30.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import "QBlock.h"
#import <UIKit/NSTextStorage.h>

@implementation QBlock
@synthesize blockName=_blockName;

- (instancetype)init {
    self = [super init];
    if(self) {
        
    }
    return self;
}


+ (void)blockDefineAndUser {
    
    int (^oneFrom)(int);
    
    oneFrom = ^(int anInt) {
        return anInt - 1;
    };
    
    printf("%d\n", oneFrom(10));
}

+ (void)inlineBlock {
    
    __block BOOL found = NO;
    NSSet *aSet = [NSSet setWithObjects: @"Alpha", @"Beta", @"Gamma", @"X", nil];
    NSString *string = @"gamma";
    
    [aSet enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        if ([obj localizedCaseInsensitiveCompare:string] == NSOrderedSame) {
            *stop = YES;
            found = YES;
        }
    }];
    
    // At this point, found == YES
    
    NSString *string1 = @"UTF32.txt";
    NSString *string2 = [NSHomeDirectory() stringByAppendingPathComponent:string1];
    MPLog(@"%@", string2);
}


@synthesize number;
@synthesize myString;
@synthesize myView;

/*
//释放内存
-(void) dealloc {
    [myString release];  //copy的属性需要release;
    [myView release];    //retain的属性需要release;
    [super dealloc]; //传回父对象
}

 
 
 MyClass * instance  = [BruceClass alloc] init];``
 //number赋值，没什么可说的， 简单数据类型就这样
 instance.number = 1;
 //创建一个可变字符串
 NSMutableString * string = [NSMutableString stringWithString:@"hello"];
 //对myString赋值
 instance.myString = string;
 //往string追加文本
 [string appendString:@" world!"];
 //此处string已经改变， 输出为 “hello world!”
 MPLog(@”%@”,string);
 //输出myString，你会发现此处输出仍然为 “hello” 因为 myString在string改变之前已经copy了一份副本
 MPLog(@”%@”,instance.myString);
 
 UIView * view = [[UIView alloc] init];
 MPLog(@”retainCount = %d”,view.retainCount);
 //输出view的引用计数， 此时为1
 instance.myView = view; //对myView属性赋值
 MPLog(@”retainCount = %d”,view.retainCount);
 //再次输出view的引用计数， 此时为2，因为myView对view进行了一次retain。
 [view release];
 //此处虽然view被release释放掉了，但myView对view进行了一次retain，那么myView保留的UIView的对象指针仍然有效。
 [instance release] ;
 
 */

@end
