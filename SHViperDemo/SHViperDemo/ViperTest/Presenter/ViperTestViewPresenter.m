//
//  ViperTestViewPresenter.m
//  SHViperDemo
//
//  Created by cdz on 2018/6/7.
//Copyright © 2018年 cdz's mac. All rights reserved.
//

#import "ViperTestViewPresenter.h"
#import "SHViperView.h"
#import "SHViperWireframe.h"
#import "SHViperInteractor.h"
#import "SHViperPresenterPrivate.h"

#import "ViperTestViewInput.h"
#import "ViperTestWireframeInput.h"
#import "ViperTestInteractorInput.h"

@interface ViperTestViewPresenter () <SHViperPresenterPrivate>
@property (nonatomic, strong) id<SHViperWireframe,ViperTestWireframeInput> wireframe;
@property (nonatomic, weak) id<SHViperView,ViperTestViewInput> view;
@property (nonatomic, strong) id<SHViperInteractor,ViperTestInteractorInput> interactor;
@end

@implementation ViperTestViewPresenter

#pragma mark SHViperViewEventHandler

- (void)handleViewReady {
    NSAssert(self.wireframe.view == self.view, @"Wireframe should be initlized when view is ready.");
    NSAssert([self.view conformsToProtocol:@protocol(ViperTestViewInput)], @"Presenter should be attach to a view.");
    NSAssert([self.interactor conformsToProtocol:@protocol(ViperTestInteractorInput)], @"Interactor should be initlized when view is ready.");
    
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

#pragma mark ViperTestViewDataSource

#pragma mark ViperTestViewEventHandler

@end
