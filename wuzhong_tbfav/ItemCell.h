//
//  ItemCell.h
//  wuzhong_tbfav
//
//  Created by wuzhong on 14-7-24.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemModel.h"

@interface ItemCell : UITableViewCell

@property (nonatomic) UIImageView *image;

@property (nonatomic) UILabel *title;

@property UILabel *price;

@property UILabel *fav;


- (void) setData : (ItemModel *) model;

@end
