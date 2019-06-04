//
//  NCAboutViewController.m
//  NCSmartHome
//
//  Created by Wiley on 2019/6/2.
//  Copyright © 2019 Wiley. All rights reserved.
//

#import "NCAboutViewController.h"
#import "NCAboutTableViewCell.h"
#import <WebKit/WebKit.h>
#import "NCHelpViewController.h"
@interface NCAboutViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray *imageArray;
@property(nonatomic,strong)NSArray *titleArray;

@end

@implementation NCAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"NCAboutTableViewCell" bundle:nil] forCellReuseIdentifier:@"NCAboutTableViewCell"];
    self.imageArray = @[@"bolt-outline-16system",@"bulb-61-outline-16redBulb",@"GroupredHome",@"lamp-outline-16redLight"];
    self.titleArray = @[@"设置",@"帮助",@"室外",@"室内"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NCAboutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NCAboutTableViewCell" forIndexPath:indexPath];
    cell.imageViewForTitle.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    cell.labelForTitle.text = self.titleArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row == 1) {
        NCHelpViewController *vc = [NCHelpViewController getViewControllerWithName:@"NCHelpViewController" forStoryboard:@"About"];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请先连接祥云家居" message:@"是否前往扫描" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.tabBarController setSelectedIndex:1];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
@end
