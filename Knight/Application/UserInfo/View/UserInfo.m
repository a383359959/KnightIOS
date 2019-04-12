//
//  UserInfo.m
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/29.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
}

- (NSMutableArray *)menuList {
    
    if (_menuList == nil) {
        
        _menuList = [[NSMutableArray alloc] initWithObjects: @"", @"", @"修改密码", @"创建用户", @"关于", @"", @"清空缓存", @"退出", nil];
        
    }
    
    return _menuList;
    
}

- (NSMutableArray *)iconList {
    
    if (_iconList == nil) {
        
        _iconList = [[NSMutableArray alloc] initWithObjects: @"", @"", @"icon_1", @"icon_2", @"icon_3", @"", @"icon_4", @"icon_5", nil];
        
    }
    
    return _iconList;
    
}


- (void)setTableList:(UITableView *)tableList {
    
    tableList.delegate = self;
    
    tableList.dataSource = self;

    UIView * headerView  = [[UIView alloc] initWithFrame: CGRectMake(0, 0, kWidth, SafeTop)];
    
    headerView.backgroundColor = [UIColor whiteColor];
    
    tableList.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableList.tableHeaderView = headerView;

    tableList.tableFooterView = [UIView new];
    
    tableList.bounces = NO;
    
    _tableList = tableList;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 8;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
        {
            
            UserHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"UserHeaderTableViewCell"];
            
            if (cell == nil) {
                
                cell = [[[NSBundle mainBundle] loadNibNamed: @"UserHeaderTableViewCell" owner: nil options: nil] lastObject];
                
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
            }
            
            return cell;
            
        }
        case 1:
        {
            
            UserLineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"UserLineTableViewCell"];
            
            if (cell == nil) {
                
                cell = [[[NSBundle mainBundle] loadNibNamed: @"UserLineTableViewCell" owner: nil options: nil] lastObject];
                
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
            }
            
            return cell;
        
        }
        case 5:
        {
            
            UserLineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"UserLineTableViewCell"];
            
            if (cell == nil) {
                
                cell = [[[NSBundle mainBundle] loadNibNamed: @"UserLineTableViewCell" owner: nil options: nil] lastObject];
                
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
            }
            
            return cell;
            
        }
        default:
        {
            
            UserMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"UserMenuTableViewCell"];
            
            if (cell == nil) {
                
                cell = [[[NSBundle mainBundle] loadNibNamed: @"UserMenuTableViewCell" owner: nil options: nil] lastObject];
                
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                cell.btn.tag = indexPath.row;
                
                [cell.btn setTitle: [self.menuList objectAtIndex: indexPath.row] forState: UIControlStateNormal];
                
                [cell.btn addTarget: self action: @selector(btnCallback:) forControlEvents: UIControlEventTouchUpInside];
                
                cell.icon.image = [UIImage imageNamed: [self.iconList objectAtIndex: indexPath.row]];
                
                if (indexPath.row == 6) {
                    
                    cell.sub_title.text = [NSString stringWithFormat: @"%.2f M", [self cacheSize]];
                    
                    cell.tag = indexPath.row;
                    
                }
                
            }
            
            return cell;
            
        }
            
    }
    
}

- (float)cacheSize {
    
    int totalSize = 0;
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    BOOL dir = NO;
    
    BOOL exits = [mgr fileExistsAtPath:path isDirectory: &dir];
    
    if (!exits) return 0;
    
    if (dir) {
        
        NSArray *subPaths = [mgr subpathsAtPath:path];
        
        for (NSString *subPath in subPaths) {
            
            NSString *fullSubPath = [path stringByAppendingPathComponent: subPath];
            
            BOOL dir = NO;
            
            [mgr fileExistsAtPath: fullSubPath isDirectory: &dir];
            
            if (!dir) {
                
                if ([subPath isEqualToString: @"mySql.sqlite"]) {
                    
                    continue;
                    
                }
                
                NSDictionary *attrs = [mgr attributesOfItemAtPath: fullSubPath error: nil];
                
                totalSize += [attrs[NSFileSize] intValue];
                
            }
        }
        
        totalSize = totalSize / (1024 * 1024.0);
        
    } else {
        
        NSDictionary *attrs = [mgr attributesOfItemAtPath: path error: nil];
        
        totalSize = [attrs[NSFileSize] intValue] / (1024 * 1024.0);
        
    }
    
    return totalSize;
    
}

- (void)btnCallback:(UIButton *)btn {
    
    [self.delegate btnAddTarget: btn.tag];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat num = 0;
    
    switch (indexPath.row) {
        case 0:
            num = 150;
            break;
        case 1:
            num = 5;
            break;
        case 5:
            num = 5;
            break;
        default:
            num = 50;
    }
    
    return num;
    
}

@end
