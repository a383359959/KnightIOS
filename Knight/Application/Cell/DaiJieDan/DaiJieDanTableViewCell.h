//
//  DaiJieDanTableViewCell.h
//  Knight
//
//  Created by QiuHao on 2019/4/9.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DaiJieDanTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *boxView;

@property (weak, nonatomic) IBOutlet UILabel *start_address;

@property (weak, nonatomic) IBOutlet UILabel *start_distance;

@property (weak, nonatomic) IBOutlet UILabel *end_address;

@property (weak, nonatomic) IBOutlet UILabel *end_distance;

@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@property(nonatomic, copy) void (^submitBlock)(void);

@end

NS_ASSUME_NONNULL_END
