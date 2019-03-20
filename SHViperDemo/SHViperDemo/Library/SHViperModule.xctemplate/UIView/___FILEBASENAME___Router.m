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
+ (UIView *)viewWithRouteSource:(UIViewController*)routeSource {
    ___VARIABLE_productName___View *view = [[___VARIABLE_productName___View alloc] initWithFrame:CGRectZero];
    ___VARIABLE_productName___Presenter *presenter = [[___VARIABLE_productName___Presenter alloc] init];
    ___VARIABLE_productName___Interactor *interactor = [[___VARIABLE_productName___Interactor alloc] init];

    [view bindPresenter:presenter];
    [presenter bindView:view];
    [presenter bindInteractor:interactor];
    
    if ([view respondsToSelector:@selector(setRouteSource:)]) {
        view.routeSource = routeSource;
    }
    return view;
}

@end
