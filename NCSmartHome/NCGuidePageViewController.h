//
//  NCGuidePageViewController.h
//  NCSmartHome
//
//  Created by Wiley on 2019/6/2.
//  Copyright © 2019 Wiley. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^ClickLastButtonBlock)();
@interface NCGuidePageViewController : UIViewController
@property(nonatomic,copy)ClickLastButtonBlock ClickLastButtonBlock;

@end

NS_ASSUME_NONNULL_END
