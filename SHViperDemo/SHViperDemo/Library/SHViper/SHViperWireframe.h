//
//  SHViperWireframe.h
//  SHViper
//
//  Created by zuik on 2017/8/2.
//  Copyright © 2017 zuik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SHViperView;
@protocol SHViperWireframe <NSObject>
@property (nonatomic, readonly, weak) id<SHViperView> view;
@end
