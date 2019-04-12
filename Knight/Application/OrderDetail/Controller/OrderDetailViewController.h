//
//  OrderDetailViewController.h
//  Knight
//
//  Created by QiuHao on 2019/4/12.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderDetail.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderDetailViewController : UIViewController

@property(nonatomic, strong) OrderDetail *orderDetail;

@property(nonatomic, strong) NSString *objectId;

@end

NS_ASSUME_NONNULL_END
