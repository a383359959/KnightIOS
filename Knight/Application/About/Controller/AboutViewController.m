//
//  AboutViewController.m
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/30.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [User createNav: self title: @"关于" hidden: @(0)];
    
    [self createView];
    
}

- (void)createView {
    
    self.about = [[[NSBundle mainBundle] loadNibNamed: @"About" owner: nil options: nil] lastObject];
    
    self.about.frame = CGRectMake(0, TopBarHeight, kWidth, SafeHeight - TopBarHeight);
    
    self.about.delegate = self;
    
    [self.view addSubview: self.about];
    
}

- (void)backCallback {
    
    [self.navigationController popViewControllerAnimated: YES];
    
}

@end
