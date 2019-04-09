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
    
}

- (void)createView {
    
    self.home = [[[NSBundle mainBundle] loadNibNamed: @"Home" owner: nil options: nil] lastObject];
    
    self.home.frame = CGRectMake(0, TopBarHeight, kWidth, kHeight - TopBarHeight - SafeBottom - 40);
    
    [self.view addSubview: self.home];
    
}

@end
