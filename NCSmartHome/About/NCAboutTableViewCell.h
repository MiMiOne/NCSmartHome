//
//  NCAboutTableViewCell.h
//  NCSmartHome
//
//  Created by Wiley on 2019/6/3.
//  Copyright © 2019 Wiley. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NCAboutTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewForTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelForTitle;

@end

NS_ASSUME_NONNULL_END
