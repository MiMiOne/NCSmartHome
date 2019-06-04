//
//  NCAutomationViewController.m
//  NCSmartHome
//
//  Created by Wiley on 2019/6/2.
//  Copyright © 2019 Wiley. All rights reserved.
//

#import "NCAutomationViewController.h"
#import <AFNetworking.h>
#import <CoreLocation/CoreLocation.h>
#import "NCCaiYunModel.h"
#import <YYModel.h>
#import <Masonry.h>
#import <MBProgressHUD.h>
@interface NCAutomationViewController ()<CLLocationManagerDelegate>
{
    CLLocationManager *locationmanager;//定位服务
}
@property(nonatomic,copy)NSString *strlatitude;
@property(nonatomic,copy)NSString *strlongitude;
@property(nonatomic,strong)NCCaiYunModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UILabel *backLabel;

@end

@implementation NCAutomationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getLocation];
}
-(void)getLocation
{
    //判断定位功能是否打开
    if ([CLLocationManager locationServicesEnabled]) {
        locationmanager = [[CLLocationManager alloc]init];
        locationmanager.delegate = self;
        [locationmanager requestAlwaysAuthorization];
        [locationmanager requestWhenInUseAuthorization];
        
        //设置寻址精度
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest;
        locationmanager.distanceFilter = 5.0;
        [locationmanager startUpdatingLocation];
    }
}
//定位失败后调用此代理方法
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    //设置提示提醒用户打开定位服务
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"允许定位提示" message:@"请在设置中打开定位" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"打开定位" style:UIAlertActionStyleDefault handler:nil];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}
#pragma mark 定位成功后则执行此代理方法
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    [locationmanager stopUpdatingHeading];
    //旧址
    CLLocation *currentLocation = [locations lastObject];
    //打印当前的经度与纬度
    _strlatitude = [NSString stringWithFormat:@"%.3f",currentLocation.coordinate.latitude];
    _strlongitude = [NSString stringWithFormat:@"%.3f",currentLocation.coordinate.longitude];
    NSLog(@"%f,%f",currentLocation.coordinate.latitude,currentLocation.coordinate.longitude);
    
    [self getData];
    
}
-(void)getData
{
    
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    NSString *url = [NSString stringWithFormat:@"https://api.caiyunapp.com/v2/TAkhjf8d1nlSlspN/%@,%@/realtime.json",_strlongitude,_strlatitude];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[hud label] setText:@"加载中..."];
    hud.label.textColor = [UIColor whiteColor];
    hud.bezelView.backgroundColor = [UIColor blackColor];
    [manger GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.model = [NCCaiYunModel yy_modelWithJSON:responseObject];
        if ([self.model.status isEqualToString:@"ok"]) {
            self.backImageView.hidden = YES;
            self.backLabel.hidden = YES;
            [self creatCaiYunUI];
        }
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"...");
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];

}
-(void)creatCaiYunUI
{
    UIView *centerView = [UIView new];
    centerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:centerView];
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.height.equalTo(@300);
        make.centerY.equalTo(self.view.mas_centerY).offset(-100);
    }];
    
    
    UIImageView *centerImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"RectangleOnly"]];
    centerImageView.contentMode = UIViewContentModeScaleAspectFit;
    [centerView addSubview:centerImageView];
    [centerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(centerView);
    }];
    
    UILabel *dushu = [UILabel new];
    dushu.text = [NSString stringWithFormat:@"%@°",self.model.result.temperature];
    dushu.font = [UIFont systemFontOfSize:50 weight:0.5];
    [centerView addSubview:dushu];
    [dushu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(centerView);
        make.width.height.equalTo(@150);
    }];
    
    UILabel *miaoshu = [UILabel new];
    miaoshu.text = @"当前温度";
    miaoshu.font = [UIFont systemFontOfSize:20];
    miaoshu.textColor = kMainColor;
    miaoshu.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:miaoshu];
    [miaoshu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(centerView.mas_bottom).offset(10);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@20);
    }];
    
    UILabel *bottomOne = [UILabel new];
    bottomOne.backgroundColor = kMainColor;
    bottomOne.layer.cornerRadius = 30;
    bottomOne.layer.shadowColor = [UIColor grayColor].CGColor;
    bottomOne.layer.shadowOffset = CGSizeMake(0,0);
    bottomOne.layer.shadowOpacity = 1;
    bottomOne.textColor = [UIColor whiteColor];
    bottomOne.textAlignment = NSTextAlignmentCenter;
    bottomOne.font = [UIFont systemFontOfSize:25 weight:0.5];
    bottomOne.text = [NSString stringWithFormat:@"Co浓度:%@",self.model.result.co];
    [self.view addSubview:bottomOne];
    [bottomOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.centerY.equalTo(self.view.mas_bottom).offset(-150);
        make.width.equalTo(@((kScreenWidth - 60) / 2));
        make.height.equalTo(@80);
    }];
    
    UILabel *bottomTwo = [UILabel new];
    bottomTwo.backgroundColor = kMainColor;
    bottomTwo.layer.cornerRadius = 30;
    bottomTwo.layer.shadowColor = [UIColor grayColor].CGColor;
    bottomTwo.layer.shadowOffset = CGSizeMake(0,0);
    bottomTwo.layer.shadowOpacity = 1;
    bottomTwo.textColor = [UIColor whiteColor];
    bottomTwo.textAlignment = NSTextAlignmentCenter;
    bottomTwo.font = [UIFont systemFontOfSize:25 weight:0.5];
    NSString *weather = @"晴天";
    if ([self.model.result.skycon isEqualToString:@"RAIN"]) {
        weather = @"雨天";
    }else if ([self.model.result.skycon isEqualToString:@"CLOUDY"]){
        weather = @"多云";
    }
    bottomTwo.text = [NSString stringWithFormat:@"天气状况:%@",weather];
    [self.view addSubview:bottomTwo];
    [bottomTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.centerY.equalTo(self.view.mas_bottom).offset(-150);
        make.width.equalTo(@((kScreenWidth - 60) / 2));
        make.height.equalTo(@80);
    }];
}

@end
