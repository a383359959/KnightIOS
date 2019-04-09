//
//  Home.m
//  Knight
//
//  Created by QiuHao on 2019/4/9.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "Home.h"

@implementation Home

- (void)setTableList:(UITableView *)tableList {
    
    tableList.delegate = self;
    
    tableList.dataSource = self;
    
    tableList.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIView *footer = [[UIView alloc] initWithFrame: CGRectMake(0, 0, kWidth, 20)];
    
    footer.backgroundColor = background_color;
    
    tableList.tableFooterView = footer;
    
    _tableList = tableList;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DaiJieDanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"DaiJieDanTableViewCell"];
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed: @"DaiJieDanTableViewCell" owner: nil options: nil] lastObject];
        
    }
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 141.5;
    
}

@end
