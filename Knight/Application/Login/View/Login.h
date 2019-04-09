//
//  Login.h
//  Knight
//
//  Created by QiuHao on 2019/4/8.
//  Copyright © 2019年 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

NS_ASSUME_NONNULL_BEGIN

@interface Login : UIView

@property (weak, nonatomic) IBOutlet UITextField *username;

@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UIButton *forgetBtn;

@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@property (weak, nonatomic) IBOutlet UIButton *regBtn;

@property(nonatomic, copy) void(^submitBlock)(void);

@end

NS_ASSUME_NONNULL_END
