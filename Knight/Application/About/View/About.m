//
//  About.m
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/30.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "About.h"

@implementation About

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

- (void)setLogo:(UIImageView *)logo {
    
    logo.layer.masksToBounds = YES;
    
    logo.layer.cornerRadius = 5;
    
    _logo = logo;
    
}

@end
