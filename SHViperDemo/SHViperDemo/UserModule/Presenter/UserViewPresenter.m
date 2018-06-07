//
//  UserViewPresenter.m
//  SHViperDemo
//
//  Created by cdz on 2018/6/7.
//Copyright © 2018年 cdz's mac. All rights reserved.
//

#import "UserViewPresenter.h"
#import "SHViperView.h"
#import "SHViperWireframe.h"
#import "SHViperInteractor.h"
#import "SHViperPresenterPrivate.h"

#import "UserViewInput.h"
#import "UserWireframeInput.h"
#import "UserInteractorInput.h"

@interface UserViewPresenter () <SHViperPresenterPrivate>
@property (nonatomic, strong) id<SHViperWireframe,UserWireframeInput> wireframe;
@property (nonatomic, weak) id<SHViperView,UserViewInput> view;
@property (nonatomic, strong) id<SHViperInteractor,UserInteractorInput> interactor;
@end

@implementation UserViewPresenter

#pragma mark SHViperViewEventHandler

- (void)handleViewReady {
    NSAssert(self.wireframe.view == self.view, @"Wireframe should be initlized when view is ready.");
    NSAssert([self.view conformsToProtocol:@protocol(UserViewInput)], @"Presenter should be attach to a view.");
    NSAssert([self.interactor conformsToProtocol:@protocol(UserInteractorInput)], @"Interactor should be initlized when view is ready.");
    
}

- (void)handleViewWillAppear:(BOOL)animated {
    
}

- (void)handleViewDidAppear:(BOOL)animated {
    
}

- (void)handleViewWillDisappear:(BOOL)animated {
    
}

- (void)handleViewDidDisappear:(BOOL)animated {
    
}

- (void)handleViewRemoved {
    
}

#pragma mark UserViewDataSource

#pragma mark UserViewEventHandler

@end
