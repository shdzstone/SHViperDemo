//
//  SHDataService.h
//  Bee
//
//  Created by cdz on 2018/5/11.
//  Copyright © 2018年 cdz's mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SHViperDataService.h"

@class AFHTTPSessionManager;

@interface SHDataService : NSObject<SHViperDataService>

+ (instancetype)sharedInsatnce;
@property(nonatomic,strong,readonly)AFHTTPSessionManager *sharedHTTPManager;

//./document/core/
+ (NSString *)_pathForLocalData;
//./document/core/FileName
+ (NSString *)_pathForLocalDataWithFileName:(NSString *)fileName;
@end
