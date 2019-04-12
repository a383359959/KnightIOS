//
//  UserEditPasswordViewController.m
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/30.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "UserEditPasswordViewController.h"

@interface UserEditPasswordViewController ()

@end

@implementation UserEditPasswordViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = background_color;
    
    [User createNav: self title: @"修改密码" hidden: @(0)];
    
    [self createView];
    
}

- (void)createView {
    
    self.userEditPassword = [[[NSBundle mainBundle] loadNibNamed: @"UserEditPassword" owner: nil options: nil] lastObject];
    
    self.userEditPassword.frame = CGRectMake(0, TopBarHeight, kWidth, kHeight - TopBarHeight);
    
    self.userEditPassword.delegate = self;
    
    [self.view addSubview: self.userEditPassword];
    
}

- (void)backCallback {
    
    [self.navigationController popViewControllerAnimated: YES];
    
}

- (void)submitCallback {
    
    LeanCloud *learnCloud = [LeanCloud getInstance];
    
    NSString *old_password = [self.userEditPassword.options objectForKey: @"old_password"];
    
    NSString *new_password = [self.userEditPassword.options objectForKey: @"new_password"];
    
    [learnCloud updatePassword: old_password new_pasword: new_password view: self.view];
    
}

@end
