//
//  LYEssenceWordController.m
//  123456
//
//  Created by 李艳 on 2018/11/7.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYEssenceWordController.h"

@interface LYEssenceWordController ()

@end

@implementation LYEssenceWordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"数据第%d行", indexPath.row];
    return cell;
}

@end
