//
//  BaseViewController.m
//  NCSmartHome
//
//  Created by Wiley on 2019/6/2.
//  Copyright © 2019 Wiley. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
//获取ViewController 实例
+ (instancetype)getViewControllerClass:(Class)classObject forStoryboard:(NSString *)storyboard
{
    NSString *classNmae = NSStringFromClass(classObject);
    return [BaseViewController getViewControllerWithName:classNmae forStoryboard:storyboard];
}

//获取ViewController 实例
+ (instancetype)getViewControllerWithName:(NSString *)className forStoryboard:(NSString *)storyboard
{
    return [[UIStoryboard storyboardWithName:storyboard bundle:nil] instantiateViewControllerWithIdentifier:className];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
