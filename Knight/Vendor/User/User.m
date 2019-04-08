//
//  User.m
//  Knight
//
//  Created by QiuHao on 2019/4/8.
//  Copyright © 2019年 QiuHao. All rights reserved.
//

#import "User.h"

static User *user_obj = nil;

@implementation User

+ (User *)getInstance {
    
    @synchronized (self) {
        
        if (user_obj == nil) {
            
            user_obj = [[User alloc] init];
            
        }
        
        return user_obj;
        
    }
    
}

- (void)saveWindow:(UIWindow *)window {
    
    user_obj.window = window;
    
}

- (void)initApp {
    
    LoginViewController *vc = [[LoginViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController: vc];
    
    nav.navigationBar.hidden = YES;
    
    user_obj.window.rootViewController = nav;
    
}

+ (void)createNav:(UIViewController *)controller title:(NSString *)title hidden:(NSNumber *)hidden {
    
    Header *header = [[[NSBundle mainBundle] loadNibNamed: @"Header" owner: nil options: nil] lastObject];
    
    if ([hidden isEqual: @(0)]) {
        
        header.backBtn.hidden = NO;
        
    } else {
        
        header.backBtn.hidden = YES;
        
    }
    
    header.title.text = title;
    
    header.frame = CGRectMake(0, 0, kWidth, 50 + SafeTop);
    
    header.backBtnBlock = ^{
        
        [controller.navigationController popViewControllerAnimated: YES];
        
    };
    
    [controller.view addSubview: header];
    
}

@end
