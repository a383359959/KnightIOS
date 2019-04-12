//
//  UserCreateUser.m
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/30.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "UserCreateUser.h"

@implementation UserCreateUser


- (void)setBackTop:(NSLayoutConstraint *)backTop {
    
    backTop.constant = SafeTop + 9;
    
    _backTop = backTop;
    
}

- (void)setTopHeight:(NSLayoutConstraint *)topHeight {
    
    topHeight.constant = SafeTop + 50;
    
    _topHeight = topHeight;
    
}

-(void)setTitleTop:(NSLayoutConstraint *)titleTop {
    
    titleTop.constant = SafeTop;
    
    _titleTop = titleTop;
    
}

- (void)setBackBtn:(UIButton *)backBtn {
    
    [backBtn addTarget: self action: @selector(backCallback) forControlEvents: UIControlEventTouchUpInside];
    
    _backBtn = backBtn;
    
}

- (void)backCallback {
    
    [self.delegate backCallback];
    
}

- (NSMutableArray *)dataAry {
    
    if (_dataAry == nil) {
        
        _dataAry = [[NSMutableArray alloc] initWithObjects: @"用户名", @"密码", nil];
        
    }
    
    return _dataAry;
    
}

- (void)setTableList:(UITableView *)tableList {
    
    tableList.delegate = self;
    
    tableList.dataSource = self;
    
    tableList.tableFooterView = [UIView new];
    
    tableList.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableList.bounces = NO;
    
    _tableList = tableList;
    
}

- (void)setTableListHeight:(NSLayoutConstraint *)tableListHeight {
    
    tableListHeight.constant = 50 * self.dataAry.count;
    
    _tableListHeight = tableListHeight;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataAry.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
    
}

- (void)setSubmitBtn:(UIButton *)submitBtn {
    
    submitBtn.layer.masksToBounds = YES;
    
    submitBtn.layer.cornerRadius = 5;
    
    [submitBtn addTarget: self action: @selector(submitBtnCallback) forControlEvents: UIControlEventTouchUpInside];
    
    _submitBtn = submitBtn;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UserInputTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"UserInputTableViewCell"];
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed: @"UserInputTableViewCell" owner: nil options: nil] lastObject];
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.title.placeholder = [self.dataAry objectAtIndex: indexPath.row];
    
    cell.title.tag = indexPath.row;
    
    [cell.title addTarget: self action: @selector(inputCallback:) forControlEvents: UIControlEventEditingChanged];
    
    if (indexPath.row == self.dataAry.count - 1) {
        
        cell.line.hidden = YES;
        
    }
    
    return cell;
    
}

- (void)inputCallback:(UITextField *)textField {
    
    NSInteger tag = textField.tag;
    
    switch (tag) {
        case 0:
        {
            [self.options setObject: textField.text forKey: @"username"];
            break;
        }
        case 1:
        {
            [self.options setObject: textField.text forKey: @"password"];
            break;
        }
    }
    
}

- (NSMutableDictionary *)options {
    
    if (_options == nil) {
        
        _options = [[NSMutableDictionary alloc] initWithObjectsAndKeys: @"", @"username", @"", @"password", nil];
        
    }
    
    return _options;
    
}

- (void)submitBtnCallback {
    
    NSString *username = [self.options objectForKey: @"username"];
    
    NSString *password = [self.options objectForKey: @"password"];
    
    QHMessage *message = [QHMessage getInstance];
    
    if ([username isEqualToString: @""]) {
        
        [message toast: @"用户名不能为空" view: self];
        
    } else if ([password isEqualToString: @""]) {
        
        [message toast: @"密码不能为空" view: self];
        
    } else {
        
        [self.delegate submitCallback];
        
    }
    
}

@end
