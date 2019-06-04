//
//  UIColor+Expansion.h
//  NCSmartHome
//
//  Created by Wiley on 2019/6/2.
//  Copyright © 2019 Wiley. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Expansion)
//16进制转颜色值, 常用于web颜色值码(除用于web页面解析, 其他地方不建议采用)
+ (UIColor *) colorWithHexString: (NSString *)color;

//16进制转颜色值
+ (UIColor *) colorFromRGB:(NSInteger)rgbValue;

//10进制转颜色值
+ (UIColor *) color:(int)red green:(int)green blue:(int)blue alpha:(CGFloat)alpha;
//随机颜色
+(UIColor *)randomColor;

@end

NS_ASSUME_NONNULL_END
