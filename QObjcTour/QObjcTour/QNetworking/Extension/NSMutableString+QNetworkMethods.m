//
//  NSMutableString+QNetworkMethods.m
//  QObjcTour
//
//  Created by cdzdev on 2017/7/10.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import "NSMutableString+QNetworkMethods.h"

#import "NSObject+CTNetworkingMethods.h"

@implementation NSMutableString (QNetworkMethods)

- (void)QN_appendURLRequest:(NSURLRequest *)request
{
    [self appendFormat:@"\n\nHTTP URL:\n\t%@", request.URL];
    [self appendFormat:@"\n\nHTTP Header:\n%@", request.allHTTPHeaderFields ? request.allHTTPHeaderFields : @"\t\t\t\t\tN/A"];
    [self appendFormat:@"\n\nHTTP Body:\n\t%@", [[[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding] QN_defaultValue:@"\t\t\t\tN/A"]];
}

@end
