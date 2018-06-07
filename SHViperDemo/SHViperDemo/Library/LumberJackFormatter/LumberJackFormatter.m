//
//  LumberJackFormatter.m
//  SDZDemo
//
//  Created by cdzdev on 2018/3/16.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import "LumberJackFormatter.h"
#import <libkern/OSAtomic.h>

#define DATE_STRING @"HH:mm:ss:SS"


@interface LumberJackFormatter(){
    int loggerCount;
    NSDateFormatter *threadUnsafeDateFormatter;
}
@end

@implementation LumberJackFormatter
+(instancetype)sharedInstance{
    static LumberJackFormatter *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


- (id)init {
    if((self = [super init])) {
        threadUnsafeDateFormatter = [[NSDateFormatter alloc] init];
        [threadUnsafeDateFormatter setDateFormat:DATE_STRING];
    }
    return self;
}


- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    NSString *logLevel;
    switch (logMessage->_flag) {
        case DDLogFlagError    : logLevel = @"E"; break;
        case DDLogFlagWarning  : logLevel = @"W"; break;
        case DDLogFlagInfo     : logLevel = @"I"; break;
        case DDLogFlagDebug    : logLevel = @"D"; break;
        default                : logLevel = @"V"; break;
    }
    
    NSString *dateAndTime = [threadUnsafeDateFormatter stringFromDate:(logMessage->_timestamp)];
    NSString *logMsg = logMessage->_message;
    NSString *function = logMessage->_function;
    
//    return [NSString stringWithFormat:@"| %@ | %@",function, logMsg];

    return [NSString stringWithFormat:@"%@ %@ | %@ | %@", logLevel, dateAndTime,function, logMsg];
}

- (void)didAddToLogger:(id <DDLogger>)logger {
    loggerCount++;
    NSAssert(loggerCount <= 1, @"This logger isn't thread-safe");
}

- (void)willRemoveFromLogger:(id <DDLogger>)logger {
    loggerCount--;
}


@end
