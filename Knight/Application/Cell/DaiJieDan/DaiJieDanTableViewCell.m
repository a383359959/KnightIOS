//
//  DaiJieDanTableViewCell.m
//  Knight
//
//  Created by QiuHao on 2019/4/9.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "DaiJieDanTableViewCell.h"

@implementation DaiJieDanTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected: selected animated: animated];
    
}

- (void)setSubmitBtn:(UIButton *)submitBtn {
    
    [submitBtn addTarget: self action: @selector(submitCallback) forControlEvents: UIControlEventTouchUpInside];
    
    _submitBtn = submitBtn;
    
}

- (void)submitCallback {
    
    self.submitBlock();
    
}

- (void)setBoxView:(UIView *)boxView {
    
    boxView.layer.masksToBounds = YES;
    
    boxView.layer.cornerRadius = 5;
    
    _boxView = boxView;
    
}

@end
