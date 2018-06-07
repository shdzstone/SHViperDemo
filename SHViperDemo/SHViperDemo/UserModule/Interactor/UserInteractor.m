//
//  UserInteractor.m
//  SHViperDemo
//
//  Created by cdz on 2018/6/7.
//Copyright © 2018年 cdz's mac. All rights reserved.
//

#import "UserInteractor.h"
#import "SHViperInteractorPrivate.h"
#import "UserDataService.h"

@interface UserInteractor () <SHViperInteractorPrivate>
@property (nonatomic, weak) id<UserDataService> dataService;

@end

@implementation UserInteractor

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
