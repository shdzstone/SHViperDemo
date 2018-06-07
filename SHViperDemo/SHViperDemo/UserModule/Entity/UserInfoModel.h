//
//  UserInfoModel.h
//  SHViperDemo
//
//  Created by cdz on 2018/6/7.
//  Copyright © 2018年 cdz's mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoModel : NSObject<NSCoding>
@property(nonatomic,strong)NSString *account;
@property(nonatomic,strong)NSString *passward;
@property(nonatomic,assign)BOOL isLoginBool;

//登录接口返回属性
@property(nonatomic,strong)NSString *api_token;
@property(nonatomic,assign)int token_id;


- (id)initWithCoder:(NSCoder *)aDecoder;
- (void)encodeWithCoder:(NSCoder *)aCoder;

//已经登录的用户
+ (instancetype)loginedUser;
//接口所必须的参数
+ (NSDictionary*)requiredParameters;
@end
