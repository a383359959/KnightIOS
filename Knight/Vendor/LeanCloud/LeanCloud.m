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

@end
