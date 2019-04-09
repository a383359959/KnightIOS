//
//  Home.h
//  Knight
//
//  Created by QiuHao on 2019/4/9.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DaiJieDanTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface Home : UIView <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableList;

@end

NS_ASSUME_NONNULL_END
