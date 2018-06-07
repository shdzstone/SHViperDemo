//
//  NSObject+SHViperAssembly.h
//  SHViper
//
//  Created by zuik on 2017/8/10.
//  Copyright © 2017 zuik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SHViperViewPrivate,SHViperPresenterPrivate,SHViperInteractorPrivate,SHViperWireframePrivate,SHViperRouter,SHViperDataService;
@interface NSObject (SHViperAssembly)

+ (void)assembleViperForView:(id<SHViperViewPrivate>)view
                   presenter:(id<SHViperPresenterPrivate>)presenter
                  interactor:(id<SHViperInteractorPrivate>)interactor
                   wireframe:(id<SHViperWireframePrivate>)wireframe
                      router:(id<SHViperRouter>)router
                 dataService:(id<SHViperDataService>)dataService;

@end
