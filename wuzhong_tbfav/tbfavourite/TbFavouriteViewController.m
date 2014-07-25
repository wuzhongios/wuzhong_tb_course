//
//  TbFavouriteViewController.m
//  wuzhong_tbfav
//
//  Created by wuzhong on 14-7-25.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "TbFavouriteViewController.h"
#import "ItemCell.h"
#import "ItemModel.h"
#import "SVPullToRefresh.h"
#import "YFJLeftSwipeDeleteTableView.h"

@interface TbFavouriteViewController ()

@end

@implementation TbFavouriteViewController

@synthesize tableView = tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"my favourites";
    
    CGRect frame = self.view.bounds;
    self.tableView = [[YFJLeftSwipeDeleteTableView alloc] initWithFrame:frame];
    
    [self setupDataSource];
    
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, super.window.frame.size.width, self.window.frame.size.height - 20) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    
    __weak TbFavouriteViewController *weakSelf = self;
    // setup pull-to-refresh
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf insertRowAtTop];
    }];
    
    // setup infinite scrolling
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf insertRowAtBottom];
    }];
    
    [self.tableView registerClass:[ItemCell class] forCellReuseIdentifier:@"Cell"];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//取消点击背景色
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - Actions

- (void)setupDataSource {
    self.dataSource = [NSMutableArray array];
    for(int index=0; index<10; index++){
        [self addItem:index fromTop:NO];
    }
}

- (void) addItem : (int) index fromTop : (BOOL) top{
    ItemModel *model = [[ItemModel alloc] init];
    model.name = [NSString stringWithFormat:@"hello world index %d", index];
    model.price = [NSString stringWithFormat:@"￥%.2f", 11.1 * index];
    model.img2 = [NSString stringWithFormat:@"hezi%d", index % 3];
    
    model.fav = [NSString stringWithFormat:@"人气 100%d", index];
    
    if(top){
        [self.dataSource insertObject:model atIndex:0];
    }else{
        [self.dataSource addObject:model];
    }
    
    //    [weakSelf.dataSource insertObject:[NSDate date] atIndex:0];
}

- (void)insertRowAtTop {
    __weak TbFavouriteViewController *weakSelf = self;
    
    int64_t delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [weakSelf.tableView beginUpdates];
        [weakSelf addItem : weakSelf.dataSource.count fromTop:YES];
        [weakSelf.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationBottom];
        [weakSelf.tableView endUpdates];
        
        [weakSelf.tableView.pullToRefreshView stopAnimating];
    });
}


- (void)insertRowAtBottom {
    __weak TbFavouriteViewController *weakSelf = self;
    
    int64_t delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [weakSelf.tableView beginUpdates];
        
        [weakSelf addItem : weakSelf.dataSource.count fromTop:NO];
        //        [weakSelf.dataSource addObject:[weakSelf.dataSource.lastObject dateByAddingTimeInterval:-90]];
        [weakSelf.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:weakSelf.dataSource.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
        [weakSelf.tableView endUpdates];
        
        [weakSelf.tableView.infiniteScrollingView stopAnimating];
    });
}
#pragma mark -
#pragma mark UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataSource.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 120;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableViewP cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    static NSString *CellIdentifier = @"Cell";
    
    ItemCell *cell = [tableViewP dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    [[ItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ItemCell"];
    
    ItemModel *model = [_dataSource objectAtIndex:indexPath.row];
    
    
    [cell setData:model];
    
    return cell;
    
    
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableViewP commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [_dataSource removeObjectAtIndex:indexPath.row];
        [tableViewP deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


@end
