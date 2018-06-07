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
+ (UIViewController *)viewFor___VARIABLE_productName___ {
    
    return [___VARIABLE_productName___Builder viewControllerWithRouter:[SHRouter sharedInsatnce] dataService:[SHDataService sharedInsatnce]];
}

@end

