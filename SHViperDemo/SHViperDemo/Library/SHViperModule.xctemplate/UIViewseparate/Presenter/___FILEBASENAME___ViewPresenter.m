//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___VARIABLE_productName___ViewPresenter.h"
#import "SHViperView.h"
#import "SHViperWireframe.h"
#import "SHViperInteractor.h"
#import "SHViperPresenterPrivate.h"

#import "___VARIABLE_productName___ViewInput.h"
#import "___VARIABLE_productName___WireframeInput.h"
#import "___VARIABLE_productName___InteractorInput.h"

@interface ___VARIABLE_productName___ViewPresenter () <SHViperPresenterPrivate>
@property (nonatomic, strong) id<SHViperWireframe,___VARIABLE_productName___WireframeInput> wireframe;
@property (nonatomic, weak) id<SHViperView,___VARIABLE_productName___ViewInput> view;
@property (nonatomic, strong) id<SHViperInteractor,___VARIABLE_productName___InteractorInput> interactor;
@end

@implementation ___VARIABLE_productName___ViewPresenter

#pragma mark SHViperViewEventHandler

- (void)handleViewReady {
    NSAssert(self.wireframe.view == self.view, @"Wireframe should be initlized when view is ready.");
    NSAssert([self.view conformsToProtocol:@protocol(___VARIABLE_productName___ViewInput)], @"Presenter should be attach to a view.");
    NSAssert([self.interactor conformsToProtocol:@protocol(___VARIABLE_productName___InteractorInput)], @"Interactor should be initlized when view is ready.");
    
}

- (void)handleViewWillAppear:(BOOL)animated {
    
}

- (void)handleViewDidAppear:(BOOL)animated {
    
}

- (void)handleViewWillDisappear:(BOOL)animated {
    
}

- (void)handleViewDidDisappear:(BOOL)animated {
    
}

- (void)handleViewRemoved {
    
}

#pragma mark ___VARIABLE_productName___ViewDataSource

#pragma mark ___VARIABLE_productName___ViewEventHandler

@end
