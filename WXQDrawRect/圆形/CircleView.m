//
//  CircleView.m
//  WXQDrawRect
//
//  Created by WXQ on 2018/8/13.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "CircleView.h"

#define K_R    150.0
#define K_PDD  10.0
@implementation CircleView

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //背景颜色设置
    [[UIColor greenColor] set];
    CGContextFillRect(context, rect);
    //实线圆,无填充
    CGRect rectRing = CGRectMake(K_PDD, K_PDD, K_R, K_R);
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextAddEllipseInRect(context, rectRing);
    CGContextDrawPath(context, kCGPathStroke);
    
    //虚线圆,无填充
    rectRing = CGRectMake(CGRectGetWidth(self.frame)-K_R-K_PDD, K_PDD, K_R, K_R);
    CGContextSetLineWidth(context, 1.0);
    //画虚线
    CGFloat dashArray[] = {3, 1};//表示先画3个点再画1个点（前者小后者大时，虚线点小且间隔大；前者大后者小时，虚线点大且间隔小）
    CGContextSetLineDash(context, 1, dashArray, 1);//最后的参数1代表排列的个数
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextAddEllipseInRect(context, rectRing);
    CGContextDrawPath(context, kCGPathStroke);
    
    //虚线圆-有边框，有填充
    //边框宽度
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    //填充颜色方法一
    CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
    /**
    //CGContextAddArc(CGContextRef cg_nullable c, CGFloat x, CGFloat y, 0CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
    //(x, y)是圆弧的中心;
    //“radius”是它的半径;
    //“startAngle”是与圆弧第一个端点的夹角;
    //‘endAngle’是到弧的第二个端点的角度;
    //“startAngle”和“endAngle”用弧度表示。
    //如果圆弧是顺时针画的，“clockwise”是1，否则是0;
     */
    CGContextAddArc(context,
                    K_PDD+K_R/2, K_R*2+20, K_R/2, 0, 2 * M_PI, 0);
    //枚举：kCGPathFill填充非零绕数规则,kCGPathEOFill表示用奇偶规则,kCGPathStroke路径,kCGPathFillStroke路径填充,kCGPathEOFillStroke描线
    CGContextDrawPath(context, kCGPathFillStroke);
    
    //实线圆-无边框，有填充
    rectRing = CGRectMake(CGRectGetWidth(self.frame)-K_R-K_PDD, K_R*3/2+20, K_R, K_R);
    CGContextAddEllipseInRect(context, rectRing);
    //填充颜色方法二
    [[UIColor blueColor] set];
    CGContextFillPath(context);
}


@end
