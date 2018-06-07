//
//  UserInteractor.h
//  SHViperDemo
//
//  Created by cdz on 2018/6/7.
//Copyright © 2018年 cdz's mac. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SHViperInteractor.h"
#import "UserInteractorInput.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserInteractor : NSObject <SHViperInteractor, UserInteractorInput>

@end

NS_ASSUME_NONNULL_END
