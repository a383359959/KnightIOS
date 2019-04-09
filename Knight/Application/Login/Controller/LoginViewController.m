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
    
    self.login.submitBlock = ^{
        
        [User login: self.login.username.text password: self.login.password.text view: self.view];
        
    };
    
    [self.view addSubview: self.login];
    
}

@end
