//
//  QHMessage.h
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/31.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface QHMessage : NSObject

+ (QHMessage *)getInstance;

- (void)toast:(NSString *)msg view:(UIView *)view;

- (MBProgressHUD *)showLoading:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
