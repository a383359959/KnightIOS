//
//  OrderViewController.m
//  Knight
//
//  Created by QiuHao on 2019/4/9.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "OrderViewController.h"

@interface OrderViewController ()

@end

@implementation OrderViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = background_color;
    
    [User createNav: self title: @"已完成" hidden: @(1)];
    
    [self createView];
    
    [self loadData];
    
    [self.order.tableList.mj_header beginRefreshing];
    
}


- (void)createView {
    
    self.order = [[[NSBundle mainBundle] loadNibNamed: @"Order" owner: nil options: nil] lastObject];
    
    self.order.frame = CGRectMake(0, TopBarHeight, kWidth, kHeight - TopBarHeight - SafeBottom - 40);
    
    kWeakSelf(self);
    
    self.order.noDataBlock = ^{
        
        kStrongSelf(self);
        
        self.hud = [[QHMessage getInstance] showLoading: self.view];
        
        [self.order.tableList.mj_header beginRefreshing];
        
    };
    
    self.order.submitBlock = ^(NSString * _Nonnull objectId, LIST_TYPE type) {
        
        kStrongSelf(self);
        
        LeanCloud *leanCloud = [LeanCloud getInstance];
        
        [leanCloud changeStatus: objectId type: type callback:^{
            
            [self.order.tableList.mj_header beginRefreshing];
            
        }];
        
    };
    
    self.order.didSelectBlock = ^(NSString * _Nonnull objectId) {
        
        kStrongSelf(self);
        
        OrderDetailViewController *vc = [[OrderDetailViewController alloc] init];
        
        vc.objectId = objectId;
        
        [vc setHidesBottomBarWhenPushed: YES];
        
        [self.navigationController pushViewController: vc animated: YES];
        
    };
    
    [self.view addSubview: self.order];
    
}

- (NSNumber *)page {
    
    if (_page == nil) {
        
        _page = [NSNumber numberWithInt: 1];
        
    }
    
    return _page;
    
}

- (void)loadData {
    
    LeanCloud *leanCloud = [LeanCloud getInstance];
    
    self.order.tableList.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        self.page = [NSNumber numberWithInt: 1];
        
        [leanCloud loadList: self.page type: LIST_TYPE_DONE_TASK callback:^(NSArray * _Nonnull array) {
            
            self.order.dataAry = [NSMutableArray arrayWithArray: array];
            
            [self.order.tableList reloadData];
            
            [self.order.tableList.mj_header endRefreshing];
            
            if (array.count < 10) {
                
                [self.order.tableList.mj_footer endRefreshingWithNoMoreData];
                
            } else {
                
                [self.order.tableList.mj_footer endRefreshing];
                
            }
            
            [self noData: array.count];
            
            [self.hud hideAnimated: YES];
            
        }];
        
    }];
    
    self.order.tableList.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        self.page = [NSNumber numberWithInt: (self.page.intValue + 1)];
        
        [leanCloud loadList: self.page type: LIST_TYPE_NEW_TASK callback:^(NSArray * _Nonnull array) {
            
            if (array.count > 1) {
                
                [self.order.dataAry addObjectsFromArray: array];
                
                [self.order.tableList reloadData];
                
                [self.order.tableList.mj_footer endRefreshing];
                
            } else {
                
                [self.order.tableList.mj_footer endRefreshingWithNoMoreData];
                
            }
            
            [self noData: array.count];
            
        }];
        
    }];
    
}

- (void)noData:(NSInteger)num {
    
    if (num > 0) {
        
        self.order.noData.hidden = YES;
        
        self.order.tableList.hidden = NO;
        
        self.view.backgroundColor = background_color;
        
    } else {
        
        self.order.noData.hidden = NO;
        
        self.order.tableList.hidden = YES;
        
        self.view.backgroundColor = [UIColor whiteColor];
        
    }
    
}

@end
