//
//  BaseViewController.h
//  NCSmartHome
//
//  Created by Wiley on 2019/6/2.
//  Copyright © 2019 Wiley. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
//获取ViewController 实例
+ (instancetype)getViewControllerClass:(Class)classObject forStoryboard:(NSString *)storyboard;

//获取ViewController 实例
+ (instancetype)getViewControllerWithName:(NSString *)className forStoryboard:(NSString *)storyboard;
@end

NS_ASSUME_NONNULL_END
