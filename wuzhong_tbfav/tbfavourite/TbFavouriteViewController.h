//
//  TbFavouriteViewController.h
//  wuzhong_tbfav
//
//  Created by wuzhong on 14-7-25.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TbFavouriteViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

//@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end
