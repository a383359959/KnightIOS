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
    
    if ([self isLogin] == YES) {
        
        HomeViewController *homeVC = [[HomeViewController alloc] init];
        
        UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController: homeVC];
        
        homeNav.navigationBar.hidden = YES;
        
        homeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"新任务" image: nil selectedImage: nil];
        
        OrderViewController *orderVC = [[OrderViewController alloc] init];
        
        UINavigationController *orderNav = [[UINavigationController alloc] initWithRootViewController: orderVC];
        
        orderNav.navigationBar.hidden = YES;
        
        orderNav.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"已完成" image: nil selectedImage: nil];
        
        UserInfoViewController *userInfoVC = [[UserInfoViewController alloc] init];
        
        UINavigationController *userInfoNav = [[UINavigationController alloc] initWithRootViewController: userInfoVC];
        
        userInfoNav.navigationBar.hidden = YES;
        
        userInfoNav.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"我的" image: nil selectedImage: nil];
        
        UITabBarController *tab = [[UITabBarController alloc] init];
        
        tab.viewControllers = [NSArray arrayWithObjects: homeNav, orderNav, userInfoNav, nil];
        
        user_obj.window.rootViewController = tab;
        
    } else {
        
        LoginViewController *vc = [[LoginViewController alloc] init];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController: vc];
        
        nav.navigationBar.hidden = YES;
        
        user_obj.window.rootViewController = nav;
        
    }
    
}

+ (void)createNav:(UIViewController *)controller title:(NSString *)title hidden:(NSNumber *)hidden {
    
    Header *header = [[[NSBundle mainBundle] loadNibNamed: @"Header" owner: nil options: nil] lastObject];
    
    if ([hidden isEqual: @(0)]) {
        
        header.backBtn.hidden = NO;
        
    } else {
        
        header.backBtn.hidden = YES;
        
    }
    
    header.title.text = title;
    
    header.frame = CGRectMake(0, 0, kWidth, TopBarHeight);
    
    header.backBtnBlock = ^{
        
        [controller.navigationController popViewControllerAnimated: YES];
        
    };
    
    [controller.view addSubview: header];
    
}

- (BOOL)isLogin {
    
    BOOL status = NO;
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    NSString *username = [user objectForKey: @"username"];
    
    NSString *password = [user objectForKey: @"password"];
    
    if (username && password) {
        
        status = YES;
        
    }
    
    return status;
    
}

+ (void)login:(NSString *)username password:(NSString *)password view:(UIView *)view {
    
    LeanCloud *leanCloud = [LeanCloud getInstance];
    
    [leanCloud login: username password: password view: view callback:^(BOOL status) {
       
        if (status == YES) {
            
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            
            [user setObject: username forKey: @"username"];
            
            [user setObject: password forKey: @"password"];
            
            [user synchronize];
            
            [user_obj initApp];
            
        }
        
    }];
    
}

@end
