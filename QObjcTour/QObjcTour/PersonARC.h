//
//  PersonARC.h
//  QObjcTour
//
//  Created by cdzdev on 2017/6/30.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonARC : NSObject
@property NSString *firstName;
@property NSString *lastName;
@property NSNumber *yearOfBirth;
@property PersonARC *spouse;

@end
