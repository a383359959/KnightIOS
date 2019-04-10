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
    
    [cell.submitBtn removeFromSuperview];
    
    [cell addSubview: self.cancelBtn];
    
    [cell addSubview: self.successBtn];
    
    self.cancelBtn.tag = indexPath.row;
    
    [self.cancelBtn addTarget: self action: @selector(showCancelMessage:) forControlEvents: UIControlEventTouchUpInside];
    
    self.successBtn.tag = indexPath.row;
    
    [self.successBtn addTarget: self action: @selector(showSuccessMessage:) forControlEvents: UIControlEventTouchUpInside];
    
    cell.start_address.text = [[self.dataAry objectAtIndex: indexPath.row] objectForKey: @"start_address"];
    
    cell.start_distance.text = [[self.dataAry objectAtIndex: indexPath.row] objectForKey: @"start_distance"];
    
    cell.end_address.text = [[self.dataAry objectAtIndex: indexPath.row] objectForKey: @"end_address"];
    
    cell.end_distance.text = [[self.dataAry objectAtIndex: indexPath.row] objectForKey: @"end_distance"];
    
    return cell;
    
}

- (UIButton *)cancelBtn {
    
    if (_cancelBtn == nil) {
        
        float width = (kWidth - 40) / 2;
        
        _cancelBtn = [[UIButton alloc] initWithFrame: CGRectMake(20, 101, width, 40)];
        
        [_cancelBtn setTitle: @"取消订单" forState: UIControlStateNormal];
        
        [_cancelBtn setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
        
        [_cancelBtn.titleLabel setFont: [UIFont fontWithName: @"System" size: 15]];
        
        _cancelBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return _cancelBtn;
    
}

- (UIButton *)successBtn {
    
    if (_successBtn == nil) {
        
        float width = (kWidth - 40) / 2;
        
        _successBtn = [[UIButton alloc] initWithFrame: CGRectMake(20 + width, 101, width, 40)];
        
        [_successBtn setTitle: @"完成订单" forState: UIControlStateNormal];
        
        [_successBtn setTitleColor: RGBCOLOR(41, 161, 247) forState: UIControlStateNormal];
        
        [_successBtn.titleLabel setFont: [UIFont fontWithName: @"System" size: 15]];
        
        _successBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return _successBtn;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 141.5;
    
}

- (void)showCancelMessage:(UIButton *)btn{
    
    NSString *objectId = [[self.dataAry objectAtIndex: btn.tag] objectForKey: @"objectId"];
    
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

- (void)showSuccessMessage:(UIButton *)btn {
    
    NSString *objectId = [[self.dataAry objectAtIndex: btn.tag] objectForKey: @"objectId"];
    
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
