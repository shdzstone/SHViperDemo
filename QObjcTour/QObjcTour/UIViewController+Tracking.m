//
//  UIViewController+Tracking.m
//  QObjcTour
//
//  Created by cdzdev on 2017/7/1.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

/*
//: 运行时@selector、Method、IMP之间的关系：
//: 每一个类都维护一个运行时可接收的消息分发表：消息分发表
//: 分发表中的每个入口是一个方法(Method)，其中key是一个特定名称，即选择器(SEL)，其对应一个实现(IMP)，即指向底层C函数的指针
 */

#import "UIViewController+Tracking.h"
#import <objc/runtime.h>

@implementation UIViewController(Tracking)

+ (void)load {
    
    [super load];
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        
        
        Class class = [self class];
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        // 获取SEL
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(swizzledViewWillAppear:);
        
        // 通过class_getInstanceMethod()函数从当前对象中的method list获取method结构体，如果是类方法就使用class_getClassMethod()函数获取。
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        /*
         *  注意：class_addMethod，若子类没有某个方法的实现代码，则可以添加成功，返回YES；
         *  但若子类已经存在实现代码，添加失败，返回NO；
         *  若要覆盖某个已存在的实现，需要调用：method_setImplementation方法。
         *  注意第四个参数的格式，本例中types参数为"i@:@“，type表明了该函数从左到右返回值及参数的类型，@表示object对象。:表示selector对象,
         *   按顺序分别表示：
         *    v      ： v表示返回值为void
         *    @      ：参数id(self)
         *    :      ：SEL(_cmd)对象
         *    @      ：id(str)
         */
        BOOL didAddMethod = class_addMethod(class,
                                            originalSelector,
                                            method_getImplementation(swizzledMethod),
                                            method_getTypeEncoding(swizzledMethod));
        
        
        /*
         *判断，若添加成功。
         *
         */
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - Method Swizzling

- (void)swizzledViewWillAppear:(BOOL)animated {
    NSString *str = [NSString stringWithFormat:@"%@", self.class];

    // 判断，将系统的UIViewController的对象剔除掉
    if(![str containsString:@"UI"]){
        MPLog(@"统计打点 : %@", self.class);
    }
    [self swizzledViewWillAppear:animated];
}


@end


