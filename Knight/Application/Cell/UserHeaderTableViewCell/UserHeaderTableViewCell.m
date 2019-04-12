//
//  UserHeaderTableViewCell.m
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/29.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "UserHeaderTableViewCell.h"

@implementation UserHeaderTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
}

- (void)setPhoto:(UIImageView *)photo {
    
    photo.layer.masksToBounds = YES;
    
    photo.layer.cornerRadius = 10;
    
    _photo = photo;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
}

- (void)setTitle:(UILabel *)title {
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    title.text = [user objectForKey: @"username"];
    
    _title = title;
    
}

@end
