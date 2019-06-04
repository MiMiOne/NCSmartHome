//
//  NCRoomsViewController.m
//  NCSmartHome
//
//  Created by Wiley on 2019/6/2.
//  Copyright © 2019 Wiley. All rights reserved.
//

#import "NCRoomsViewController.h"
#import <FLAnimatedImageView.h>
#import <FLAnimatedImage.h>
#import <Masonry.h>
#import "NCBluetoothModule.h"
@interface NCRoomsViewController ()<NCBluetoothModuleDelegate>
@property (weak, nonatomic) IBOutlet UILabel *backTitle;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;

@property(nonatomic,strong)FLAnimatedImageView *gifImageView;
@property(nonatomic,strong)UILabel *titleLabel;
@property (nonatomic, strong) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIButton *scanfButton;

@end

@implementation NCRoomsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gifImageView = [[FLAnimatedImageView alloc]init];
    [self.view addSubview:self.gifImageView];
    
    self.titleLabel = [UILabel new];
    [self.view addSubview:self.titleLabel];
    [NCBluetoothModule shareNCBluetoothModule].delegate = self;
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"暂未连接祥云家居" message:@"是否开始扫描" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        self.backImageView.hidden = NO;
        self.backTitle.hidden = NO;
        self.scanfButton.hidden = NO;
        [[NCBluetoothModule shareNCBluetoothModule]stopScanPeripheral];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.backImageView.hidden = YES;
        self.backTitle.hidden = YES;
        self.scanfButton.hidden = YES;
        [self creatUI];
        
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
    
}
- (IBAction)scanfClick:(UIButton *)sender {
    self.backImageView.hidden = YES;
    self.backTitle.hidden = YES;
    sender.hidden = YES;
    self.gifImageView.hidden = NO;
    self.titleLabel.hidden = NO;
    [self creatUI];
}
-(void)creatUI{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"scanf" ofType:@"gif"];
    self.gifImageView.animatedImage = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfFile:filePath]];
    [self.gifImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.equalTo(@200);
    }];
    
    self.titleLabel.text = @"正在扫描祥云智能家居...";
    self.titleLabel.textColor = [UIColor lightGrayColor];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.gifImageView.mas_bottom).offset(10);
        make.centerX.equalTo(self.gifImageView.mas_centerX);
        make.height.equalTo(@20);
    }];
    
    [[NCBluetoothModule shareNCBluetoothModule]blueToothScanf];
    self.timer = [NSTimer timerWithTimeInterval:5.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];

}
-(void)timerRun{
    if ([self.timer isValid]) {
        [self.timer invalidate];
        self.timer = nil;
    }
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"暂未检测到祥云家居" message:@"是否重新扫描" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        self.backImageView.hidden = NO;
        self.backTitle.hidden = NO;
        self.scanfButton.hidden = NO;
        self.gifImageView.hidden = YES;
        self.titleLabel.hidden = YES;
        [[NCBluetoothModule shareNCBluetoothModule]stopScanPeripheral];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.backImageView.hidden = YES;
        self.backTitle.hidden = YES;
        self.scanfButton.hidden = YES;
        [self creatUI];
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
