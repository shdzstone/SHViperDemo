//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___

#import <Foundation/Foundation.h>
#import "___VARIABLE_productName___EventHandler.h"
#import "___VARIABLE_productName___DataSource.h"

// 处理和View事件
@protocol ___VARIABLE_productName___Protocol;
@interface ___VARIABLE_productName___Presenter : NSObject <___VARIABLE_productName___EventHandler, ___VARIABLE_productName___DataSource>

#pragma mark - viper
- (void)bindView:(id<___VARIABLE_productName___Protocol>)view;
- (void)bindInteractor:(id)interactor;

@end
