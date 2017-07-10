//
//  ContactInfo+CoreDataProperties.m
//  QObjcTour
//
//  Created by cdzdev on 2017/7/10.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import "ContactInfo+CoreDataProperties.h"

@implementation ContactInfo (CoreDataProperties)

+ (NSFetchRequest<ContactInfo *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"ContactInfo"];
}

@dynamic age;
@dynamic birthday;
@dynamic name;
@dynamic details;

@end
