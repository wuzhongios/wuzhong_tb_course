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
        
        _image = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 110, 110)];
        
        // Initialization code
        _title = [[UILabel alloc]initWithFrame:CGRectMake(130, 5, 180, 60)];
//        _title.backgroundColor  = [UIColor grayColor];
        
        _price = [[UILabel alloc] initWithFrame:CGRectMake(130, 60, 180, 20)];
        _price.textColor = [UIColor redColor];
        _price.font = [UIFont  fontWithName:@"Arial Rounded MT Bold" size:(16.0)];

        
        _fav = [[UILabel alloc] initWithFrame:CGRectMake(130, 85, 180, 20)];
        _fav.textColor = [UIColor grayColor];
        _fav.font = [UIFont  fontWithName:@"Arial Rounded MT Bold" size:(12.0)];
        
         UIImageView* arrow = [[UIImageView alloc]initWithFrame:CGRectMake(300, 52 , 16, 16)];
        
        arrow.image = [UIImage imageNamed:@"arrow"];
        
        
        [self.contentView addSubview:_image];
        [self.contentView addSubview:_title];
        [self.contentView addSubview:_price];
        [self.contentView addSubview:_fav];

        [self.contentView addSubview:arrow];
        
        self.highlighted = YES;
        //没有点击背景色
//        self.selectionStyle = UITableViewCellSelectionStyleNone;

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


- (void) setData:(ItemModel *)model{
    
    _title.text = model.name;
    
    _price.text = model.price;
    
    _fav.text = model.fav;

    
    _image.image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:model.img2 ofType:@"jpg"]];
    
    
//    self.title.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    

}





@end
