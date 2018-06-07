//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___VARIABLE_productName___Interactor.h"
#import "SHViperInteractorPrivate.h"
#import "___VARIABLE_productName___DataService.h"

@interface ___VARIABLE_productName___Interactor () <SHViperInteractorPrivate>
@property (nonatomic, weak) id<___VARIABLE_productName___DataService> dataService;

@end

@implementation ___VARIABLE_productName___Interactor


//input
- (void)loadDataWithCompletion:(successHandler)completion failure:(failureHandler)failure {
    [self.dataService dataWithCompletion:^(id _Nonnull dataInfo) {
        if (completion) {
            completion(dataInfo);
        }
    } failure:^(NSError *_Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
