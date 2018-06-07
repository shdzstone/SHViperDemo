//
//  NSObject+SHViperAssembly.m
//  SHViper
//
//  Created by zuik on 2017/8/10.
//  Copyright © 2017 zuik. All rights reserved.
//

#import "NSObject+SHViperAssembly.h"
#import "SHViperViewPrivate.h"
#import "SHViperPresenterPrivate.h"
#import "SHViperInteractorPrivate.h"
#import "SHViperWireframePrivate.h"
//#import "SHViperDataService.h"

@implementation NSObject (SHViperAssembly)

+ (void)assembleViperForView:(id<SHViperViewPrivate>)view
                   presenter:(id<SHViperPresenterPrivate>)presenter
                  interactor:(id<SHViperInteractorPrivate>)interactor
                   wireframe:(id<SHViperWireframePrivate>)wireframe
                      router:(id<SHViperRouter>)router
                 dataService:(id<SHViperDataService>)dataService
{
    NSParameterAssert([view conformsToProtocol:@protocol(SHViperViewPrivate)]);
    NSParameterAssert([presenter conformsToProtocol:@protocol(SHViperPresenterPrivate)]);
    NSParameterAssert([interactor conformsToProtocol:@protocol(SHViperInteractorPrivate)]);
    NSParameterAssert([wireframe conformsToProtocol:@protocol(SHViperWireframePrivate)]);
    NSCParameterAssert([router conformsToProtocol:@protocol(SHViperRouter)]);
    NSCParameterAssert([dataService conformsToProtocol:@protocol(SHViperDataService)]);
    
    NSAssert3(interactor.dataService == nil, @"Interactor (%@)'s dataSource (%@) already exists when assemble viper for new dataSource", interactor, interactor.dataService,dataService);
    interactor.dataService = dataService;
    
    NSAssert3(wireframe.view == nil, @"Wireframe (%@)'s view (%@) already exists when assemble viper for new view", wireframe, wireframe.view,view);
    wireframe.view = view;
    wireframe.router = router;
    
    NSAssert3(presenter.interactor == nil, @"Presenter (%@)'s interactor (%@) already exists when assemble viper for new interactor", presenter, presenter.interactor,interactor);
    NSAssert3(presenter.view == nil, @"Presenter (%@)'s view (%@) already exists when assemble viper for new view", presenter, presenter.view,view);
    NSAssert3(presenter.wireframe == nil, @"Presenter (%@)'s wireframe (%@) already exists when assemble viper for new router", presenter, presenter.wireframe,self);
    presenter.interactor = interactor;
    presenter.view = view;
    presenter.wireframe = wireframe;
    
    if ([view respondsToSelector:@selector(viewDataSource)] &&
        [view respondsToSelector:@selector(setViewDataSource:)]) {
        NSAssert3(view.viewDataSource == nil, @"View (%@)'s viewDataSource (%@) already exists when assemble viper for new viewDataSource", view, view.viewDataSource,presenter);
        view.viewDataSource = presenter;
    }
    NSAssert3(view.eventHandler == nil, @"View (%@)'s eventHandler (%@) already exists when assemble viper for new eventHandler", view, view.eventHandler,presenter);
    view.eventHandler = presenter;
}

@end
