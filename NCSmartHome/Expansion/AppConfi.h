//
//  AppConfi.h
//  NCSmartHome
//
//  Created by Wiley on 2019/6/2.
//  Copyright © 2019 Wiley. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kScreenBounds  [UIScreen mainScreen].bounds //屏幕尺寸
#define kScreenWidth   [UIScreen mainScreen].bounds.size.width//屏幕宽度
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height//屏幕高度
#define kMainColor  [UIColor colorWithHexString:@"#545DFF"]//主题蓝色

NS_ASSUME_NONNULL_BEGIN

@interface AppConfi : NSObject
//rootVC传空就默认根控制器
- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC;
+(instancetype)shareAppConfi;

@end

NS_ASSUME_NONNULL_END
