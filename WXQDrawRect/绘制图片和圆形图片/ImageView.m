//
//  ImageView.m
//  WXQDrawRect
//
//  Created by WXQ on 2018/8/10.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "ImageView.h"

@implementation ImageView


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //保存初始状态（压栈操作，保存一份当前图形上下文）
    CGContextSaveGState(context);
    //图形上下文移动{x,y}
    CGContextTranslateCTM(context, 50.0, 80.0);
    //图形上下文缩放{x,y}
    CGContextScaleCTM(context, 0.9, 0.9);
    //旋转
    CGContextRotateCTM(context, M_PI_4 / 4);
    //需要绘制的图片
    UIImage *image = [UIImage imageNamed:@"512"];
    CGRect rectImage = CGRectMake(0.0, 0.0, rect.size.width, (rect.size.width*image.size.height/image.size.width));
    //三种方式绘制图片
    // 1、在rect范围内完整显示图片-正常使用
        [image drawInRect:rectImage];
    // 2、图片上下颠倒
//        CGContextDrawImage(context, rectImage, image.CGImage);
    // 3、图片上下颠倒并拼接填充
//    CGContextDrawTiledImage(context, rectImage, image.CGImage);
    //恢复到初始状态（出栈操作，恢复一份当前图形上下文）
    CGContextRestoreGState(context);
}


@end
