//
//  NCHomeViewController.m
//  NCSmartHome
//
//  Created by Wiley on 2019/6/2.
//  Copyright © 2019 Wiley. All rights reserved.
//

#import "NCHomeViewController.h"
#import "NCHomeTopCollectionViewCell.h"
#import "NCHomeBottomCollectionViewCell.h"
@interface NCHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *topCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *bottomCollectionView;

@property(nonatomic,strong)NSArray *TopImageArray;
@property(nonatomic,strong)NSArray *TopTitleArray;
@property(nonatomic,strong)NSArray *BottomTitleArray;

@end

@implementation NCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.topCollectionView registerNib:[UINib nibWithNibName:@"NCHomeTopCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"NCHomeTopCollectionViewCell"];
    [self.bottomCollectionView registerNib:[UINib nibWithNibName:@"NCHomeBottomCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"NCHomeBottomCollectionViewCell"];
    [self creatData];
}
-(void)creatData
{
    self.TopImageArray = @[@"power-button",@"real-estate-1",@"real-estate-3",@"reflecting",@"restauran",@"restroom",@"seatting",@"showers",@"sleepy",@"studying-2"];
    self.TopTitleArray = @[@"家中按钮",@"房屋外观",@"窗帘相关",@"家中镜子",@"家中餐具",@"厕所马桶",@"家中桌椅",@"淋浴相关",@"家中床铺",@"家中书房"];
    self.BottomTitleArray = @[@"起居室的按钮",@"房屋智能节能",@"主卧的窗帘开关",@"主卧洗手间的镜子",@"餐具消毒开关",@"主卧洗手间马桶加热",@"主卧按摩椅开关",@"主卧洗手间热水器开关",@"主卧床铺加热开关",@"书房节能开关"];

}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.topCollectionView) {
        NCHomeTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NCHomeTopCollectionViewCell" forIndexPath:indexPath];
        [cell.itemImageView setImage:[UIImage imageNamed:self.TopImageArray[indexPath.row]]];
        cell.itemLabel.text = self.TopTitleArray[indexPath.row];
        
        return cell;
    }else{
        NCHomeBottomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NCHomeBottomCollectionViewCell" forIndexPath:indexPath];
        [cell.BottomImageView setImage:[UIImage imageNamed:self.TopImageArray[indexPath.row]]];
        cell.bottomLabel.text = self.BottomTitleArray[indexPath.row];
        
        return cell;
    }

}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"暂未检测到祥云家居" message:@"是否前往扫描" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.tabBarController setSelectedIndex:1];
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
