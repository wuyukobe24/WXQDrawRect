//
//  ViewController.m
//  WXQDrawRect
//
//  Created by WXQ on 2018/8/10.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "ViewController.h"
#import "DrawRectController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,copy)NSArray * titleArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"绘制方法";
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const cellID = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.textLabel.text = self.titleArray[indexPath.row];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DrawRectController * draw = [[DrawRectController alloc]init];
    draw.indexPath = indexPath;
    [self.navigationController pushViewController:draw animated:YES];
}

#pragma mark - 初始化数据
- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"绘制实线和虚线",@"绘制文本",@"绘制图片",@"绘制圆形图片",@"绘制圆形",@"绘制椭圆形",@"绘制扇形",@"绘制正方形",@"绘制矩形",@"绘制菱形",@"曲线和弧线",@"渐变背景颜色"];
    }
    return _titleArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
