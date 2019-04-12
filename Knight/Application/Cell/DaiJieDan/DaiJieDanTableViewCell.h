//
//  DaiJieDanTableViewCell.h
//  Knight
//
//  Created by QiuHao on 2019/4/9.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeanCloud.h"

NS_ASSUME_NONNULL_BEGIN

@interface DaiJieDanTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *boxView;

@property (weak, nonatomic) IBOutlet UILabel *start_address;

@property (weak, nonatomic) IBOutlet UILabel *start_distance;

@property (weak, nonatomic) IBOutlet UILabel *end_address;

@property (weak, nonatomic) IBOutlet UILabel *end_distance;

@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

@property (weak, nonatomic) IBOutlet UIButton *successBtn;

@property (weak, nonatomic) IBOutlet UILabel *successLabel;

@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@property(nonatomic, copy) void (^cancelBlock)(void);

@property(nonatomic, copy) void (^successBlock)(void);

@property(nonatomic, copy) void (^submitBlock)(void);

- (void)reloadLayout:(LIST_TYPE)type;

@end

NS_ASSUME_NONNULL_END
