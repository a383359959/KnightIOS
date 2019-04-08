//
//  User.h
//  Knight
//
//  Created by QiuHao on 2019/4/8.
//  Copyright © 2019年 QiuHao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Header.h"
#import "LoginViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property(nonatomic, strong) UIWindow *window;

+ (User *)getInstance;

- (void)saveWindow:(UIWindow *)window;

- (void)initApp;

+ (void)createNav:(UIViewController *)controller title:(NSString *)title hidden:(NSNumber *)hidden;

@end

NS_ASSUME_NONNULL_END
