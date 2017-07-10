//
//  ContactInfo+CoreDataProperties.h
//  QObjcTour
//
//  Created by cdzdev on 2017/7/10.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import "ContactInfo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ContactInfo (CoreDataProperties)

+ (NSFetchRequest<ContactInfo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *age;
@property (nullable, nonatomic, copy) NSString *birthday;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) ContactDetailInfo *details;

@end

NS_ASSUME_NONNULL_END
