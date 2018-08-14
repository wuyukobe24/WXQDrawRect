//
//  FanshapedView.m
//  WXQDrawRect
//
//  Created by WXQ on 2018/8/13.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "FanshapedView.h"

#define K_PDD  10.0
@implementation FanshapedView

- (void)drawRect:(CGRect)rect {
    CGFloat R = (CGRectGetWidth(self.frame)-K_PDD*2)/2;
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //背景颜色设置
    [[UIColor whiteColor] set];
    CGContextFillRect(context, rect);
    
    //实线扇形-顺时针-有边框，有填充
    //边框宽度
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextMoveToPoint(context, R, R);
    //填充颜色
    CGContextSetFillColorWithColor(context, [UIColor purpleColor].CGColor);
    CGContextAddArc(context, R, R, R/2, (-60 * M_PI / 180), (-120 * M_PI / 180), 1);//如果圆弧是顺时针画的，“clockwise”是1，否则是0;
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    //实线扇形-逆时针-有边框，有填充
    //边框宽度
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextMoveToPoint(context, R, R*2);
    //填充颜色
    CGContextSetFillColorWithColor(context, [UIColor purpleColor].CGColor);
    CGContextAddArc(context, R, R*2, R/2, (-60 * M_PI / 180), (-120 * M_PI / 180), 0);//如果圆弧是顺时针画的，“clockwise”是1，否则是0;
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end
