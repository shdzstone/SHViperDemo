//
//  SHViperPresenterPrivate.h
//  SHViper
//
//  Created by zuik on 2017/7/3.
//  Copyright © 2017 zuik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHViperPresenter.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SHViperWireframe,SHViperView,SHViperInteractor;

///Private getter/setter to configure SHViperPresenter. Should only be used inside presenter or assembly.
@protocol SHViperPresenterPrivate <SHViperPresenter>

- (id<SHViperWireframe>)wireframe;
- (void)setWireframe:(id<SHViperWireframe>)wireframe;

- (void)setView:(id<SHViperView>)view;

- (id<SHViperInteractor>)interactor;
- (void)setInteractor:(id<SHViperInteractor>)interactor;

@end

NS_ASSUME_NONNULL_END
