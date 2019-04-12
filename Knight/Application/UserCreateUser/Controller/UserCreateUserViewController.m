//
//  UserCreateUserViewController.m
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/30.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "UserCreateUserViewController.h"

@interface UserCreateUserViewController ()

@end

@implementation UserCreateUserViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = background_color;
    
    NSString *title = @"创建用户";
    
    if (self.title != nil) {
        
        title = self.title;
        
    }
    
    [User createNav: self title: title hidden: @(0)];
    
    [self createView];
    
}

- (void)createView {
    
    self.userCreateUser = [[[NSBundle mainBundle] loadNibNamed: @"UserCreateUser" owner: nil options: nil] lastObject];
    
    self.userCreateUser.frame = CGRectMake(0, TopBarHeight, kWidth, kHeight - TopBarHeight);
    
    self.userCreateUser.delegate = self;
    
    [self.view addSubview: self.userCreateUser];
    
}

- (void)backCallback {
    
    [self.navigationController popViewControllerAnimated: YES];
    
}

- (void)submitCallback {
    
    NSString *username = [self.userCreateUser.options objectForKey: @"username"];
    
    NSString *password = [self.userCreateUser.options objectForKey: @"password"];
    
    LeanCloud *leanCloud = [LeanCloud getInstance];
    
    QHMessage *message = [QHMessage getInstance];
    
    MBProgressHUD *hud = [message showLoading: self.view];
    
    [leanCloud reg: username password: password successCallback:^{
        
        [hud hideAnimated: YES];
        
        [message toast: @"创建成功" view: self.view];
        
    } errorCallback:^(NSString * _Nonnull msg) {
        
        [hud hideAnimated: YES];
        
        [message toast: msg view: self.view];
        
    }];
    
}

@end
