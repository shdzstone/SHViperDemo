//
//  SHViperInteractor.h
//  SHViper
//
//  Created by zuik on 2017/5/24.
//  Copyright © 2017 zuik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHViperDataService.h"

@protocol SHViperInteractor <NSObject>
@property (nonatomic, readonly, weak) id<SHViperDataService> dataService;
@end
