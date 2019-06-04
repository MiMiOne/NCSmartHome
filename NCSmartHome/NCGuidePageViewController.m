//
//  NCGuidePageViewController.m
//  NCSmartHome
//
//  Created by Wiley on 2019/6/2.
//  Copyright © 2019 Wiley. All rights reserved.
//

#import "NCGuidePageViewController.h"
#import <Masonry.h>
@interface NCGuidePageViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *backScrollView;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)UIPageControl *pageControl;

@end

@implementation NCGuidePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(instancetype)init
{
    self = [super init];
    if (self) {
        _titleArray = @[@"欢迎\n来到祥云之家",@"控制\n房中每个角落",@"实时\n获取最新信息",@"操作\n简单快捷"];
        [self creatUI];
    }
    return self;
}
-(void)creatUI
{
    UIScrollView *backScrollView = [UIScrollView new];
    backScrollView.backgroundColor  =[UIColor whiteColor];
    backScrollView.contentSize = CGSizeMake(kScreenWidth * 4, kScreenWidth);
    backScrollView.delegate = self;
    backScrollView.bounces = YES;
    backScrollView.pagingEnabled = YES;
    self.backScrollView = backScrollView;
    [self.view addSubview:backScrollView];
    [backScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
    }];

    
    for (int i = 0; i < 4; i++) {
        UIView *backView = [UIView new];
        backView.backgroundColor = i==0?kMainColor:[UIColor whiteColor];
        [self.backScrollView addSubview:backView];
        [backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.backScrollView).offset(i*kScreenWidth);
            make.height.width.equalTo(self.backScrollView);
            make.top.equalTo(self.backScrollView);
        }];
        UIImageView *backImageView = [UIImageView new];
        [backImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"GroupHomePage%d",i+1]]];
        backImageView.contentMode = UIViewContentModeScaleAspectFit;
        [backView addSubview:backImageView];
        [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(backView);
            make.width.equalTo(@300);
            make.height.equalTo(@200);
        }];
        UILabel *titleLabel = [UILabel new];
        [titleLabel setFont:[UIFont systemFontOfSize:40 weight:0.5]];
        titleLabel.numberOfLines = 2;
        titleLabel.text = self.titleArray[i];
        titleLabel.textColor = i==0?[UIColor whiteColor]:[UIColor blackColor];
        [backView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(backImageView.mas_left);
            make.top.equalTo(backView).offset(100);
            make.bottom.equalTo(backImageView.mas_top).offset(-50);
            make.right.equalTo(backImageView.mas_right);
        }];
        
        UILabel *describeLabel = [UILabel new];
        [describeLabel setFont:[UIFont systemFontOfSize:12]];
        describeLabel.numberOfLines = 2;
        describeLabel.text = @"欢迎使用祥云之家App，您可以控制您所有的祥云智能家居，享受智能的新时代,体验健康规律的生活方式。";
        describeLabel.textColor = i==0?[UIColor whiteColor]:[UIColor colorWithHexString:@"#C0C0C0"];
        [backView addSubview:describeLabel];
        [describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(backImageView.mas_left);
            make.top.equalTo(backImageView.mas_bottom).offset(50);
            make.right.equalTo(backImageView.mas_right);
        }];
        
        if (i == 3) {
            UIButton *dismissBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [dismissBtn setBackgroundColor:kMainColor];
            [dismissBtn setTitle:@"结束引导" forState:(UIControlStateNormal)];
            dismissBtn.titleLabel.textColor = [UIColor whiteColor];
            dismissBtn.titleLabel.font = [UIFont systemFontOfSize:14];
            dismissBtn.layer.cornerRadius = 10;
            [backView addSubview:dismissBtn];
            [dismissBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(backImageView.mas_left);
                make.right.equalTo(backImageView.mas_right);
                make.centerX.equalTo(backView.mas_centerX);
                make.height.equalTo(@50);
                make.top.equalTo(describeLabel.mas_bottom).offset(50);
            }];
            [dismissBtn addTarget:self action:@selector(dismissBtnClick) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    UIPageControl *pageController = [[UIPageControl alloc]init];
    pageController.numberOfPages = 4;
    [pageController setValue:[UIImage imageNamed:@"OvalPage"] forKeyPath:@"_pageImage"];
    [pageController setValue:[UIImage imageNamed:@"OvalCurrentPage"] forKeyPath:@"_currentPageImage"];
    self.pageControl = pageController;
    [self.view addSubview:pageController];
    [self.view bringSubviewToFront:pageController];
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.view.mas_bottom).offset(-30);
        make.width.equalTo(@100);
    }];
}

-(void)dismissBtnClick
{
    if (self.ClickLastButtonBlock) {
        self.ClickLastButtonBlock();
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/kScreenWidth;
    [self.pageControl setCurrentPage:index];
}
@end
