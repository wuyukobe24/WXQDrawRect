//
//  RhombusView.m
//  WXQDrawRect
//
//  Created by WXQ on 2018/8/13.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "RhombusView.h"

#define K_X   CGRectGetWidth(self.frame)/4
#define K_Y   20
#define K_W   CGRectGetWidth(self.frame)/2
#define K_H   CGRectGetWidth(self.frame)/3
@implementation RhombusView

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //背景颜色设置
    [[UIColor whiteColor] set];
    CGContextFillRect(context, rect);
    
    //画一个菱形-实线带边框，带填充
    //边框
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor magentaColor].CGColor);
    CGFloat dashArray[] = {1, 4}; // 表示先画1个点再画4个点（前者小后者大时，虚线点小且间隔大；前者大后者小时，虚线点大且间隔小）
    CGContextSetLineDash(context, 1, dashArray, 2); // 其中的2表示dashArray中的值的个数
    //方法1 菱形起点-终点
    //    CGContextMoveToPoint(context, K_X, K_Y+K_H/2);
    //    CGContextAddLineToPoint(context, K_X+K_W/2, K_Y);
    //    CGContextAddLineToPoint(context, K_X+K_W, K_Y+K_H/2);
    //    CGContextAddLineToPoint(context, K_X+K_W/2, K_Y+K_H);
    //    CGContextAddLineToPoint(context, K_X, K_Y+K_H/2);
    //方法2 菱形起点-终点
    CGPoint points[5] = {CGPointMake(K_X, K_Y+K_H/2), CGPointMake(K_X+K_W/2, K_Y), CGPointMake(K_X+K_W, K_Y+K_H/2), CGPointMake(K_X+K_W/2, K_Y+K_H), CGPointMake(K_X, K_Y+K_H/2)};
    CGContextAddLines(context, points, 5);
    //填充
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    //绘制路径及填充模式
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end
