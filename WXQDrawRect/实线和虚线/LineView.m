//
//  LineView.m
//  WXQDrawRect
//
//  Created by WXQ on 2018/8/10.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "LineView.h"

#define K_HEIGHT      100.0
#define K_PDD_WIDTH   20.0
@implementation LineView

- (void)drawRect:(CGRect)rect {
    //画实线方法1
    [self firstDrawStraightLineWithRect:rect];
    //画实线方法2
    [self secondDrawStraightLineWithRect:rect];
    //画虚线
    [self drawImaginaryLineWithRect:rect];
}
//画实线方法1
- (void)firstDrawStraightLineWithRect:(CGRect)rect {
    //获得处理的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //线条宽
    CGContextSetLineWidth(context, 1.0);
    //线条颜色
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0); //设置线条颜色第一种方法
    //CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor); //设置线条颜色第一种方法
    //坐标点数组
    CGPoint aPoints[2];
    aPoints[0] = CGPointMake(K_PDD_WIDTH, K_HEIGHT);
    aPoints[1] = CGPointMake((rect.size.width - K_PDD_WIDTH), K_HEIGHT);
    //添加线 points[]坐标数组，和count大小
    CGContextAddLines(context, aPoints, 2);
    //根据坐标绘制路径
    CGContextDrawPath(context, kCGPathStroke);
}
//画实线方法2
- (void)secondDrawStraightLineWithRect:(CGRect)rect {
    //获得处理的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //线条宽
    CGContextSetLineWidth(context, 1.0);
    //线条颜色
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    //起点坐标
    CGContextMoveToPoint(context, K_PDD_WIDTH, K_HEIGHT*2);
    //终点坐标
    CGContextAddLineToPoint(context, (rect.size.width - K_PDD_WIDTH), K_HEIGHT*2);
    //绘制路径
    CGContextStrokePath(context);
}
//画虚线
- (void)drawImaginaryLineWithRect:(CGRect)rect {
    //获得处理的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //线条宽
    CGContextSetLineWidth(context, 2.0);
    //线条颜色
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    //画虚线
    CGFloat dashArray[] = {3, 1};//表示先画3个实点再画1个虚点，即实点多虚点少表示虚线点大且间隔小，实点少虚点多表示虚线点小且间隔大
    CGContextSetLineDash(context, 1, dashArray, 1);//最后的参数1代表排列的个数
    //起点坐标
    CGContextMoveToPoint(context, K_PDD_WIDTH, K_HEIGHT*3);
    //终点坐标
    CGContextAddLineToPoint(context, (rect.size.width - K_PDD_WIDTH), K_HEIGHT*3);
    //绘制路径
    CGContextStrokePath(context);
}
@end
