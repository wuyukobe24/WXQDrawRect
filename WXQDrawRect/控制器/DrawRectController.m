//
//  DrawRectController.m
//  WXQDrawRect
//
//  Created by WXQ on 2018/8/10.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "DrawRectController.h"
#import "LineView.h"
#import "TextView.h"
#import "ImageView.h"
#import "ImageCircleView.h"
#import "CircleView.h"
#import "EllipseView.h"
#import "FanshapedView.h"
#import "SquareView.h"
#import "RectangleView.h"
#import "RhombusView.h"
#import "CurveView.h"
#import "ChangeView.h"


#define K_Screen_Width               [UIScreen mainScreen].bounds.size.width
#define K_Screen_Height              [UIScreen mainScreen].bounds.size.height
@interface DrawRectController ()
@property(nonatomic,strong)LineView * line;
@property(nonatomic,strong)TextView * text;
@property(nonatomic,strong)ImageView * image;
@property(nonatomic,strong)ImageCircleView * circle;
@property(nonatomic,strong)CircleView * cir;
@property(nonatomic,strong)EllipseView * ell;
@property(nonatomic,strong)FanshapedView * fan;
@property(nonatomic,strong)SquareView * squ;
@property(nonatomic,strong)RectangleView * rec;
@property(nonatomic,strong)RhombusView * rho;
@property(nonatomic,strong)CurveView * cur;
@property(nonatomic,strong)ChangeView * change;
@end

@implementation DrawRectController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    switch (self.indexPath.row) {
        case 0: [self.view addSubview:self.line]; break;
        case 1: [self.view addSubview:self.text]; break;
        case 2: [self.view addSubview:self.image]; break;
        case 3: [self.view addSubview:self.circle]; break;
        case 4: [self.view addSubview:self.cir]; break;
        case 5: [self.view addSubview:self.ell]; break;
        case 6: [self.view addSubview:self.fan]; break;
        case 7: [self.view addSubview:self.squ]; break;
        case 8: [self.view addSubview:self.rec]; break;
        case 9: [self.view addSubview:self.rho]; break;
        case 10: [self.view addSubview:self.cur]; break;
        case 11: [self.view addSubview:self.change]; break;
        default: break;
    }
}
//绘制直线和虚线
- (LineView *)line {
    if (!_line) {
        _line = [[LineView alloc]initWithFrame:self.view.frame];
        _line.backgroundColor = [UIColor whiteColor];
    }
    return _line;
}
//绘制文本
- (TextView *)text {
    if (!_text) {
        _text = [[TextView alloc]initWithFrame:CGRectMake(0, 100, K_Screen_Width, K_Screen_Height-100)];
        _text.backgroundColor = [UIColor whiteColor];
    }
    return _text;
}
//绘制图片
- (ImageView *)image {
    if (!_image) {
        _image = [[ImageView alloc]initWithFrame:CGRectMake(0, 64, K_Screen_Width, K_Screen_Height)];
        _image.backgroundColor = [UIColor darkGrayColor];
    }
    return _image;
}
//绘制圆形图片
- (ImageCircleView *)circle {
    if (!_circle) {
        _circle = [[ImageCircleView alloc]initWithFrame:CGRectMake(0, 64, K_Screen_Width, K_Screen_Width)];
        _circle.backgroundColor = [UIColor darkGrayColor];
    }
    return _circle;
}
//绘制圆形
- (CircleView *)cir {
    if (!_cir) {
        _cir = [[CircleView alloc]initWithFrame:CGRectMake(0, 64, K_Screen_Width, K_Screen_Height-64)];
//        _cir.backgroundColor = [UIColor whiteColor];
    }
    return _cir;
}
//绘制椭圆形
- (EllipseView *)ell {
    if (!_ell) {
        _ell = [[EllipseView alloc]initWithFrame:CGRectMake(0, 64, K_Screen_Width, K_Screen_Height-64)];
    }
    return _ell;
}
//绘制扇形
- (FanshapedView *)fan {
    if (!_fan) {
        _fan = [[FanshapedView alloc]initWithFrame:CGRectMake(0, 64, K_Screen_Width, K_Screen_Height-64)];
    }
    return _fan;
}
//绘制正方形
- (SquareView *)squ {
    if (!_squ) {
        _squ = [[SquareView alloc]initWithFrame:CGRectMake(0, 64, K_Screen_Width, K_Screen_Height-64)];
    }
    return _squ;
}
//绘制矩形
- (RectangleView *)rec {
    if (!_rec) {
        _rec = [[RectangleView alloc]initWithFrame:CGRectMake(0, 64, K_Screen_Width, K_Screen_Height-64)];
    }
    return _rec;
}
//绘制菱形
- (RhombusView *)rho {
    if (!_rho) {
        _rho = [[RhombusView alloc]initWithFrame:CGRectMake(0, 64, K_Screen_Width, K_Screen_Height-64)];
    }
    return _rho;
}
//曲线和弧线
- (CurveView *)cur {
    if (!_cir) {
        _cur = [[CurveView alloc]initWithFrame:CGRectMake(0, 64, K_Screen_Width, K_Screen_Height-64)];
    }
    return _cur;
}

//渐变背景颜色
- (ChangeView *)change {
    if (!_change) {
        _change = [[ChangeView alloc]initWithFrame:CGRectMake(0, 64, K_Screen_Width, K_Screen_Height-64)];
    }
    return _change;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
