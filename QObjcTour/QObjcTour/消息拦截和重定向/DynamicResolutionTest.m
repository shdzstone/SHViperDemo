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
@dynamic title, author; //不自动生成实现

#pragma clang diagnostic pop

- (id)init {
    if ((self = [super init])) {
        book = [[NSMutableDictionary alloc] init];
        [book setObject:@"Tom Sawyer" forKey:@"title"];
        [book setObject:@"Mark Twain" forKey:@"author"];
    }
    return self;
}

- (void)dealloc {
    book = nil;
}


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
    MPLog(@"selector:%@",NSStringFromSelector(name));

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
 *  消息转发通常用于MVC中，view和Model之间的数据交换。
 *  假定，当前对象对某消息的实现代码实际上存在于另一个类中，有两种方法：1、该对象继承自另一个类   2、通过消息转发
 *  消息转发可以有两种方式：
 *     1、当前对象提供该消息的虚实现，实际实现代码在另一个对象中，在虚实现中调用另一个对象的实际实现，例如：
 - (id)forwardedInstanceMethodWithArg:(NSString*)string {
 
    ForwardedTarget *target = [[ForwardedTarget alloc] init];
     if ([target respondsToSelector: @selector(forwardedInstanceMethodWithArg:)]) {
         [target performSelector:@selector(forwardedInstanceMethodWithArg withObject:string)];
     }
 }
 *     2、第一种方法比较复杂，若当前对象有很多条消息需要转发给另一个对象时，可以不提供这些消息的实际实现，通过forwardingTargetForSelector:简单的转发即可
 *  目前，只支持重定向实例方法，用于转发forwardedInstanceMethodWithArg:消息给ForwardedTarget实例。
 */
- (id)forwardingTargetForSelector:(SEL)aSelector {
    MPLog(@"selector:%@",NSStringFromSelector(aSelector));

    ForwardedTarget *target = [[ForwardedTarget alloc] init];
    if ([target respondsToSelector: aSelector]) {
        return target;
    }
    
    return [super forwardingTargetForSelector: aSelector];
}

//动态添加getter、setter
- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
    
    NSString *sel = NSStringFromSelector(selector);
    if ([sel rangeOfString:@"set"].location == 0) {
        //动态造一个setter函数
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    } else {
        //动态造一个getter函数
        return [NSMethodSignature signatureWithObjCTypes:"@@:"];
    }
}


/*
 *  若当前对象对象有很多条消息均未提供实现，可以使用forwardInvocation:来分情况转发消息，invocation中封闭了消息的参数：第一个self，第二个_cmd，第三及随后是正常参数。
 *当给某对象发送一条该对象没有实现的消息时，可以在该对象实现forwardInvocation:时，提供对该消息的默认处理，以避免抛出error。
 *forwardInvocation:常用来把消息转发给另一个对象。
 */

- (void)forwardInvocation:(NSInvocation *)invocation {
    //拿到函数名
    NSString *key = NSStringFromSelector([invocation selector]);
    
    MPLog(@"selector:%@",key);
    if ([key rangeOfString:@"set"].location == 0) {
        //setter函数形如 setXXX: 拆掉 set和冒号
        key = [[key substringWithRange:NSMakeRange(3, [key length]-4)] lowercaseString];
        NSString *obj;
        //从参数列表中找到值
        [invocation getArgument:&obj atIndex:2];
        [book setObject:obj forKey:key];
    } else {
        //getter函数就相对简单了，直接把函数名做 key就好了。
        NSString *obj = [book objectForKey:key];
        [invocation setReturnValue:&obj];
    }
}



/*
 - (void)forwardInvocation:(NSInvocation *)anInvocation {
     if ([someOtherObject respondsToSelector:[anInvocation selector]])
         [anInvocation invokeWithTarget:someOtherObject];
     else
         [super forwardInvocation:anInvocation];
 }
 */

//此函数通常是不需要重载的，但是在动态实现了查找过程后，需要重载此函数让对外接口查找动态实现函数的时候返回YES，保证对外接口的行为统一。
/*
- (BOOL) respondsToSelector:(SEL)aSelector {
    if (@selector(setTitle:) == aSelector ||
        @selector(title) == aSelector ||
        @selector(setAuthor:) == aSelector ||
        @selector(author) == aSelector)
    {
        return YES;
    }
    
    return [super respondsToSelector: aSelector];
}
*/

//作为找不到函数实现的最后一步，NSObject实现这个函数只有一个功能，就是抛出异常。
//虽然理论上可以重载这个函数实现保证不抛出异常（不调用super实现），但是苹果文档着重提出“一定不能让这个函数就这么结束掉，必须抛出异常”
- (void)doesNotRecognizeSelector:(SEL)aSelector {
    MPLog(@"%@找不到IMP，挂掉了",NSStringFromSelector(aSelector));
}

@end
