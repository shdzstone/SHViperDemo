//
//  ViperTestViewPresenter.h
//  SHViperDemo
//
//  Created by cdz on 2018/6/7.
//Copyright © 2018年 cdz's mac. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SHViperPresenter.h"
#import "ViperTestViewEventHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViperTestViewPresenter : NSObject <SHViperPresenter,ViperTestViewEventHandler>

@end

NS_ASSUME_NONNULL_END
