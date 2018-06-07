//
//  ViperTestWireframe.m
//  SHViperDemo
//
//  Created by cdz on 2018/6/7.
//Copyright © 2018年 cdz's mac. All rights reserved.
//

#import "ViperTestWireframe.h"
#import "SHViperWireframePrivate.h"
#import "SHViperView.h"

@interface ViperTestWireframe () <SHViperWireframePrivate>
@property (nonatomic, weak) id<SHViperView> view;
@property (nonatomic, strong) id<SHViperRouter> router;
@end
 
@implementation ViperTestWireframe

@end
