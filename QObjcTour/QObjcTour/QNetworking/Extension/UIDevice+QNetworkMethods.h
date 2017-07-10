//
//  UIDevice+QNetworkMethods.h
//  QObjcTour
//
//  Created by cdzdev on 2017/7/10.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIDevice (QNetworkMethods)

/*
 * @method uuid
 * @description apple identifier support iOS6 and iOS5 below
 */

- (NSString *) QN_macaddress;
- (NSString *) QN_macaddressMD5;
- (NSString *) QN_machineType;
- (NSString *) QN_ostype;//显示“ios6，ios5”，只显示大版本号

@end
