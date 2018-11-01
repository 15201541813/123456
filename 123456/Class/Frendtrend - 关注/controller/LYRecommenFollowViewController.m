//
//  LYRecommenFollowViewController.m
//  123456
//
//  Created by 李艳 on 2018/11/1
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYRecommenFollowViewController.h"

@interface LYRecommenFollowViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView *cateTableView;
@property (nonatomic, weak) UITableView *contenTableView;
@end

@implementation LYRecommenFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self basicSetting];
    [self layoutSubviews];
}

- (void)basicSetting
{
    self.view.backgroundColor = LYDefaultColor;
    self.navigationItem.title = @"推荐关注";
    
}
- (UITableView *)cateTableView
{
    if (_cateTableView == nil) {
        UITableView *cate = [[UITableView alloc] init];
        [self.view addSubview:cate];
        _cateTableView = cate;
        _cateTableView.delegate = self;
        _cateTableView.dataSource = self;
        
        _cateTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _cateTableView.backgroundColor = [UIColor clearColor];
    }
    return _cateTableView;
}
- (void)layoutSubviews
{
    
    self.cateTableView.frame = CGRectMake(0, 84, 100, LYScreenHeight);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"ID"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行", (long)indexPath.row];
    cell.backgroundColor = LYColor(244, 244, 244);
    return cell;
}
@end
