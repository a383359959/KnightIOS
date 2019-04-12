//
//  About.h
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/30.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AboutDelegate <NSObject>

- (void)backCallback;

@end

@interface About : UIView

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backTop;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleTop;

@property (weak, nonatomic) IBOutlet UIButton *backBtn;

@property (weak, nonatomic) IBOutlet UIImageView *logo;

@property(nonatomic, strong) id<AboutDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
