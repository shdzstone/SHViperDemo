//
//  ControllerView.h
//  SHViperDemo
//
//  Created by stone on 2019/3/20.
//  Copyright © 2019 cdz's mac. All rights reserved.

#import <UIKit/UIKit.h>
#import "ControllerEventHandler.h"
#import "ControllerDataSource.h"
#import "ControllerProtocol.h"

@interface ControllerView : UIViewController <ControllerProtocol>

#pragma mark - viper
- (void)bindPresenter:(id)presenter;
#pragma mark - initial
- (instancetype)initWithParm:(NSDictionary *)parm;
//
@end
