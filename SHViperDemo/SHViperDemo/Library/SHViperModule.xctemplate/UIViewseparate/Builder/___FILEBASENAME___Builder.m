//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___VARIABLE_productName___Builder.h"
#import "SHViperViewPrivate.h"
#import "SHViperPresenterPrivate.h"
#import "SHViperInteractorPrivate.h"
#import "SHViperWireframePrivate.h"
#import "NSObject+SHViperAssembly.h"

#import "___VARIABLE_productName___View.h"
#import "___VARIABLE_productName___ViewPresenter.h"
#import "___VARIABLE_productName___Wireframe.h"
#import "___VARIABLE_productName___Router.h"
#import "___VARIABLE_productName___Interactor.h"
#import "___VARIABLE_productName___DataService.h"

@implementation ___VARIABLE_productName___Builder

///Change this method, add your arguments for initializing the module
+ (UIView *)viewWithRouteSource:(nullable UIViewController *)routeSource router:(id<SHViperRouter>)router dataService:(id<___VARIABLE_productName___DataService>)dataService {
//#error Create view
    ___VARIABLE_productName___View *view = [[___VARIABLE_productName___View alloc]initWithFrame:CGRectZero];
    
    [self buildView:(id<SHViperViewPrivate>)view
        routeSource:routeSource
             router:router
        dataService:dataService];
    return view;
}

+ (void)buildView:(id<SHViperViewPrivate>)view
      routeSource:(nullable UIViewController *)routeSource
           router:(id<SHViperRouter>)router
      dataService:(id<___VARIABLE_productName___DataService>)dataService {
    NSParameterAssert([view isKindOfClass:[___VARIABLE_productName___View class]]);
    ___VARIABLE_productName___ViewPresenter *presenter = [[___VARIABLE_productName___ViewPresenter alloc] init];
    ___VARIABLE_productName___Interactor *interactor = [[___VARIABLE_productName___Interactor alloc] init];
    ___VARIABLE_productName___Wireframe *wireframe = [[___VARIABLE_productName___Wireframe alloc] init];
    
    if ([view respondsToSelector:@selector(setRouteSource:)]) {
        view.routeSource = routeSource;
    }
    [self assembleViperForView:view
                     presenter:(id<SHViperPresenterPrivate>)presenter
                    interactor:(id<SHViperInteractorPrivate>)interactor
                     wireframe:(id<SHViperWireframePrivate>)wireframe
                        router:(id<SHViperRouter>)router
                   dataService:(id<SHViperDataService>)dataService];
}

@end
