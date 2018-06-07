//
//  SHRouter.m
//  Bee
//
//  Created by cdz on 2018/5/11.
//  Copyright © 2018年 cdz's mac. All rights reserved.
//

#import "SHRouter.h"

@implementation SHRouter

+ (void)pushViewController:(UIViewController *)destination fromViewController:(UIViewController *)source animated:(BOOL)animated {
    NSParameterAssert([destination isKindOfClass:[UIViewController class]]);
    NSParameterAssert(source.navigationController);
    [source.navigationController pushViewController:destination animated:animated];
}

+ (void)popViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSParameterAssert(viewController.navigationController);
    [viewController.navigationController popViewControllerAnimated:animated];
}

+ (void)presentViewController:(UIViewController *)viewControllerToPresent fromViewController:(UIViewController *)source animated:(BOOL)animated completion:(void (^ __nullable)(void))completion {
    NSParameterAssert(viewControllerToPresent);
    NSParameterAssert(source);
    [source presentViewController:viewControllerToPresent animated:animated completion:completion];
}

+ (void)dismissViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^ __nullable)(void))completion {
    NSParameterAssert(viewController);
    [viewController dismissViewControllerAnimated:animated completion:completion];
}
#pragma mark - 全局单例
+ (instancetype)sharedInsatnce {
    static SHRouter *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[SHRouter alloc] init];
    });
    return shared;
}
@end
