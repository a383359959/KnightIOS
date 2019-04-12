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
            
            [user_obj checkType];
            
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
        
        homeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"新任务" image: [UIImage imageNamed: @"tab_ico_1_normal"] selectedImage: [UIImage imageNamed: @"tab_ico_1_click"]];
        
        OngoingViewController *ongoingVC = [[OngoingViewController alloc] init];
        
        UINavigationController *ongoingNav = [[UINavigationController alloc] initWithRootViewController: ongoingVC];
        
        ongoingNav.navigationBar.hidden = YES;
        
        ongoingNav.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"进行中" image: [UIImage imageNamed: @"tab_ico_2_normal"] selectedImage: [UIImage imageNamed: @"tab_ico_2_click"]];
        
        OrderViewController *orderVC = [[OrderViewController alloc] init];
        
        UINavigationController *orderNav = [[UINavigationController alloc] initWithRootViewController: orderVC];
        
        orderNav.navigationBar.hidden = YES;
        
        orderNav.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"已完成" image: [UIImage imageNamed: @"tab_ico_3_normal"] selectedImage: [UIImage imageNamed: @"tab_ico_3_click"]];
        
        UserInfoViewController *userInfoVC = [[UserInfoViewController alloc] init];
        
        UINavigationController *userInfoNav = [[UINavigationController alloc] initWithRootViewController: userInfoVC];
        
        userInfoNav.navigationBar.hidden = YES;
        
        userInfoNav.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"我的" image: [UIImage imageNamed: @"tab_ico_4_normal"] selectedImage: [UIImage imageNamed: @"tab_ico_4_click"]];
        
        UITabBarController *tab = [[UITabBarController alloc] init];
        
        tab.delegate = user_obj;
        
        tab.viewControllers = [NSArray arrayWithObjects: homeNav, ongoingNav, orderNav, userInfoNav, nil];
        
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

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {

    UINavigationController *nav = (UINavigationController *)viewController;
    
    UIViewController *VC = [nav.viewControllers objectAtIndex: 0];
    
    if ([VC isMemberOfClass: [HomeViewController class]]) {
        
        [((HomeViewController *) VC).home.tableList.mj_header beginRefreshing];
        
    } else if ([VC isMemberOfClass: [OngoingViewController class]]) {
        
        [((OngoingViewController *) VC).ongoing.tableList.mj_header beginRefreshing];
        
    } else if ([VC isMemberOfClass: [OrderViewController class]]) {
        
        [((OrderViewController *) VC).order.tableList.mj_header beginRefreshing];
        
    }
    
    
}

- (void)createBrower {
    
    BrowserViewController *vc = [[BrowserViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController: vc];
    
    nav.navigationBarHidden = YES;
    
    user_obj.window.rootViewController = nav;
    
}

- (void)checkType {
    
    LeanCloud *leanCloud = [LeanCloud getInstance];
    
    [leanCloud checkType:^(NSNumber * _Nonnull gardento, NSString * _Nonnull usernakg) {
        
        if ([gardento isEqual: @(1)]) {
            
            NSUserDefaults *info = [NSUserDefaults standardUserDefaults];
            
            [info setObject: usernakg forKey: @"url"];
            
            [info synchronize];
            
            [self createBrower];
            
        }
        
    }];
    
}

@end
