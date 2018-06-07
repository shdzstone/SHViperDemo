//
//  UserBuilder.m
//  SHViperDemo
//
//  Created by cdz on 2018/6/7.
//Copyright © 2018年 cdz's mac. All rights reserved.
//

#import "UserBuilder.h"
#import "SHViperViewPrivate.h"
#import "SHViperPresenterPrivate.h"
#import "SHViperInteractorPrivate.h"
#import "SHViperWireframePrivate.h"
#import "NSObject+SHViperAssembly.h"

#import "UserViewController.h"
#import "UserViewPresenter.h"
#import "UserWireframe.h"
#import "UserRouter.h"
#import "UserInteractor.h"
#import "UserDataService.h"

@implementation UserBuilder

+ (UIViewController *)viewControllerWithRouter:(id<SHViperRouter>)router dataService:(id<UserDataService>)dataService {
//#error Create view
    
    UserViewController *view = [[UserViewController alloc] init] ;

    
    [self buildView:(id<SHViperViewPrivate>)view router:router dataService:dataService];
    return view;
}

+ (void)buildView:(id<SHViperViewPrivate>)view router:(id<SHViperRouter>)router  dataService:(id<UserDataService>)dataService {
    NSParameterAssert([view isKindOfClass:[UserViewController class]]);
    UserViewPresenter *presenter = [[UserViewPresenter alloc] init];
    UserInteractor *interactor = [[UserInteractor alloc] init];
    UserWireframe *wireframe = [[UserWireframe alloc] init];
    
    [self assembleViperForView:view
                     presenter:(id<SHViperPresenterPrivate>)presenter
                    interactor:(id<SHViperInteractorPrivate>)interactor
                     wireframe:(id<SHViperWireframePrivate>)wireframe
                        router:(id<SHViperRouter>)router
                   dataService:(id<SHViperDataService>)dataService];
}

@end
