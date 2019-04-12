//
//  UserMenuTableViewCell.h
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/29.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserMenuTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *line;

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (weak, nonatomic) IBOutlet UILabel *sub_title;

@end

NS_ASSUME_NONNULL_END
