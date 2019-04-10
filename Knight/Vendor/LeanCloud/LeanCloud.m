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

@end
