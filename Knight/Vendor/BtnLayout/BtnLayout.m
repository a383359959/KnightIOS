//
//  BtnLayout.m
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/28.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "BtnLayout.h"

static BtnLayout *btnLayout = nil;

@implementation BtnLayout

+ (BtnLayout *) getInstance {
    
    @synchronized (self) {
        
        if (btnLayout == nil) {
            
            btnLayout = [[BtnLayout alloc] init];
            
        }
        
    }
    
    return btnLayout;
    
}

- (void)setLayout {
    
    float width = kWidth - self.btnWidth.intValue * self.dataAry.count;
    
    width = width / (self.dataAry.count + 1);
    
    for (int i = 0; i < self.dataAry.count; i++) {
        
        UIButton *btn = [self.dataAry objectAtIndex: i];
        
        float left = width * (i + 1) + (self.btnWidth.intValue * i);
        
        float top = (self.boxHeight.intValue - self.btnHeight.intValue) / 2;
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.equalTo(self.btnWidth);
            
            make.height.equalTo(self.btnHeight);
            
            make.left.equalTo([NSNumber numberWithFloat: left]);
            
            make.top.equalTo([NSNumber numberWithFloat: top]);
            
        }];
        
    }
    
}

@end
