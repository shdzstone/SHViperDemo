//
//  TestPresenter.m
//  SHViperDemo
//
//  Created by stone on 2019/3/20.
//  Copyright © 2019 cdz's mac. All rights reserved.

#import "TestPresenter.h"
#import "TestInteractor.h"
#import "TestProtocol.h"
//
@interface TestPresenter ()
@property (nonatomic, weak  ) id<TestProtocol> view;
@property (nonatomic, strong) TestInteractor * interactor;
//
@end

@implementation TestPresenter

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark - viper
- (void)bindView:(id<TestProtocol>)view {
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
