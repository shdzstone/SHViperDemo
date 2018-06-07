//
//  SHViperInteractorPrivate.h
//  SHViper
//
//  Created by zuik on 2017/7/17.
//  Copyright © 2017 zuik. All rights reserved.
//

#import "SHViperInteractor.h"

@protocol SHViperInteractorPrivate <SHViperInteractor>
- (void)setDataService:(id<SHViperDataService>)dataService;
@end
