//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___

#import "___VARIABLE_productName___Router.h"
#import "___VARIABLE_productName___Presenter.h"
#import "___VARIABLE_productName___View.h"
#import "___VARIABLE_productName___Interactor.h"

@implementation ___VARIABLE_productName___Router
//viper组件初始化
+ (UIViewController *)viewWithParm:(NSDictionary *)parm {
    ___VARIABLE_productName___View *view = [[___VARIABLE_productName___View alloc] initWithParm:parm];
    ___VARIABLE_productName___Presenter *presenter = [___VARIABLE_productName___Presenter new];
    ___VARIABLE_productName___Interactor *interactor = [___VARIABLE_productName___Interactor new];

    [view bindPresenter:presenter];
    [presenter bindView:view];
    [presenter bindInteractor:interactor];
    return view;
}

+ (void)bindViewPresenter:(UIViewController *)view {
    if ([view isKindOfClass:[___VARIABLE_productName___View class]]) {
        ___VARIABLE_productName___View *viewController = (___VARIABLE_productName___View *)view;
        ___VARIABLE_productName___Presenter *presenter = [___VARIABLE_productName___Presenter new];
        ___VARIABLE_productName___Interactor *interactor = [___VARIABLE_productName___Interactor new];

        [viewController bindPresenter:presenter];
        [presenter bindView:viewController];
        [presenter bindInteractor:interactor];
    }
}

@end
