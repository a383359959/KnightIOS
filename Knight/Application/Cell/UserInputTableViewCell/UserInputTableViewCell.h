//
//  UserInputTableViewCell.h
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/30.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInputTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *line;

@property (weak, nonatomic) IBOutlet UITextField *title;

@end

NS_ASSUME_NONNULL_END
