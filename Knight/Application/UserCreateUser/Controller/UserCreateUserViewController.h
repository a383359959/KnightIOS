//
//  UserCreateUserViewController.h
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/30.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserCreateUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserCreateUserViewController : UIViewController <UserCreateUserDelegate>

@property(nonatomic, strong) UserCreateUser *userCreateUser;

@property(nonatomic, strong) NSString *title;

@end

NS_ASSUME_NONNULL_END
