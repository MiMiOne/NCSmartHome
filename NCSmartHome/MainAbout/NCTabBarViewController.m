//
//  NCTabBarViewController.m
//  NCSmartHome
//
//  Created by Wiley on 2019/6/2.
//  Copyright © 2019 Wiley. All rights reserved.
//

#import "NCTabBarViewController.h"
#import "BaseViewController.h"
@interface NCTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation NCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupViewControllers];
    
}

- (void)setupViewControllers
{
    UINavigationController *nav0 = (UINavigationController *)[BaseViewController getViewControllerWithName:@"Home" forStoryboard:@"Home"];
    nav0.delegate = self;
    
    UINavigationController *nav1 = (UINavigationController *)[BaseViewController getViewControllerWithName:@"Rooms" forStoryboard:@"Rooms"];
    nav1.delegate = self;
    //CircleForFashionNavigationController
    //FashionNavigationController
    UINavigationController *nav2 = (UINavigationController *)[BaseViewController getViewControllerWithName:@"Automation" forStoryboard:@"Automation"];
    nav2.delegate = self;
    
    UINavigationController *nav3 = (UINavigationController *)[BaseViewController getViewControllerWithName:@"About" forStoryboard:@"About"];
    nav3.delegate = self;
    
    self.delegate = self;
    [self setViewControllers:@[nav0, nav1, nav2, nav3]];
    
    [self customizeTabBarForController];
    [self setSelectedIndex:0];
}
- (void)customizeTabBarForController
{
        NSArray *barItemTitles = @[@"我的家",@"房间",@"生活",@"关于"];
        NSArray *barItemNormalImages = @[@"home-2Home",@"lamp-2rooms",@"roomba-1auto",@"light-bulb-2about"];
        [self.tabBar setTintColor:kMainColor];
        self.tabBar.barTintColor = [UIColor whiteColor];
        int index = 0;
        for (UITabBarItem *item in [[self tabBar] items]) {
            [item setImage:[[UIImage imageNamed:barItemNormalImages[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
            [item setTitle:barItemTitles[index]];
            [item setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10],NSForegroundColorAttributeName : [UIColor lightGrayColor]} forState:UIControlStateNormal];
            [item setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10],NSForegroundColorAttributeName : kMainColor} forState:UIControlStateSelected];
            index ++;
        }
    
    [[UINavigationBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTintColor:kMainColor];
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14],NSForegroundColorAttributeName:kMainColor} forState:UIControlStateNormal];
    //    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
    NSDictionary *textAttributes = @{
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                           NSForegroundColorAttributeName: kMainColor,
                           };
    [[UINavigationBar appearance] setTitleTextAttributes:textAttributes];
}
#pragma mark UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSArray *hideNavigationbarViewControlers = @[@"NCHomeViewController",@"NCRoomsViewController",@"NCAutomationViewController",@"NCAboutViewController"];
    //YUNewPocketSubmitSuccessViewController
    if([hideNavigationbarViewControlers containsObject:NSStringFromClass([viewController class])])
    {
        [navigationController setNavigationBarHidden:YES animated:animated];
    }
    else if([navigationController isNavigationBarHidden])
    {
        [navigationController setNavigationBarHidden:NO animated:animated];
    }
}
@end
