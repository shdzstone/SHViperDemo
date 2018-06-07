//
//  SHViperDataService.h
//  Bee
//
//  Created by cdz on 2018/5/11.
//  Copyright © 2018年 cdz's mac. All rights reserved.
//

//#ifndef SHViperDataService_h
//#define SHViperDataService_h

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SHViperView;
@protocol SHViperPresenter;
@protocol SHViperInteractor;

@protocol SHViperDataService <NSObject>
+ (id<SHViperDataService>)sharedInsatnce;
@end

NS_ASSUME_NONNULL_END


//#endif /* SHViperDataService_h */
