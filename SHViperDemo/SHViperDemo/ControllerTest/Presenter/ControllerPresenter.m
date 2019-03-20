//
//  ControllerPresenter.m
//  SHViperDemo
//
//  Created by stone on 2019/3/20.
//  Copyright © 2019 cdz's mac. All rights reserved.

#import "ControllerPresenter.h"
#import "ControllerInteractor.h"
#import "ControllerProtocol.h"
//
@interface ControllerPresenter ()
@property (nonatomic, weak  ) id<ControllerProtocol> view;
@property (nonatomic, strong) ControllerInteractor * interactor;
//
@end

@implementation ControllerPresenter

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark - viper
- (void)bindView:(id<ControllerProtocol>)view {
    self.view = view;
}

- (void)bindInteractor:(id)interactor {
    self.interactor = interactor;
}

#pragma mark - ViewEventHandler
- (void)handleViewReady {
    
}

- (void)handleViewWillAppear:(BOOL)animated {

}

- (void)handleViewWillDisappear:(BOOL)animated {
    
}

#pragma mark - ViewDataSource

#pragma mark - private

@end
