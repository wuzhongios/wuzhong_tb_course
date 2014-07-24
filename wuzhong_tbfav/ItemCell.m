//
//  ItemCell.m
//  wuzhong_tbfav
//
//  Created by wuzhong on 14-7-24.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "ItemCell.h"

@implementation ItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void) setData:(NSString *)url andTitle:(NSString *)title andPrice:(NSString *)price{

}

@end
