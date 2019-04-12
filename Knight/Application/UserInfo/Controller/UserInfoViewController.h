//
//  UserInfoViewController.h
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/29.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfo.h"
#import "UserEditPasswordViewController.h"
#import "UserCreateUserViewController.h"
#import "AboutViewController.h"
#import "UserMenuTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UserInfoViewControllerDelegate <NSObject>

- (void)logout;

@end

@interface UserInfoViewController : UIViewController <UserInfoDelegate>

@property(nonatomic, strong) UserInfo *userInfo;

@property(nonatomic, strong) id<UserInfoViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
