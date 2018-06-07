//
//  ViperTestBuilder.m
//  SHViperDemo
//
//  Created by cdz on 2018/6/7.
//Copyright © 2018年 cdz's mac. All rights reserved.
//

#import "ViperTestBuilder.h"
#import "SHViperViewPrivate.h"
#import "SHViperPresenterPrivate.h"
#import "SHViperInteractorPrivate.h"
#import "SHViperWireframePrivate.h"
#import "NSObject+SHViperAssembly.h"

#import "ViperTestViewController.h"
#import "ViperTestViewPresenter.h"
#import "ViperTestWireframe.h"
#import "ViperTestRouter.h"
#import "ViperTestInteractor.h"
#import "ViperTestDataService.h"

@implementation ViperTestBuilder

+ (UIViewController *)viewControllerWithRouter:(id<SHViperRouter>)router dataService:(id<ViperTestDataService>)dataService {
//#error Create view
    
    ViperTestViewController *view = [[ViperTestViewController alloc] init] ;

    
    [self buildView:(id<SHViperViewPrivate>)view router:router dataService:dataService];
    return view;
}

+ (void)buildView:(id<SHViperViewPrivate>)view router:(id<SHViperRouter>)router  dataService:(id<ViperTestDataService>)dataService {
    NSParameterAssert([view isKindOfClass:[ViperTestViewController class]]);
    ViperTestViewPresenter *presenter = [[ViperTestViewPresenter alloc] init];
    ViperTestInteractor *interactor = [[ViperTestInteractor alloc] init];
    ViperTestWireframe *wireframe = [[ViperTestWireframe alloc] init];
    
    [self assembleViperForView:view
                     presenter:(id<SHViperPresenterPrivate>)presenter
                    interactor:(id<SHViperInteractorPrivate>)interactor
                     wireframe:(id<SHViperWireframePrivate>)wireframe
                        router:(id<SHViperRouter>)router
                   dataService:(id<SHViperDataService>)dataService];
}

@end
