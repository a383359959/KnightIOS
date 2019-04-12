//
//  Ongoing.m
//  Knight
//
//  Created by QiuHao on 2019/4/10.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "Ongoing.h"

@implementation Ongoing

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
    
    cell.cancelBlock = ^{
        
        [self showCancelMessage: objectId];
        
    };
    
    cell.successBlock = ^{
        
        [self showSuccessMessage: objectId];
        
    };
    
    [cell reloadLayout: LIST_TYPE_ONGOING_TASK];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 141.5;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *objectId = [[self.dataAry objectAtIndex: indexPath.row] objectForKey: @"objectId"];
    
    self.didSelectBlock(objectId);
    
}

- (void)showCancelMessage:(NSString *)objectId {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"确定取消？" preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *success = [UIAlertAction actionWithTitle: @"是" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        self.submitBlock(objectId, LIST_TYPE_NEW_TASK);
        
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle: @"否" style: UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction: success];
    [alert addAction: cancel];
    
    [self.parentContainerViewController presentViewController: alert animated: YES completion: nil];
    
}

- (void)showSuccessMessage:(NSString *)objectId {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"确定完成？" preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *success = [UIAlertAction actionWithTitle: @"是" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        self.submitBlock(objectId, LIST_TYPE_DONE_TASK);
        
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
