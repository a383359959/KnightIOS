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
    
    self.view.backgroundColor = [UIColor redColor];
    
    [User createNav: self title: @"首页" hidden: @(1)];
    
    [self createView];
    
}

- (void)createView {
    
    self.login = [[[NSBundle mainBundle] loadNibNamed: @"Login" owner: nil options: nil] lastObject];
    
    self.login.frame = CGRectMake(0, TopBarHeight, kWidth, SafeHeight);
    
    [self.view addSubview: self.login];
    
}

@end
