//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___

#import "___VARIABLE_productName___View.h"
#import "___VARIABLE_productName___Presenter.h"
#import "___VARIABLE_productName___Router.h"
//
@interface ___VARIABLE_productName___View ()
@property (nonatomic, strong) ___VARIABLE_productName___Presenter *presenter;
@property (nonatomic, assign) BOOL ready;
//
@end

@implementation ___VARIABLE_productName___View
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
        self.navigationItem.title = @"___VARIABLE_productName___";
    }
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addSubviews];
    
    if (self.ready == NO) {
        NSAssert([self.presenter conformsToProtocol:@protocol(___VARIABLE_productName___EventHandler)], nil);
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

}

- (void)viewWillLayoutSubviews {

}
#pragma mark - getters/setters

@end
