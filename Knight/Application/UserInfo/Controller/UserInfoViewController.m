//
//  UserInfoViewController.m
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/29.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = background_color;
    
    [self createView];
    
}

- (void)createView {
    
    self.userInfo = [[[NSBundle mainBundle] loadNibNamed: @"UserInfo" owner: nil options: nil] lastObject];
    
    self.userInfo.delegate = self;
    
    self.userInfo.frame = CGRectMake(0, 0, kWidth, SafeHeight);
    
    [self.view addSubview: self.userInfo];
    
}

- (void)btnAddTarget:(NSInteger)tag {
    
    switch (tag) {
        case 2:
        {
            
            UserEditPasswordViewController *vc = [[UserEditPasswordViewController alloc] init];
            
            [vc setHidesBottomBarWhenPushed: YES];
            
            [self.navigationController pushViewController: vc animated: YES];
            
            break;
            
        }
        case 3:
        {
            
            UserCreateUserViewController *vc = [[UserCreateUserViewController alloc] init];
            
            [vc setHidesBottomBarWhenPushed: YES];
            
            [self.navigationController pushViewController: vc animated: YES];
            
            break;
            
        }
        case 4:
        {
            
            AboutViewController *vc = [[AboutViewController alloc] init];
            
            [vc setHidesBottomBarWhenPushed: YES];
            
            [self.navigationController pushViewController: vc animated: YES];
            
            break;
            
        }
        case 6:
        {
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"确定清除缓存？" preferredStyle: UIAlertControllerStyleAlert];
            
            UIAlertAction *action = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                QHMessage *message = [QHMessage getInstance];
                
                if ([self clearCache] == YES) {
                    
                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow: tag inSection: tag];
                    
                    UserMenuTableViewCell *cell = [self.userInfo.tableList cellForRowAtIndexPath: indexPath];
                    
                    cell.sub_title.text = [NSString stringWithFormat: @"%.2f M", [self.userInfo cacheSize]];
                    
                    [message toast: @"清除成功" view: self.view];
                    
                } else {
                    
                    [message toast: @"清除失败" view: self.view];
                    
                }
                
            }];
            
            UIAlertAction *cancel = [UIAlertAction actionWithTitle: @"取消" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alert addAction: action];
            
            [alert addAction: cancel];
            
            [self presentViewController: alert animated: YES completion:^{
                
            }];
            
        }
        case 7:
        {
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"确定退出？" preferredStyle: UIAlertControllerStyleAlert];
            
            UIAlertAction *action = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                LeanCloud *leanCloud = [LeanCloud getInstance];
                
                [leanCloud logout:^{
                   
                    User *user = [User getInstance];
                    
                    [user initApp];
                    
                }];
                
            }];
            
            UIAlertAction *cancel = [UIAlertAction actionWithTitle: @"取消" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alert addAction: action];
            
            [alert addAction: cancel];
            
            [self presentViewController: alert animated: YES completion:^{
                
            }];
            
        }
    }
    
}

- (BOOL)clearCache {
    
    BOOL clearSuccess = YES;
    
    NSError *error = nil;
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    NSArray *subPathArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    
    for (NSString *subPath in subPathArray) {
        
        if ([subPath isEqualToString:@"mySql.sqlite"]){
            
            continue;
            
        }
        
        NSString *filePath = [path stringByAppendingPathComponent: subPath];
        
        [[NSFileManager defaultManager] removeItemAtPath: filePath error: &error];
        
        if (error) {
            
            clearSuccess = NO;
            
        }
        
    }
    
    return clearSuccess;
    
}

@end
