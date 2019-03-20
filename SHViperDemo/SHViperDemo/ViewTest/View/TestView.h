//
//  TestView.h
//  SHViperDemo
//
//  Created by stone on 2019/3/20.
//  Copyright © 2019 cdz's mac. All rights reserved.

#import <UIKit/UIKit.h>
#import "TestEventHandler.h"
#import "TestDataSource.h"
#import "TestProtocol.h"

@interface TestView : UIView <TestProtocol>

#pragma mark - viper
- (void)bindPresenter:(id)presenter;
//
@end
