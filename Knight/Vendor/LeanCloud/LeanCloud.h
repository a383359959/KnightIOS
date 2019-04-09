//
//  LeanCloud.h
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/30.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LeanCloud : NSObject

// 返回实例
+ (LeanCloud *)getInstance;

// 登陆
- (void)login:(NSString *)username password:(NSString *)password view:(UIView *)view callback:(void(^)(BOOL status))callback;

@end

NS_ASSUME_NONNULL_END
