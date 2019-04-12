//
//  UserLabelTableViewCell.h
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/4/2.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserLabelTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *line;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *value;

@end

NS_ASSUME_NONNULL_END
