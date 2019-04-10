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
    
    return self.dataAry.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DaiJieDanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"DaiJieDanTableViewCell"];
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed: @"DaiJieDanTableViewCell" owner: nil options: nil] lastObject];
        
    }
    
    NSString *objectId = [[self.dataAry objectAtIndex: indexPath.row] objectForKey: @"objectId"];
    
    cell.start_address.text = [[self.dataAry objectAtIndex: indexPath.row] objectForKey: @"start_address"];
    
    cell.start_distance.text = [[self.dataAry objectAtIndex: indexPath.row] objectForKey: @"start_distance"];
    
    cell.end_address.text = [[self.dataAry objectAtIndex: indexPath.row] objectForKey: @"end_address"];
    
    cell.end_distance.text = [[self.dataAry objectAtIndex: indexPath.row] objectForKey: @"end_distance"];
    
    cell.submitBlock = ^{
      
        [self showMessage: objectId];
        
    };
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 141.5;
    
}

- (void)showMessage:(NSString *)objectId {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"确定接单" preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *success = [UIAlertAction actionWithTitle: @"是" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        self.submitBlock(objectId);
        
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle: @"否" style: UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction: success];
    [alert addAction: cancel];
    
    [self.parentContainerViewController presentViewController: alert animated: YES completion: nil];
    
}

- (void)setNoData:(UIButton *)noData {
    
    [noData addTarget: self action: @selector(noDataCallback) forControlEvents: UIControlEventTouchUpInside];
    
    _noData = noData;
    
}

- (void)noDataCallback {
    
    self.noDataBlock();
    
}

@end
