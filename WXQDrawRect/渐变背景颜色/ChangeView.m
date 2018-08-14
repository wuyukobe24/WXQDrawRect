//
//  ChangeView.m
//  WXQDrawRect
//
//  Created by WXQ on 2018/8/13.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "ChangeView.h"

@implementation ChangeView

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClip(context);
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] = {
        200.0 / 255.0, 224.0 / 255.0, 244.0 / 0.0, 1.00,
        100.0 / 255.0, 156.0 / 255.0, 215.0 / 100.0, 1.00,
        0.0 / 255.0,  50.0 / 255.0, 126.0 / 200.0, 1.00,
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors) / (sizeof(colors[0]) * 4));
    CGColorSpaceRelease(rgb);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0.0,0.0), CGPointMake(0.0, rect.size.height), kCGGradientDrawsBeforeStartLocation);
}

@end
