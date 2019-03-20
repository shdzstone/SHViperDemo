//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___

#import <UIKit/UIKit.h>
#import "___VARIABLE_productName___EventHandler.h"
#import "___VARIABLE_productName___DataSource.h"
#import "___VARIABLE_productName___Protocol.h"

@interface ___VARIABLE_productName___View : UIViewController <___VARIABLE_productName___Protocol>

#pragma mark - viper
- (void)bindPresenter:(id)presenter;
#pragma mark - initial
- (instancetype)initWithParm:(NSDictionary *)parm;
//
@end
