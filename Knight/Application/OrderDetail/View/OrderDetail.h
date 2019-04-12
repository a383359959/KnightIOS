//
//  OrderDetail.h
//  Knight
//
//  Created by QiuHao on 2019/4/12.
//  Copyright © 2019 QiuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderDetail : UIView

@property (weak, nonatomic) IBOutlet UILabel *orderNum;

@property (weak, nonatomic) IBOutlet UILabel *start_address;

@property (weak, nonatomic) IBOutlet UILabel *end_address;

@property (weak, nonatomic) IBOutlet UILabel *shangjia_price;

@property (weak, nonatomic) IBOutlet UILabel *zaixian_price;

@property (weak, nonatomic) IBOutlet UILabel *pingtai_price;

@property (weak, nonatomic) IBOutlet UILabel *bendan_price;

@property (weak, nonatomic) IBOutlet UILabel *createdAt;

@property (weak, nonatomic) IBOutlet UILabel *updatedAt;

@end

NS_ASSUME_NONNULL_END
