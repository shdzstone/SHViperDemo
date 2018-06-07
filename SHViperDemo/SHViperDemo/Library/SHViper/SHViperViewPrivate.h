//
//  SHViperViewPrivate.h
//  SHViper
//
//  Created by zuik on 2017/7/3.
//  Copyright © 2017 zuik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHViperView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SHViperViewEventHandler;

///Private getter/setter to configure SHViperView. Should only be used inside view or assembly.
@protocol SHViperViewPrivate <SHViperView>

- (id<SHViperViewEventHandler>)eventHandler;
- (void)setEventHandler:(id<SHViperViewEventHandler>)eventHandler;

@optional
- (id)viewDataSource;
- (void)setViewDataSource:(id)viewDataSource;
- (void)setRouteSource:(UIViewController *)routeSource;

@end

NS_ASSUME_NONNULL_END
