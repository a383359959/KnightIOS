//
//  UserCreateUser.h
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/30.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInputTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UserCreateUserDelegate <NSObject>

- (void)backCallback;

- (void)submitCallback;

@end

@interface UserCreateUser : UIView <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backTop;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleTop;

@property (weak, nonatomic) IBOutlet UIButton *backBtn;

@property (weak, nonatomic) IBOutlet UITableView *tableList;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableListHeight;

@property(nonatomic, strong) NSMutableArray *dataAry;

@property(nonatomic, strong) NSMutableDictionary *options;

@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@property(nonatomic, strong) id<UserCreateUserDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
