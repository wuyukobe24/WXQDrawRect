//
//  EllipseView.m
//  WXQDrawRect
//
//  Created by WXQ on 2018/8/13.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "EllipseView.h"

#define K_H    100.0
#define K_PDD  10.0
@implementation EllipseView

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //背景颜色设置
    [[UIColor whiteColor] set];
    CGContextFillRect(context, rect);
    
    //实线椭圆
    CGRect rectRing = CGRectMake(K_PDD, K_PDD, (rect.size.width - K_PDD * 2), K_H);
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextAddEllipseInRect(context, rectRing);
    CGContextDrawPath(context, kCGPathStroke);
    
    //虚线椭圆
    rectRing = CGRectMake(K_PDD, K_H+K_PDD*2, (rect.size.width - K_PDD * 2), K_H);
    CGFloat dashArray[] = {2, 6};
    CGContextSetLineDash(context, 1, dashArray, 2);
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    //填充颜色
    CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
    CGContextAddEllipseInRect(context, rectRing);
    CGContextDrawPath(context, kCGPathStroke);
    CGContextFillPath(context);
    
    //填充椭圆
    rectRing = CGRectMake(K_PDD, K_H*2+K_PDD*3, (rect.size.width - K_PDD * 2), K_H);
    CGContextSetLineWidth(context, 1.0);
    //填充颜色
    CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
    CGContextAddEllipseInRect(context, rectRing);
    CGContextFillPath(context);
}

@end
