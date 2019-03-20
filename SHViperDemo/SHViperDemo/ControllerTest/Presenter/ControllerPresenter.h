//
//  ControllerPresenter.h
//  SHViperDemo
//
//  Created by stone on 2019/3/20.
//  Copyright © 2019 cdz's mac. All rights reserved.

#import <Foundation/Foundation.h>
#import "ControllerEventHandler.h"
#import "ControllerDataSource.h"

// 处理和View事件
@protocol ControllerProtocol;
@interface ControllerPresenter : NSObject <ControllerEventHandler, ControllerDataSource>

#pragma mark - viper
- (void)bindView:(id<ControllerProtocol>)view;
- (void)bindInteractor:(id)interactor;

@end
