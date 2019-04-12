//
//  BtnLayout.h
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/28.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BtnLayout : NSObject

// 获取单例对象
+ (BtnLayout *) getInstance;

// 按钮宽
@property(nonatomic, strong) NSNumber *btnWidth;

// 按钮高
@property(nonatomic, strong) NSNumber *btnHeight;

// 容器宽
@property(nonatomic, strong) NSNumber *boxWidth;

// 容器高
@property(nonatomic, strong) NSNumber *boxHeight;

// 按钮对象
@property(nonatomic, strong) NSMutableArray *dataAry;

// 布局
- (void)setLayout;

@end

NS_ASSUME_NONNULL_END
