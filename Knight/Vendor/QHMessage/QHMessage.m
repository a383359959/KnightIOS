//
//  QHMessage.m
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/31.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "QHMessage.h"

static QHMessage *obj = nil;

@implementation QHMessage

+ (QHMessage *)getInstance {
    
    @synchronized (self) {
    
        if (obj == nil) {
            
            obj = [QHMessage new];
            
        }
        
    }
    
    return obj;
    
}

- (void)toast:(NSString *)msg view:(UIView *)view {
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] init];
    
    hud.mode = MBProgressHUDModeText;
    
    hud.minShowTime = 3;
    
    hud.label.text = msg;
    
    hud.removeFromSuperViewOnHide = YES;
    
    [view addSubview: hud];
    
    [hud showAnimated: YES];
    
    [MBProgressHUD hideHUDForView: view animated: YES];
    
}

- (MBProgressHUD *)showLoading:(UIView *)view {
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView: view];
    
    hud.removeFromSuperViewOnHide = YES;
    
    [view addSubview: hud];
    
    [hud showAnimated: YES];
    
    return hud;
    
}

@end
