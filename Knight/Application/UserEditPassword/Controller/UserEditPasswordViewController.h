//
//  UserEditPasswordViewController.h
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/30.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserEditPassword.h"
#import "LeanCloud.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UserEditPasswordViewControllerDelegate <NSObject>

- (void)editPasswordCallback;

@end

@interface UserEditPasswordViewController : UIViewController <UserEditPasswordDelegate>

@property(nonatomic, strong) UserEditPassword *userEditPassword;

@property(nonatomic, strong) id<UserEditPasswordViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
