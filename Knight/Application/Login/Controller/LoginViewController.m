//
//  LoginViewController.m
//  Knight
//
//  Created by QiuHao on 2019/4/8.
//  Copyright © 2019年 QiuHao. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createView];
    
}

- (void)createView {
    
    self.login = [[[NSBundle mainBundle] loadNibNamed: @"Login" owner: nil options: nil] lastObject];
    
    self.login.frame = CGRectMake(0, 0, kWidth, SafeHeight);
    
    kWeakSelf(self);
    
    self.login.submitBlock = ^{
        
        kStrongSelf(self);
        
        [User login: self.login.username.text password: self.login.password.text view: self.view];
        
    };
    
    self.login.regBlock = ^{
        
        kStrongSelf(self);
        
        UserCreateUserViewController *vc = [[UserCreateUserViewController alloc] init];
        
        vc.title = @"注册";
        
        [self.navigationController pushViewController: vc animated: YES];
        
    };
    
    [self.view addSubview: self.login];
    
}

@end
