//
//  LumberJackFormatter.h
//  SDZDemo
//
//  Created by cdzdev on 2018/3/16.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDLog.h"


@interface LumberJackFormatter: NSObject<DDLogFormatter>
+(instancetype)sharedInstance;
@end



