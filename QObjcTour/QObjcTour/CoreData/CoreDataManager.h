//
//  CoreDataManager.h
//  QObjcTour
//
//  Created by cdzdev on 2017/7/10.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject
@property(readonly,strong,nonatomic) NSManagedObjectContext *managedObjectContext;
@property(readonly,strong,nonatomic) NSManagedObjectModel *managedObjectModel;
@property(readonly,strong,nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL*)applicationDocumentsDirectory;
@end

