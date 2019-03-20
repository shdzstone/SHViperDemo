//
//  TestView.m
//  SHViperDemo
//
//  Created by stone on 2019/3/20.
//  Copyright © 2019 cdz's mac. All rights reserved.

#import "TestView.h"
#import "TestPresenter.h"
#import "TestRouter.h"

@interface TestView ()
@property (nonatomic, strong) TestPresenter *presenter;
@property (nonatomic, assign) BOOL ready;
//
@end

@implementation TestView
@synthesize routeSource=_routeSource;

#pragma mark - life cycle
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

#pragma mark - viper
- (void)bindPresenter:(id)presenter {
    self.presenter = presenter;
}

- (void)sendViewReadyEventIfNeed {
    if (self.ready == NO &&
        self.presenter != nil) {
        self.ready = YES;
        NSAssert([self.presenter conformsToProtocol:@protocol(TestEventHandler)], nil);
        if ([self.presenter respondsToSelector:@selector(handleViewReady)]) {
            [self.presenter handleViewReady];
        }
    }
    [self addSubviews];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    if (newSuperview) {
        [self sendViewReadyEventIfNeed];
    }
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    if (self.superview == nil) {
        if ([self.presenter respondsToSelector:@selector(handleViewRemoved)]) {
            [self.presenter handleViewRemoved];
        }
        self.ready = NO;
    }
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    if (newWindow != nil) {
        [self sendViewReadyEventIfNeed];
        if ([self.presenter respondsToSelector:@selector(handleViewWillAppear:)]) {
            [self.presenter handleViewWillAppear:NO];
        };
        return;
    }
    if ([self.presenter respondsToSelector:@selector(handleViewWillDisappear:)]) {
        [self.presenter handleViewWillDisappear:NO];
    }
}

- (void)didMoveToWindow {
    [super didMoveToWindow];
    if (self.window != nil) {
        [self sendViewReadyEventIfNeed];
        if ([self.presenter respondsToSelector:@selector(handleViewDidAppear:)]) {
            [self.presenter handleViewDidAppear:NO];
        }
        return;
    }
    if ([self.presenter respondsToSelector:@selector(handleViewDidDisappear:)]) {
        [self.presenter handleViewDidDisappear:NO];
    }
}

#pragma mark - layout
- (void)addSubviews {
    self.backgroundColor = [UIColor orangeColor];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

#pragma mark - getters/setters

@end
