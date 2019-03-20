//
//  SHViperViewEventHandler.h
//  SHDemo
//
//  Created by cdz on 2018/6/12.
//  Copyright © 2018年 cdz's mac. All rights reserved.
//

#ifndef SHViperViewEventHandler_h
#define SHViperViewEventHandler_h
@protocol SHViperViewEventHandler <NSObject>

@optional
- (void)handleViewReady;
- (void)handleViewRemoved;
- (void)handleViewWillAppear:(BOOL)animated;
- (void)handleViewDidAppear:(BOOL)animated;
- (void)handleViewWillDisappear:(BOOL)animated;
- (void)handleViewDidDisappear:(BOOL)animated;

@end
#endif /* SHViperViewEventHandler_h */
