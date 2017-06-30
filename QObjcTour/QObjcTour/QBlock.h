//
//  QBlock.h
//  QObjcTour
//
//  Created by cdzdev on 2017/6/30.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QBlock : NSObject
@property(nullable,nonatomic)NSString *blockName;
+ (void)blockDefineAndUser;
+ (void)inlineBlock;

- (instancetype _Nullable )init NS_DESIGNATED_INITIALIZER;

@property (nonatomic, assign) int         number;
@property (nonatomic, copy)   NSString * _Nullable myString;
@property (nonatomic, retain) UIView * _Nullable myView;
@end

