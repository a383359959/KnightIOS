//
//  Login.m
//  Knight
//
//  Created by QiuHao on 2019/4/8.
//  Copyright © 2019年 QiuHao. All rights reserved.
//

#import "Login.h"

@implementation Login

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
}

- (void)setPassword:(UITextField *)password {
    
    password.secureTextEntry = YES;
    
    _password = password;
    
}

- (void)setSubmitBtn:(UIButton *)submitBtn {
    
    submitBtn.layer.masksToBounds = YES;
    
    submitBtn.layer.cornerRadius = 5;
    
    [submitBtn addTarget: self action: @selector(submitCallback) forControlEvents: UIControlEventTouchUpInside];
    
    _submitBtn = submitBtn;

}

- (void)submitCallback {
    
    QHMessage *message = [QHMessage getInstance];
    
    NSString *username = self.username.text;
    
    NSString *password = self.password.text;
    
    if ([username isEqualToString: @""]) {
        
        [message toast: @"用户名不能为空" view: self];
        
    } else if([password isEqualToString: @""]) {
        
        [message toast: @"密码不能为空" view: self];
        
    } else {
        
        self.submitBlock();
        
    }
    
}

@end
