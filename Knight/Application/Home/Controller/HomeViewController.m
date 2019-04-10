//
//  HomeViewController.m
//  Knight
//
//  Created by QiuHao on 2019/4/9.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = background_color;
    
    [User createNav: self title: @"新任务" hidden: @(1)];
    
    [self createView];
    
    [self loadData];
    
    [self.home.tableList.mj_header beginRefreshing];
    
}

- (void)createView {
    
    self.home = [[[NSBundle mainBundle] loadNibNamed: @"Home" owner: nil options: nil] lastObject];
    
    self.home.frame = CGRectMake(0, TopBarHeight, kWidth, kHeight - TopBarHeight - SafeBottom - 40);
    
    kWeakSelf(self);
    
    self.home.noDataBlock = ^{
        
        kStrongSelf(self);
        
        self.hud = [[QHMessage getInstance] showLoading: self.view];
        
        [self.home.tableList.mj_header beginRefreshing];
        
    };
    
    self.home.submitBlock = ^(NSString * _Nonnull objectId) {
     
        kStrongSelf(self);
        
        LeanCloud *leanCloud = [LeanCloud getInstance];
        
        [leanCloud changeStatus: objectId type: LIST_TYPE_ONGOING_TASK callback:^{
            
            [self.home.tableList.mj_header beginRefreshing];
            
        }];
        
    };
    
    [self.view addSubview: self.home];
    
}

- (NSNumber *)page {
    
    if (_page == nil) {
        
        _page = [NSNumber numberWithInt: 1];
        
    }
    
    return _page;
    
}

- (void)loadData {
    
    LeanCloud *leanCloud = [LeanCloud getInstance];
    
    self.home.tableList.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       
        self.page = [NSNumber numberWithInt: 1];
        
        [leanCloud loadList: self.page type: LIST_TYPE_NEW_TASK callback:^(NSArray * _Nonnull array) {
            
            self.home.dataAry = [NSMutableArray arrayWithArray: array];
            
            [self.home.tableList reloadData];
            
            [self.home.tableList.mj_header endRefreshing];
            
            if (array.count < 10) {
                
                [self.home.tableList.mj_footer endRefreshingWithNoMoreData];
                
            } else {
                
                [self.home.tableList.mj_footer endRefreshing];
                
            }
            
            [self noData: array.count];
            
            [self.hud hideAnimated: YES];
            
        }];
        
    }];
    
    self.home.tableList.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
       
        self.page = [NSNumber numberWithInt: (self.page.intValue + 1)];
        
        [leanCloud loadList: self.page type: LIST_TYPE_NEW_TASK callback:^(NSArray * _Nonnull array) {
            
            if (array.count > 1) {
                
                [self.home.dataAry addObjectsFromArray: array];
                
                [self.home.tableList reloadData];
                
                [self.home.tableList.mj_footer endRefreshing];
                
            } else {
                
                [self.home.tableList.mj_footer endRefreshingWithNoMoreData];
                
            }
            
            [self noData: array.count];
            
        }];
        
    }];
    
}

- (void)noData:(NSInteger)num {
    
    if (num <= 10) {
        
        self.home.noData.hidden = YES;
        
        self.home.tableList.hidden = NO;
        
        self.view.backgroundColor = background_color;
        
    } else {
        
        self.home.noData.hidden = NO;
        
        self.home.tableList.hidden = YES;
        
        self.view.backgroundColor = [UIColor whiteColor];
        
    }
    
}

@end
