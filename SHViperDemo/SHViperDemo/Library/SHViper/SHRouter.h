//
//  SHRouter.h
//  Bee
//
//  Created by cdz on 2018/5/11.
//  Copyright © 2018年 cdz's mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHViperRouter.h"

NS_ASSUME_NONNULL_BEGIN

@interface SHRouter : NSObject <SHViperRouter>
+ (void)pushViewController:(UIViewController *)destination fromViewController:(UIViewController *)source animated:(BOOL)animated;
+ (void)popViewController:(UIViewController *)viewController animated:(BOOL)animated;

+ (void)presentViewController:(UIViewController *)viewControllerToPresent fromViewController:(UIViewController *)source animated:(BOOL)animated completion:(void (^ __nullable)(void))completion;
+ (void)dismissViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^ __nullable)(void))completion;

#pragma mark - 全局单例
+ (instancetype)sharedInsatnce;

@end

NS_ASSUME_NONNULL_END
