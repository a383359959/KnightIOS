//
//  AboutViewController.h
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/30.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "About.h"

NS_ASSUME_NONNULL_BEGIN

@interface AboutViewController : UIViewController <AboutDelegate>

@property(nonatomic, strong) About *about;

@end

NS_ASSUME_NONNULL_END
