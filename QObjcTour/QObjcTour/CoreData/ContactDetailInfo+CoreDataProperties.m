//
//  ContactDetailInfo+CoreDataProperties.m
//  QObjcTour
//
//  Created by cdzdev on 2017/7/10.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import "ContactDetailInfo+CoreDataProperties.h"

@implementation ContactDetailInfo (CoreDataProperties)

+ (NSFetchRequest<ContactDetailInfo *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"ContactDetailInfo"];
}

@dynamic address;
@dynamic name;
@dynamic telephone;
@dynamic info;

@end
