//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SHViperViewPrivate,SHViperRouter,___VARIABLE_productName___DataService;
@interface ___VARIABLE_productName___Builder : NSObject

///Change this method, add your arguments for initializing the module
+ (UIView *)viewWithRouteSource:(nullable UIViewController *)routeSource router:(id<SHViperRouter>)router dataService:(id<___VARIABLE_productName___DataService>)dataService;
+ (void)buildView:(id<SHViperViewPrivate>)view
      routeSource:(nullable UIViewController *)routeSource
           router:(id<SHViperRouter>)router
      dataService:(id<___VARIABLE_productName___DataService>)dataService;

@end

NS_ASSUME_NONNULL_END
