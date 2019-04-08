//
//  Header.m
//  Knight
//
//  Created by QiuHao on 2019/4/8.
//  Copyright © 2019年 QiuHao. All rights reserved.
//

#import "Header.h"

@implementation Header

- (void)setTitleTop:(NSLayoutConstraint *)titleTop {
    
    titleTop.constant = SafeTop;
    
    _titleTop = titleTop;
    
}

- (void)setTopHeight:(NSLayoutConstraint *)topHeight {
    
    topHeight.constant = TopBarHeight;
    
    _topHeight = topHeight;
    
}

- (void)setBackBtnTop:(NSLayoutConstraint *)backBtnTop {
    
    backBtnTop.constant = SafeTop + 4;
    
    _backBtnTop = backBtnTop;
    
}

- (void)setBackBtn:(UIButton *)backBtn {
    
    [backBtn addTarget: self action: @selector(backBtnCallback) forControlEvents: UIControlEventTouchUpInside];
    
    _backBtn = backBtn;
    
}

- (void)backBtnCallback {
    
    self.backBtnBlock();
    
}

@end
