//
//  RectangleView.m
//  WXQDrawRect
//
//  Created by WXQ on 2018/8/13.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "RectangleView.h"

#define K_X   CGRectGetWidth(self.frame)/4
#define K_Y   20
#define K_W   CGRectGetWidth(self.frame)/2
#define K_H   CGRectGetWidth(self.frame)/3
@implementation RectangleView

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //背景颜色设置
    [[UIColor whiteColor] set];
    CGContextFillRect(context, rect);
    
    //画一个矩形-带边框，带填充
    //边框
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor brownColor].CGColor);
    CGFloat dashArray[] = {4, 4}; // 表示先画1个点再画4个点（前者小后者大时，虚线点小且间隔大；前者大后者小时，虚线点大且间隔小）
    CGContextSetLineDash(context, 1, dashArray, 2); // 其中的2表示dashArray中的值的个数
    //方法1 矩形起点-终点
    //        CGContextMoveToPoint(context, K_X, K_Y);
    //        CGContextAddLineToPoint(context, K_X+K_W, K_Y);
    //        CGContextAddLineToPoint(context, K_X+K_W, K_Y+K_H);
    //        CGContextAddLineToPoint(context, K_X, K_Y+K_H);
    //        CGContextAddLineToPoint(context, K_X, K_Y);
    //方法2 矩形起点-终点
    CGPoint pointsRect[5] = {CGPointMake(K_X, K_Y), CGPointMake(K_X+K_W, K_Y), CGPointMake(K_X+K_W, K_Y+K_H), CGPointMake(K_X, K_Y+K_H), CGPointMake(K_X, K_Y)};
    CGContextAddLines(context, pointsRect, 5);
    
    //填充
    CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
    //绘制路径及填充模式
    CGContextDrawPath(context, kCGPathFillStroke);
    
    //画一个矩形-带边框，无填充
    //边框
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    //方法1 矩形起点-终点
    //        CGPoint pointsRect2[5] = {CGPointMake(K_X, K_Y*2+K_H), CGPointMake(K_X+K_W, K_Y*2+K_H), CGPointMake(K_X+K_W, K_Y*2+K_H*2), CGPointMake(K_X, K_Y*2+K_H*2), CGPointMake(K_X, K_Y*2+K_H)};
    //        CGContextAddLines(context, pointsRect2, 5);
    //方法2
    //        CGContextAddRect(context, CGRectMake(K_X, K_Y*2+K_H, K_W, K_H));
    //方法3
    CGContextStrokeRect(context, CGRectMake(K_X, K_Y*2+K_H, K_W, K_H));
    
    //方法1 绘制路径及填充模式
    //    CGContextDrawPath(context, kCGPathStroke);
    //方法2 绘制路径
    CGContextStrokePath(context);
    
    //画一个矩形-无边框，带填充
    CGContextSetFillColorWithColor(context, [UIColor purpleColor].CGColor);
    //方法1 填充
    //    CGContextFillRect(context, CGRectMake(K_X, K_Y*3+K_H*2, K_W, K_H)));
    //方法2
    CGContextAddRect(context, CGRectMake(K_X, K_Y*3+K_H*2, K_W, K_H));
    CGContextDrawPath(context, kCGPathFill);
}


@end
