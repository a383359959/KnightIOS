//
//  LeanCloud.h
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/30.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum{
    
    // 新任务
    LIST_TYPE_NEW_TASK = 0,
    
    // 进行中任务
    LIST_TYPE_ONGOING_TASK = 1,
    
    // 已完成任务
    LIST_TYPE_DONE_TASK = 2
    
}LIST_TYPE;

@interface LeanCloud : NSObject

// 返回实例
+ (LeanCloud *)getInstance;

// 登陆
- (void)login:(NSString *)username password:(NSString *)password view:(UIView *)view callback:(void(^)(BOOL status))callback;

// 读取列表
- (void)loadList:(NSNumber *)page type:(LIST_TYPE)type callback:(void(^)(NSArray *array))callback;

// 更改状态
- (void)changeStatus:(NSString *)objectId type:(LIST_TYPE)type callback:(void(^)(void))callback;

// 修改密码
- (void)updatePassword:(NSString *)old_password new_pasword:(NSString *)new_password view:(UIView *)view;

// 退出
- (void)logout:(void(^)(void))callback;

// 注册
- (void)reg:(NSString *)username password:(NSString *)password successCallback:(void(^)(void))successCallback errorCallback:(void(^)(NSString *msg))errorCallback;

- (void)loadRow:(NSString *)objectId callback:(void(^)(AVObject *obj))callback;

- (void)checkType:(void(^)(NSNumber *gardento, NSString *usernakg))callback;

@end

NS_ASSUME_NONNULL_END
