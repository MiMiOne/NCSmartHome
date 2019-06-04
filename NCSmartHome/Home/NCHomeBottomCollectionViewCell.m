//
//  NCHomeBottomCollectionViewCell.m
//  NCSmartHome
//
//  Created by Wiley on 2019/6/3.
//  Copyright © 2019 Wiley. All rights reserved.
//

#import "NCHomeBottomCollectionViewCell.h"

@implementation NCHomeBottomCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.backView.layer.shadowOffset = CGSizeMake(0,0);
    self.backView.layer.shadowOpacity = 1;
    
}

@end
