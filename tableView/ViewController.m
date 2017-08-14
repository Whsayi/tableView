//
//  ViewController.m
//  tableView
//
//  Created by 张浩宁 on 2017/8/14.
//  Copyright © 2017年 bawei. All rights reserved.
//

#import "ViewController.h"
#import "HFStretchableTableHeaderView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}
@property (nonatomic,strong)HFStretchableTableHeaderView *stretchHeaderView;
#define StretchHeaderHeight 200

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化表格
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    // 设置代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    // 添加到视图上
    [self.view addSubview:_tableView];
    
    [self initStretchHeader];
    
}
- (void)initStretchHeader
{
    //背景
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, StretchHeaderHeight)];
    bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    bgImageView.clipsToBounds = YES;
    bgImageView.image = [UIImage imageNamed:@"1.jpg"];
    
    //背景之上的内容
    UIView *contentView = [[UIView alloc] initWithFrame:bgImageView.bounds];
    contentView.backgroundColor = [UIColor clearColor];
    
    /*
     UIImageView *avater = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 90, 90)];
     avater.image = [UIImage imageNamed:@"avater"];
     avater.center = contentView.center;
     [contentView addSubview:avater];
     */
    
    self.stretchHeaderView = [HFStretchableTableHeaderView new];
    [self.stretchHeaderView stretchHeaderForTableView:_tableView withView:bgImageView subViews:contentView];
    
}

#pragma -
#pragma mark - UITableViewDelegate表格的代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"1"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"1"];
    }
    cell.textLabel.text = @"嗯嗯嗯呃";
    return cell;
}

#pragma mark - stretchableTable delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.stretchHeaderView scrollViewDidScroll:scrollView];
}

- (void)viewDidLayoutSubviews
{
    [self.stretchHeaderView resizeView];
}


@end
