//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___

#import "___VARIABLE_productName___Presenter.h"
#import "___VARIABLE_productName___Interactor.h"
#import "___VARIABLE_productName___Protocol.h"
//
@interface ___VARIABLE_productName___Presenter ()
@property (nonatomic, weak  ) id<___VARIABLE_productName___Protocol> view;
@property (nonatomic, strong) ___VARIABLE_productName___Interactor * interactor;
//
@end

@implementation ___VARIABLE_productName___Presenter

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark - viper
- (void)bindView:(id<___VARIABLE_productName___Protocol>)view {
    self.view = view;
}

- (void)bindInteractor:(id)interactor {
    self.interactor = interactor;
}

#pragma mark - ViewEventHandler
- (void)handleViewReady {
    
}

- (void)handleViewWillAppear:(BOOL)animated {

}

- (void)handleViewWillDisappear:(BOOL)animated {
    
}

#pragma mark - ViewDataSource

#pragma mark - private

@end
