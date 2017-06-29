//
//  AppDelegate.h
//  QObjcTour
//
//  Created by cdzdev on 2017/6/29.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

