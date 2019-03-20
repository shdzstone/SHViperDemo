//
//  ControllerView.m
//  SHViperDemo
//
//  Created by stone on 2019/3/20.
//  Copyright © 2019 cdz's mac. All rights reserved.

#import "ControllerView.h"
#import "ControllerPresenter.h"
#import "ControllerRouter.h"
//
#import "TestView.h"
#import "TestRouter.h"

@interface ControllerView ()
@property (nonatomic, strong) ControllerPresenter *presenter;
@property (nonatomic, assign) BOOL ready;
//
@end

@implementation ControllerView
@synthesize testView=_testView;
#pragma mark - life cycle
- (instancetype)initWithParm:(NSDictionary *)parm {
    if (self = [super init]) {
        if (parm) {
            self.navigationItem.title = parm[@"title"];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.navigationItem.title) {
        self.navigationItem.title = @"Controller";
    }
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addSubviews];
    
    if (self.ready == NO) {
        NSAssert([self.presenter conformsToProtocol:@protocol(ControllerEventHandler)], nil);
        if ([self.presenter respondsToSelector:@selector(handleViewReady)]) {
            [self.presenter handleViewReady];
        }
        self.ready = YES;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    if ([self.presenter respondsToSelector:@selector(handleViewWillAppear:)]) {
        [self.presenter handleViewWillAppear:animated];
    };
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if ([self.presenter respondsToSelector:@selector(handleViewWillDisappear:)]) {
        [self.presenter handleViewWillDisappear:animated];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // 参考: https://www.jianshu.com/p/c244f5930fdf
    if (self.isViewLoaded && !self.view.window) {
        // self.view = nil;//当再次进入此视图中时能够重新调用viewDidLoad方法
    }
}

#pragma mark - viper
- (UIViewController *)viewController {
    return self;
}

- (void)bindPresenter:(id)presenter {
    self.presenter = presenter;
}

#pragma mark - layout
- (void)addSubviews {
    self.view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.testView];
}

- (void)viewWillLayoutSubviews {
    [self.testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
    }];
}
#pragma mark - getters/setters
- (TestView *)testView {
    if (_testView) return _testView;
    _testView = (TestView*)[TestRouter viewWithRouteSource:self];
    return _testView;
}

@end
