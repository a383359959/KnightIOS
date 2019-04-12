//
//  UserInfo.h
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/29.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserHeaderTableViewCell.h"
#import "UserLineTableViewCell.h"
#import "UserMenuTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UserInfoDelegate <NSObject>

- (void)btnAddTarget:(NSInteger)tag;

@end

@interface UserInfo : UIView <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableList;

// 数据源
@property(nonatomic, strong) NSMutableArray *dataAry;

@property(nonatomic, strong) NSMutableArray *menuList;

@property(nonatomic, strong) NSMutableArray *iconList;

- (float)cacheSize;

@property(nonatomic, strong) id<UserInfoDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
