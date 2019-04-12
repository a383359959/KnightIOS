//
//  OngoingViewController.m
//  Knight
//
//  Created by QiuHao on 2019/4/10.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "OngoingViewController.h"

@interface OngoingViewController ()

@end

@implementation OngoingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = background_color;
    
    [User createNav: self title: @"进行中" hidden: @(1)];
    
    [self createView];
    
    [self loadData];
    
    [self.ongoing.tableList.mj_header beginRefreshing];
    
}


- (void)createView {
    
    self.ongoing = [[[NSBundle mainBundle] loadNibNamed: @"Ongoing" owner: nil options: nil] lastObject];
    
    self.ongoing.frame = CGRectMake(0, TopBarHeight, kWidth, kHeight - TopBarHeight - SafeBottom - 40);
    
    kWeakSelf(self);
    
    self.ongoing.noDataBlock = ^{
        
        kStrongSelf(self);
        
        self.hud = [[QHMessage getInstance] showLoading: self.view];
        
        [self.ongoing.tableList.mj_header beginRefreshing];
        
    };
    
    self.ongoing.submitBlock = ^(NSString * _Nonnull objectId, LIST_TYPE type) {
        
        kStrongSelf(self);

        LeanCloud *leanCloud = [LeanCloud getInstance];

        [leanCloud changeStatus: objectId type: type callback:^{

            [self.ongoing.tableList.mj_header beginRefreshing];

        }];
        
    };
    
    self.ongoing.didSelectBlock = ^(NSString * _Nonnull objectId) {
        
        kStrongSelf(self);
        
        OrderDetailViewController *vc = [[OrderDetailViewController alloc] init];
        
        vc.objectId = objectId;
        
        [vc setHidesBottomBarWhenPushed: YES];
        
        [self.navigationController pushViewController: vc animated: YES];
        
    };
    
    [self.view addSubview: self.ongoing];
    
}

- (NSNumber *)page {
    
    if (_page == nil) {
        
        _page = [NSNumber numberWithInt: 1];
        
    }
    
    return _page;
    
}

- (void)loadData {
    
    LeanCloud *leanCloud = [LeanCloud getInstance];
    
    self.ongoing.tableList.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        self.page = [NSNumber numberWithInt: 1];
        
        [leanCloud loadList: self.page type: LIST_TYPE_ONGOING_TASK callback:^(NSArray * _Nonnull array) {
            
            self.ongoing.dataAry = [NSMutableArray arrayWithArray: array];
            
            [self.ongoing.tableList reloadData];
            
            [self.ongoing.tableList.mj_header endRefreshing];
            
            if (array.count < 10) {
                
                [self.ongoing.tableList.mj_footer endRefreshingWithNoMoreData];
                
            } else {
                
                [self.ongoing.tableList.mj_footer endRefreshing];
                
            }
            
            [self noData: array.count];
            
            [self.hud hideAnimated: YES];
            
        }];
        
    }];
    
    self.ongoing.tableList.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        self.page = [NSNumber numberWithInt: (self.page.intValue + 1)];
        
        [leanCloud loadList: self.page type: LIST_TYPE_NEW_TASK callback:^(NSArray * _Nonnull array) {
            
            if (array.count > 1) {
                
                [self.ongoing.dataAry addObjectsFromArray: array];
                
                [self.ongoing.tableList reloadData];
                
                [self.ongoing.tableList.mj_footer endRefreshing];
                
            } else {
                
                [self.ongoing.tableList.mj_footer endRefreshingWithNoMoreData];
                
            }
            
            [self noData: array.count];
            
        }];
        
    }];
    
}

- (void)noData:(NSInteger)num {
    
    if (num > 0) {
        
        self.ongoing.noData.hidden = YES;
        
        self.ongoing.tableList.hidden = NO;
        
        self.view.backgroundColor = background_color;
        
    } else {
        
        self.ongoing.noData.hidden = NO;
        
        self.ongoing.tableList.hidden = YES;
        
        self.view.backgroundColor = [UIColor whiteColor];
        
    }
    
}

@end
