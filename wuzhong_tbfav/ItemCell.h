//
//  ItemCell.h
//  wuzhong_tbfav
//
//  Created by wuzhong on 14-7-24.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCell : UITableViewCell

@property UIImage *image;

@property UILabel *title;

@property UILabel *price;


- (void) setData : (NSString *) url andTitle : (NSString *) title andPrice : (NSString *) price;

@end
