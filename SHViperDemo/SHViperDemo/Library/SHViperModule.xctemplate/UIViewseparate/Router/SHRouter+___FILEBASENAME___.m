//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "SHRouter+___VARIABLE_productName___.h"

#import "___VARIABLE_productName___Builder.h"
#import "SHDataService+___VARIABLE_productName___.h"

@implementation SHRouter(UserLogin)

+ (UIView *)viewFor___VARIABLE_productName___WithRouteSource:(UIViewController*)routeSource {
    return [___VARIABLE_productName___Builder viewWithRouteSource:routeSource router:[SHRouter sharedInsatnce] dataService:[SHDataService sharedInsatnce]];
}

@end

