//
//  DynamicResolutionTest.m
//  QObjcTour
//
//  Created by cdzdev on 2017/7/2.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import "DynamicResolutionTest.h"
#include <objc/runtime.h>
#import "ForwardedTarget.h"

/*
 _cmd在Objective-C的方法中表示当前方法的selector，正如同self表示当前方法调用的对象实例。
 */
void addInstanceIMP(id self, SEL _cmd, NSString* string){
    MPLog(@"add instance IMP to %@", NSStringFromSelector(_cmd));
}

void addClassIMP(id self, SEL _cmd, NSString* string){
    MPLog(@"add class IMP to %@", NSStringFromSelector(_cmd));
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored  "-Wincomplete-implementation"

@implementation DynamicResolutionTest

#pragma clang diagnostic pop

- (void)message {
    MPLog(@"%@",NSStringFromSelector(@selector(message)));
}

//方法拦截
/*
 *
 *resolveInstanceMethod:中，只有拦截到，并添加函数实现成功，返回YES，程序把SEL添加的IMP执行；
 *若拦截到，却IMP未添加成功，则不处理，调用[super resolveInstanceMethod:name]，沿着继承链，让父类继续拦截；
 *
 */
+ (BOOL)resolveInstanceMethod:(SEL)name  {
    if (name == @selector(noIMPInstanceMethodWithArg:)) {
        class_addMethod([self class],name,(IMP)addInstanceIMP,"v@:@");
        return YES;
    }
    return [super resolveInstanceMethod:name];
}

+(BOOL)resolveClassMethod:(SEL)sel {
    
    Class metaClass = objc_getMetaClass(class_getName(self));

    if (sel == @selector(noIMPClassMethodWithArg:)) {
        class_addMethod(metaClass, sel, (IMP)addClassIMP , "v@:@");
        return YES;
    }
    return [super resolveClassMethod:sel];
}


/*
#pragma clang diagnostic push

//1、使用未声明方法
#pragma clang diagnostic ignored "-Wundeclared-selector"
//2、忽略在arc 环境下performSelector产生的 leaks 的警告
//#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//3、声明的变量未使用
#pragma clang diagnostic ignored   "-Wunused-variable"
// 4、废弃掉的方法
#pragma clang diagnostic ignored  "-Wdeprecated-declarations"
//5、 方法定义未实现
#pragma clang diagnostic ignored  "-Wincomplete-implementation"
//6、参数格式不匹配
#pragma clang diagnostic ignored  "-Wformat"
//7、不会执行的代码
#pragma clang diagnostic ignored  "-Wunreachable-code"
//8、不兼容的指针类型
#pragma clang diagnostic ignored  "-Wincompatible-pointer-types"
//9、循环引用
#pragma clang diagnostic ignored  "-Warc-retain-cycles"
//10、内存泄露
#pragma clang diagnostic ignored   "-Warc-performSelector-leaks"

#pragma clang diagnostic pop
*/

//将消息转出某对象
- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    ForwardedTarget *target = [[ForwardedTarget alloc] init];
    if ([target respondsToSelector: aSelector]) {
        return target;
    }
    
    return [super forwardingTargetForSelector: aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation  {
    
}


@end
