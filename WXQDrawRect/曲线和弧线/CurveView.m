//
//  CurveView.m
//  WXQDrawRect
//
//  Created by WXQ on 2018/8/13.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "CurveView.h"

#define K_PDD  50.0
@implementation CurveView

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //背景颜色设置
    [[UIColor whiteColor] set];
    CGContextFillRect(context, rect);
    
    //弧线
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    //起点
    CGContextMoveToPoint(context, K_PDD, K_PDD);
    //设置贝塞尔曲线的控制点坐标{cp1x,cp1y} 终点坐标{x,y}
    CGContextAddQuadCurveToPoint(context, (rect.size.width/2), K_PDD*4, (rect.size.width - K_PDD), K_PDD*2);
    //绘制前设置边框和填充颜色
    [[UIColor redColor] setStroke];
    [[UIColor darkGrayColor] setFill];
    CGContextDrawPath(context, kCGPathFillStroke);
    
    //曲线
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    //起点坐标
    CGContextMoveToPoint(context, K_PDD, K_PDD*8);
    //设置贝塞尔曲线的控制点坐标{cp1x,cp1y} 控制点坐标{cp2x,cp2y} 终点坐标{x,y}
    CGContextAddCurveToPoint(context, 100.0, 100.0, 200.0, 500.0, (rect.size.width - 10.0), K_PDD*6);
    //绘制前设置边框和填充颜色
    [[UIColor redColor] setStroke];
    [[UIColor darkGrayColor] setFill];
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end
