//
//  NSURLRequest+QNetworkMethods.m
//  QObjcTour
//
//  Created by cdzdev on 2017/7/10.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import "NSURLRequest+QNetworkMethods.h"
#import <objc/runtime.h>

static void *CTNetworkingRequestParams;

@implementation NSURLRequest (QNetworkMethods)

- (void)setRequestParams:(NSDictionary *)requestParams
{
    objc_setAssociatedObject(self, &CTNetworkingRequestParams, requestParams, OBJC_ASSOCIATION_COPY);
}

- (NSDictionary *)requestParams
{
    return objc_getAssociatedObject(self, &CTNetworkingRequestParams);
}

@end
