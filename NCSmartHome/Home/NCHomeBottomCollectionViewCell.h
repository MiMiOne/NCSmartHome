//
//  NCHomeBottomCollectionViewCell.h
//  NCSmartHome
//
//  Created by Wiley on 2019/6/3.
//  Copyright © 2019 Wiley. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NCHomeBottomCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *BottomImageView;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UIView *backView;

@end

NS_ASSUME_NONNULL_END
