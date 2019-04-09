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

@end
