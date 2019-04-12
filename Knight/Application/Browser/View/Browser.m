//
//  Browser.m
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/28.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import "Browser.h"

@implementation Browser

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    [self createWebView];
    
    [self btnLayout];
    
}

- (void)setHomeBtn:(UIButton *)homeBtn {
    
    [homeBtn addTarget: self action: @selector(goHome) forControlEvents: UIControlEventTouchUpInside];
    
    _homeBtn = homeBtn;
    
}

- (void)setRefreshBtn:(UIButton *)refreshBtn {
    
    [refreshBtn addTarget: self action: @selector(goRefresh) forControlEvents: UIControlEventTouchUpInside];
    
    _refreshBtn = refreshBtn;
    
}

- (void)setLeftBtn:(UIButton *)leftBtn {
    
    [leftBtn addTarget: self action: @selector(goBack) forControlEvents: UIControlEventTouchUpInside];
    
    _leftBtn = leftBtn;
    
}

- (void)setRightBtn:(UIButton *)rightBtn {
    
    [rightBtn addTarget: self action: @selector(goForward) forControlEvents: UIControlEventTouchUpInside];
    
    _rightBtn = rightBtn;
    
}

- (void)goBack {
    
    [self setBtnBg];
    
    if ([self.webview canGoBack]) {
        
        [self.webview goBack];
        
    }
    
}

- (void)goRefresh {
    
    [self setBtnBg];
    
    [self.webview reload];
    
}

- (void)goHome {
    
    NSUserDefaults *info = [NSUserDefaults standardUserDefaults];
    
    NSString *url = [info objectForKey: @"url"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL: [NSURL URLWithString: url]];
    
    [self.webview loadRequest: request];
    
}

- (void)goForward {
    
    [self setBtnBg];
    
    if (self.webview.canGoForward) {
        
        [self.webview goForward];
        
    }
    
}

- (void)createWebView {

    float height = SafeHeight - 50 - SafeTop;

    self.webview = [[WKWebView alloc] initWithFrame: CGRectMake(0, SafeTop, kWidth, height)];
    
    self.webview.scrollView.bounces = NO;
    
    self.webview.navigationDelegate = self;
    
    self.backForwardList = [self.webview backForwardList];
    
    self.webview.allowsBackForwardNavigationGestures = YES;

    [self goHome];

    [self addSubview: self.webview];

}

- (void)btnLayout {
    
    NSMutableArray *btnArray = [[NSMutableArray alloc] initWithObjects: self.leftBtn, self.rightBtn, self.homeBtn, self.refreshBtn, nil];
    
    [self setBtnBg];
    
    BtnLayout *btnLayout = [BtnLayout getInstance];
    
    btnLayout.btnWidth = @(25);
    
    btnLayout.btnHeight = @(25);
    
    btnLayout.boxHeight = @(50);
    
    btnLayout.dataAry = btnArray;
    
    [btnLayout setLayout];
    
}

- (void)setBtnBg {
    
    if ([self.webview canGoBack]) {
        
        [self.leftBtn setBackgroundImage: [UIImage imageNamed: @"left"] forState: UIControlStateNormal];
        
    } else {
        
        [self.leftBtn setBackgroundImage: [UIImage imageNamed: @"left_normal"] forState: UIControlStateNormal];
        
    }
    
    if ([self.webview canGoForward]) {
        
        [self.rightBtn setBackgroundImage: [UIImage imageNamed: @"right"] forState: UIControlStateNormal];
        
    } else {
        
        [self.rightBtn setBackgroundImage: [UIImage imageNamed: @"right_normal"] forState: UIControlStateNormal];
        
    }
    
    [self.homeBtn setBackgroundImage: [UIImage imageNamed: @"home"] forState: UIControlStateNormal];
    
    [self.refreshBtn setBackgroundImage: [UIImage imageNamed: @"refresh"] forState: UIControlStateNormal];
    
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
    [self setBtnBg];
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    [self setBtnBg];
    
}

- (void)webView:(WKWebView*)webView decidePolicyForNavigationAction:(WKNavigationAction*)navigationAction decisionHandler:(void(^)(WKNavigationActionPolicy))decisionHandler {
    
    WKNavigationActionPolicy policy = WKNavigationActionPolicyAllow;
    
    NSSet *validSchemes = [NSSet setWithArray: @[@"http", @"https"]];
    
    if(![validSchemes containsObject: navigationAction.request.URL.scheme]) {
        
        [[UIApplication sharedApplication] openURL: navigationAction.request.URL];
        
        policy = WKNavigationActionPolicyCancel;
        
    }else if([[navigationAction.request.URL host] isEqualToString: @"itunes.apple.com"] && [[UIApplication sharedApplication] openURL: navigationAction.request.URL]){
        
        policy = WKNavigationActionPolicyCancel;
        
    }
    
    decisionHandler(policy);
    
}

@end
