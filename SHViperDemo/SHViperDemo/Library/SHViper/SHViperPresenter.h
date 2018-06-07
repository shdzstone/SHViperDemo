//
//  SHViperPresenter.h
//  SHViper
//
//  Created by zuik on 2017/5/24.
//  Copyright © 2017 zuik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHViperViewEventHandler.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SHViperView;

@protocol SHViperPresenter <SHViperViewEventHandler>
///UIViewController or UIView, conform to view protocol
@property (nonatomic, readonly, weak) id<SHViperView> view;
@end

NS_ASSUME_NONNULL_END
