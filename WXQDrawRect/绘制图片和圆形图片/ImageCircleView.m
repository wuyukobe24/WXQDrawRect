//
//  ImageCircleView.m
//  WXQDrawRect
//
//  Created by WXQ on 2018/8/13.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "ImageCircleView.h"

@implementation ImageCircleView

- (void)drawRect:(CGRect)rect {
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //画一个上下文显示的区域
    //CGContextAddArc(CGContextRef cg_nullable c, CGFloat x, CGFloat y, 0CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
    //(x, y)是圆弧的中心;
    //“radius”是它的半径;
    //“startAngle”是与圆弧第一个端点的夹角;
    //‘endAngle’是到弧的第二个端点的角度;
    //“startAngle”和“endAngle”用弧度表示。
    //如果圆弧是顺时针画的，“clockwise”是1，否则是0;
    CGContextAddArc(context, rect.size.width/2, rect.size.height/2, rect.size.width/2, 0, 2 *M_PI, 1);
    //裁剪上下文的显示区域
    CGContextClip(context);
    //获取图片
    UIImage* image1 = [UIImage imageNamed:@"512"];
    //绘制到上下文上
    [image1 drawInRect:rect];
}
/**
 图片剪裁成圆形的思路：
 1、获取 UIView 的图形上下文对象
 2、在上下文对象上绘制一个圆形路径
 3、执行裁剪操作（裁剪的意思是告诉系统，将来只有在被裁减出的区域内绘制的图形才会显示）
 4、把图片绘制到上下文上（直接调用 UIImage 对象的绘图方法即可）
 */
@end
