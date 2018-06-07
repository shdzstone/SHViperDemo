//
//  ViperTestInteractorInput.h
//  SHViperDemo
//
//  Created by cdz on 2018/6/7.
//Copyright © 2018年 cdz's mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHViperDef.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ViperTestInteractorInput <NSObject>
- (void)loadDataWithCompletion:(successHandler)completion failure:(failureHandler)failure;

@end

NS_ASSUME_NONNULL_END
