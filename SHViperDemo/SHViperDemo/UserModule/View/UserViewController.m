//
//  UserViewController.m
//  SHViperDemo
//
//  Created by cdz on 2018/6/7.
//Copyright © 2018年 cdz's mac. All rights reserved.
//

#import "UserViewController.h"
#import "SHViperViewPrivate.h"
#import "UIViewController+SHViperRouter.h"

#import "UserViewEventHandler.h"
#import "UserViewDataSource.h"
 
@interface UserViewController () <SHViperViewPrivate>
@property (nonatomic, strong) id<UserViewEventHandler> eventHandler;
@property (nonatomic, strong) id<UserViewDataSource> viewDataSource;
@property (nonatomic, assign) BOOL ready;
@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIViewController *)routeSource {
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.ready == NO) {
        //Note: in -viewWillAppear:, if this view controller contains sub routable UIView added from external (addSubview:, storyboard or xib), it may not be ready yet. The UIView has to search the UIViewController with -nextResponder to prepare itself, nextResponder can only be gained after -willMoveToWindow:. But -willMoveToWindow: may not be called yet in -viewWillAppear:. If the subview is not ready, config the subview in -handleViewReady may fail. If you can make sure there is no sub routable UIView or the subview is added with router before -viewWillAppear:, you can do -handleViewReady in -viewWillAppear:.
        NSAssert([self.eventHandler conformsToProtocol:@protocol(UserViewEventHandler)], nil);
        if ([self.eventHandler respondsToSelector:@selector(handleViewReady)]) {
            [self.eventHandler handleViewReady];
        }
        self.ready = YES;
    }
    if ([self.eventHandler respondsToSelector:@selector(handleViewWillAppear:)]) {
        [self.eventHandler handleViewWillAppear:animated];
    };
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if ([self.eventHandler respondsToSelector:@selector(handleViewDidAppear:)]) {
        [self.eventHandler handleViewDidAppear:animated];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if ([self.eventHandler respondsToSelector:@selector(handleViewWillDisappear:)]) {
        [self.eventHandler handleViewWillDisappear:animated];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if ([self.eventHandler respondsToSelector:@selector(handleViewDidDisappear:)]) {
        [self.eventHandler handleViewDidDisappear:animated];
    }
    if (self.SH_isRemoving == NO) {
        if ([self.eventHandler respondsToSelector:@selector(handleViewRemoved)]) {
            [self.eventHandler handleViewRemoved];
        }
        self.ready = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - layout
- (void)viewWillLayoutSubviews {

}

#pragma mark - getters、setters
@end
