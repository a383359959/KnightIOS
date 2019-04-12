//
//  OngoingViewController.h
//  Knight
//
//  Created by QiuHao on 2019/4/10.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ongoing.h"
#import "OrderDetailViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface OngoingViewController : UIViewController

@property(nonatomic, strong) Ongoing *ongoing;

@property(nonatomic, strong) NSNumber *page;

@property(nonatomic, strong) MBProgressHUD *hud;

@end

NS_ASSUME_NONNULL_END
