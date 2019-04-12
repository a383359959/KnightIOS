//
//  Browser.h
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/28.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "BtnLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface Browser : UIView <WKNavigationDelegate>

@property(nonatomic, strong) WKWebView *webview;

@property (weak, nonatomic) IBOutlet UIButton *leftBtn;

@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@property (weak, nonatomic) IBOutlet UIButton *homeBtn;

@property (weak, nonatomic) IBOutlet UIButton *refreshBtn;

@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property(nonatomic, strong) WKBackForwardList *backForwardList;

@end

NS_ASSUME_NONNULL_END
