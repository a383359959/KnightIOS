//
//  UserHeaderTableViewCell.h
//  KeFenBaoSystem
//
//  Created by QiuHao on 2019/3/29.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserHeaderTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photo;

@property (weak, nonatomic) IBOutlet UILabel *title;

@end

NS_ASSUME_NONNULL_END
