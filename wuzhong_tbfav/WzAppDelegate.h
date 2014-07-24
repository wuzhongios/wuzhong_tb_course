//
//  WzAppDelegate.h
//  wuzhong_tbfav
//
//  Created by wuzhong on 14-7-24.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WzAppDelegate : UIResponder <UIApplicationDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UIWindow *window;

@property UITableView *tableView;

@end
