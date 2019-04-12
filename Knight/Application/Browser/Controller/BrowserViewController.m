//
//  BrowserViewController.m
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/28.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "BrowserViewController.h"

@interface BrowserViewController ()

@end

@implementation BrowserViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = background_color;
    
    [self createView];
    
}

- (void)createView {

    self.browser = [[[NSBundle mainBundle] loadNibNamed: @"Browser" owner: nil options: nil] lastObject];

    self.browser.frame = CGRectMake(0, 0, kWidth, SafeHeight);

    [self.view addSubview: self.browser];

}

@end
