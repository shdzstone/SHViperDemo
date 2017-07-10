//
//  Person+Functions.m
//  QObjcTour
//
//  Created by cdzdev on 2017/7/10.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import "Person+Functions.h"

@implementation Person (Functions)

+(NSString *)entityName{
    return @"Person";
}

+(Person *)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *) context{
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:context];
}

-(NSString *)description{
    return [NSString stringWithFormat:@"name:%@ age:%ld",self.name,(long)self.age.integerValue];
}
@end
