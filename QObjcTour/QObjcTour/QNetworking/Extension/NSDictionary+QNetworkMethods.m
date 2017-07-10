//
//  NSDictionary+QNetworkMethods.m
//  QObjcTour
//
//  Created by cdzdev on 2017/7/10.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import "NSDictionary+QNetworkMethods.h"

#import "NSArray+QNetworkMethods.h"

@implementation NSDictionary (QNetworkMethods)

/** 字符串前面是没有问号的，如果用于POST，那就不用加问号，如果用于GET，就要加个问号 */
- (NSString *)QN_urlParamsStringSignature:(BOOL)isForSignature {
    NSArray *sortedArray = [self QN_transformedUrlParamsArraySignature:isForSignature];
    return [sortedArray QN_paramsString];
}

/** 字典变json */
- (NSString *)QN_jsonString {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:NULL];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

/** 转义参数 */
- (NSArray *)QN_transformedUrlParamsArraySignature:(BOOL)isForSignature {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (![obj isKindOfClass:[NSString class]]) {
            obj = [NSString stringWithFormat:@"%@", obj];
        }
        if (!isForSignature) {
            
            obj = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,  (CFStringRef)obj,  NULL,  (CFStringRef)@"!*'();:@&;=+$,/?%#[]",  kCFStringEncodingUTF8));
        }
        if ([obj length] > 0) {
            [result addObject:[NSString stringWithFormat:@"%@=%@", key, obj]];
        }
    }];
    NSArray *sortedResult = [result sortedArrayUsingSelector:@selector(compare:)];
    return sortedResult;
}

@end
