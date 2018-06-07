//
//  UserInfoModel.m
//  SHViperDemo
//
//  Created by cdz on 2018/6/7.
//  Copyright © 2018年 cdz's mac. All rights reserved.
//

#import "UserInfoModel.h"

#import "SHDataService+User.h"

@implementation UserInfoModel

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.account forKey:@"account"];
    [aCoder encodeObject:self.passward forKey:@"passward"];
    [aCoder encodeBool:self.isLoginBool forKey:@"isLoginBool"];
    
    [aCoder encodeObject:self.api_token forKey:@"api_token"];
    [aCoder encodeInt:self.token_id forKey:@"token_id"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super init])) {
        self.account = [aDecoder decodeObjectForKey:@"account"];
        self.passward = [aDecoder decodeObjectForKey:@"passward"];
        self.isLoginBool = [aDecoder decodeBoolForKey:@"isLoginBool"];
        
        self.api_token = [aDecoder decodeObjectForKey:@"api_token"];
        self.token_id = [aDecoder decodeIntForKey:@"token_id"];
    }
    return self;
}

#pragma mark - 单例
+ (instancetype)loginedUser {
    //    DDLogVerbose(@"lev1:%d   rate:%f  col_num:%d   start_num:%d",[[SHDataService sharedInsatnce] loginedUser].authorityLev,[[SHDataService sharedInsatnce] loginedUser].rate,[[SHDataService sharedInsatnce] loginedUser].col_num,[[SHDataService sharedInsatnce] loginedUser].start_num);
    
    return [[SHDataService sharedInsatnce] loginedUser];
}

+ (NSDictionary*)requiredParameters {
    //    return [[SHDataService sharedInsatnce] requiredParameters];
    
    return @{@"api_token":[NSString stringWithFormat:@"%@",[UserInfoModel loginedUser].api_token]
             ,@"token_id":[NSString stringWithFormat:@"%d",[UserInfoModel loginedUser].token_id]
             };
    
}

@end
