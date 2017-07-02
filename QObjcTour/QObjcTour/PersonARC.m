//
//  PersonARC.m
//  QObjcTour
//
//  Created by cdzdev on 2017/6/30.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import "PersonARC.h"



@implementation PersonARC

- (void)contrived {
    PersonARC *aPerson = [[PersonARC alloc] init];
    [aPerson setFirstName:@"William"];
    [aPerson setLastName:@"Dudney"];
    [aPerson setYearOfBirth:[[NSNumber alloc] initWithInteger:2011]];
    MPLog(@"aPerson: %@", aPerson);
}


- (void)takeLastNameFrom:(PersonARC *)person {
    NSString *oldLastname = [self lastName];
    [self setLastName:[person lastName]];
    MPLog(@"Lastname changed from %@ to %@", oldLastname, [self lastName]);
}

@end

