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

@property (weak, nonatomic) IBOutlet UIButton *noData;

@property (weak, nonatomic) IBOutlet UITableView *tableList;

@property(nonatomic, strong) NSMutableArray *dataAry;

@property(nonatomic, copy) void(^submitBlock)(NSString *objectId);

@property(nonatomic, copy) void(^noDataBlock)(void);

@property(nonatomic, copy) void(^didSelectBlock)(NSString *objectId);

@end

NS_ASSUME_NONNULL_END
