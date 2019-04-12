//
//  OrderViewController.h
//  Knight
//
//  Created by QiuHao on 2019/4/9.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Order.h"
#import "OrderDetailViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderViewController : UIViewController

@property(nonatomic, strong) Order *order;

@property(nonatomic, strong) NSNumber *page;

@property(nonatomic, strong) MBProgressHUD *hud;

@end

NS_ASSUME_NONNULL_END
