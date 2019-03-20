//
//  TestPresenter.h
//  SHViperDemo
//
//  Created by stone on 2019/3/20.
//  Copyright © 2019 cdz's mac. All rights reserved.

#import <Foundation/Foundation.h>
#import "TestEventHandler.h"
#import "TestDataSource.h"

// 处理和View事件
@protocol TestProtocol;
@interface TestPresenter : NSObject <TestEventHandler, TestDataSource>

#pragma mark - viper
- (void)bindView:(id<TestProtocol>)view;
- (void)bindInteractor:(id)interactor;

@end
