//
//  NSDictionary+QNetworkMethods.h
//  QObjcTour
//
//  Created by cdzdev on 2017/7/10.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (QNetworkMethods)

- (NSString *)QN_urlParamsStringSignature:(BOOL)isForSignature;
- (NSString *)QN_jsonString;
- (NSArray *)QN_transformedUrlParamsArraySignature:(BOOL)isForSignature;

@end
