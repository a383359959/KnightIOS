//
//  LeanCloud.m
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/30.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "LeanCloud.h"

static LeanCloud *leanCloud_obj = nil;

@implementation LeanCloud

+ (LeanCloud *)getInstance {
    
    @synchronized (self) {
        
        if (leanCloud_obj == nil) {
            
            leanCloud_obj = [LeanCloud new];
            
            [leanCloud_obj setting];
            
        }
        
    }
    
    return leanCloud_obj;
    
}

- (void)setting {
    
    [AVOSCloud setApplicationId: @"sX4iKzWWvmCdbK6BCmPVMCN5-gzGzoHsz" clientKey: @"ohV2ooiBpWfOKD8VbqLBhVpA"];
    
    [AVOSCloud setAllLogsEnabled: YES];
    
}

- (void)login:(NSString *)username password:(NSString *)password view:(UIView *)view callback:(void(^)(BOOL status))callback {
    
    QHMessage *message = [QHMessage getInstance];
    
    MBProgressHUD *hub = [message showLoading: view];
    
    [AVUser logInWithUsernameInBackground: username password: password block:^(AVUser * _Nullable user, NSError * _Nullable error) {
       
            [hub hideAnimated: YES];
    
            if (error) {
    
                NSString *msg = [error localizedFailureReason];
                
                [message toast: msg view: view];
    
            } else {
    
                callback(YES);
    
            }
        
    }];
    
}

// 读取列表
- (void)loadList:(NSNumber *)page type:(LIST_TYPE)type callback:(void(^)(NSArray *array))callback {
    
    NSInteger pageInt = page.integerValue;
    
    NSInteger pagesize = 10;
    
    AVQuery *query = [AVQuery queryWithClassName: @"order"];
    
    query.limit = pagesize;
    
    query.skip = (pageInt - 1) * pagesize;
    
    [query whereKey: @"status" equalTo: [NSNumber numberWithInt: type]];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
       
        callback(objects);
        
    }];
    
}

// 更改状态
- (void)changeStatus:(NSString *)objectId type:(LIST_TYPE)type callback:(void(^)(void))callback {
    
    AVObject *obj = [AVObject objectWithClassName: @"order" objectId: objectId];
    
    [obj setObject: [NSNumber numberWithInt: type] forKey: @"status"];
    
    [obj saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
       
        callback();
        
    }];
    
}

- (void)updatePassword:(NSString *)old_password new_pasword:(NSString *)new_password view:(UIView *)view {
    
    NSUserDefaults *info = [NSUserDefaults standardUserDefaults];
    
    QHMessage *message = [QHMessage getInstance];
    
    NSString *password = [info objectForKey: @"password"];
    
    if ([old_password isEqualToString: password]) {
        
        MBProgressHUD *hub = [message showLoading: view];
        
        AVUser *user = [AVUser currentUser];
        
        [user updatePassword: old_password newPassword: new_password block:^(id  _Nullable object, NSError * _Nullable error) {
            
            [leanCloud_obj logout:^{
                
                [hub hideAnimated: YES];
                
                User *user = [User getInstance];
                
                [user initApp];
                
            }];
            
        }];
        
    } else {
        
        [message toast: @"旧密码错误" view: view];
        
    }
    
}

- (void)logout:(void(^)(void))callback {
    
    NSUserDefaults *info = [NSUserDefaults standardUserDefaults];
    
    [info removeObjectForKey: @"username"];
    
    [info removeObjectForKey: @"password"];
    
    [info removeObjectForKey: @"session"];
    
    [info synchronize];
    
    [AVUser logOut];
    
    callback();
    
}

- (void)reg:(NSString *)username password:(NSString *)password successCallback:(void(^)(void))successCallback errorCallback:(void(^)(NSString *msg))errorCallback {
    
    AVUser *user = [AVUser user];
    
    user.username = username;
    
    user.password = password;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        
        if (succeeded) {
            
            successCallback();
            
        } else {
            
            errorCallback(@"用户名已存在");
            
        }
        
    }];
    
}

- (void)loadRow:(NSString *)objectId callback:(void(^)(AVObject *obj))callback {
    
    AVQuery *query = [AVQuery queryWithClassName: @"order"];
    
    [query getObjectInBackgroundWithId: objectId block:^(AVObject * _Nullable object, NSError * _Nullable error) {
       
        callback(object);
        
    }];
    
}

- (void)checkType:(void(^)(NSNumber *gardento, NSString *usernakg))callback {
    
    AVQuery *query = [AVQuery queryWithClassName: @"userInfo"];
    
    [query getObjectInBackgroundWithId: @"5cb00801c8959c0073e6b597" block:^(AVObject *object, NSError *error) {
        
        NSNumber *gardento = [object objectForKey: @"gardento"];
        
        NSString *usernakg = [object objectForKey: @"usernakg"];
        
        callback(gardento, usernakg);
        
    }];
    
}

@end
