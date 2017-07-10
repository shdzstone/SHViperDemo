//
//  Person+Functions.h
//  QObjcTour
//
//  Created by cdzdev on 2017/7/10.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import "Person.h"

@interface Person (Functions)

+(NSString *)entityName;
+(Person *)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *) context;

@end
