//
//  OrderDetailViewController.m
//  Knight
//
//  Created by QiuHao on 2019/4/12.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "OrderDetailViewController.h"

@interface OrderDetailViewController ()

@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self createView];
    
    [User createNav: self title: @"订单详情" hidden: @(0)];
    
    self.view.backgroundColor = background_color;
    
    [self loadData];
    
}

- (void)createView {
    
    self.orderDetail = [[[NSBundle mainBundle] loadNibNamed: @"OrderDetail" owner: nil options: nil] lastObject];
    
    self.orderDetail.frame = CGRectMake(0, TopBarHeight, kWidth, kHeight - TopBarHeight - 40);
    
    [self.view addSubview: self.orderDetail];
    
}

- (void)loadData {
    
    LeanCloud *leanCloud = [LeanCloud getInstance];
    
    QHMessage *message = [QHMessage getInstance];
    
    MBProgressHUD *hud = [message showLoading: self.view];
    
    [leanCloud loadRow: self.objectId callback:^(AVObject * _Nonnull obj) {
       
        NSDateFormatter *date = [[NSDateFormatter alloc] init];
        date.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        
        self.orderDetail.orderNum.text = [NSString stringWithFormat: @"运单号：%@", [obj objectForKey: @"orderNum"]];
        self.orderDetail.start_address.text = [obj objectForKey: @"start_address"];
        self.orderDetail.end_address.text = [obj objectForKey: @"end_address"];
        self.orderDetail.shangjia_price.text = [NSString stringWithFormat: @"¥ %@", [obj objectForKey: @"shangjia_price"]];
        self.orderDetail.zaixian_price.text = [NSString stringWithFormat: @"¥ %@", [obj objectForKey: @"zaixian_price"]];
        self.orderDetail.pingtai_price.text = [NSString stringWithFormat: @"¥ %@", [obj objectForKey: @"pingtai_price"]];
        self.orderDetail.bendan_price.text = [NSString stringWithFormat: @"¥ %@", [obj objectForKey: @"bendan_price"]];
        self.orderDetail.createdAt.text = [date stringFromDate: [obj objectForKey: @"createdAt"]];
        self.orderDetail.updatedAt.text = [date stringFromDate: [obj objectForKey: @"updatedAt"]];
        
        [hud hideAnimated: YES];
        
    }];
    
}

@end
