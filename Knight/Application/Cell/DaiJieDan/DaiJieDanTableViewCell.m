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

- (void)setCancelBtn:(UIButton *)cancelBtn {
    
    [cancelBtn addTarget: self action: @selector(cancelCallback) forControlEvents: UIControlEventTouchUpInside];
    
    _cancelBtn = cancelBtn;
    
}

- (void)setSuccessBtn:(UIButton *)successBtn {
    
    [successBtn addTarget: self action: @selector(successCallback) forControlEvents: UIControlEventTouchUpInside];
    
    _successBtn = successBtn;
    
}

- (void)submitCallback {
    
    self.submitBlock();
    
}

- (void)cancelCallback {
    
    self.cancelBlock();
    
}

- (void)successCallback {
    
    self.successBlock();
    
}

- (void)setBoxView:(UIView *)boxView {
    
    boxView.layer.masksToBounds = YES;
    
    boxView.layer.cornerRadius = 5;
    
    _boxView = boxView;
    
}

// 重新布局
- (void)reloadLayout:(LIST_TYPE)type {
    
    if (type == 0) {
        
        self.cancelBtn.hidden = YES;
        
        self.successBtn.hidden = YES;
        
        self.successLabel.hidden = YES;
        
    } else if (type == 1) {
        
        self.submitBtn.hidden = YES;
        
        self.successLabel.hidden = YES;
        
    } else if (type == 2) {
        
        self.cancelBtn.hidden = YES;
        
        self.successBtn.hidden = YES;
        
        self.submitBtn.hidden = YES;
        
    }
    
}

@end
