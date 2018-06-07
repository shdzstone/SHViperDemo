//
//  SHViperWireframePrivate.h
//  SHViper
//
//  Created by zuik on 2017/8/3.
//  Copyright © 2017 zuik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHViperWireframe.h"
#import "SHViperRouter.h"

@protocol SHViperWireframePrivate <SHViperWireframe>
- (void)setView:(id<SHViperView>)view;
- (id<SHViperRouter>)router;
- (void)setRouter:(id<SHViperRouter>)router;
@end
