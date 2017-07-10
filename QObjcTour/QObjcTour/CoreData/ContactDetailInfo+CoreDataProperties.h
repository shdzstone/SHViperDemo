//
//  ContactDetailInfo+CoreDataProperties.h
//  QObjcTour
//
//  Created by cdzdev on 2017/7/10.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import "ContactDetailInfo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ContactDetailInfo (CoreDataProperties)

+ (NSFetchRequest<ContactDetailInfo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *address;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *telephone;
@property (nullable, nonatomic, retain) ContactInfo *info;

@end

NS_ASSUME_NONNULL_END
