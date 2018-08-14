# WXQDrawRect
利用drawRect方法绘制图形

绘制虚线代码：
----
```
#define K_HEIGHT      100.0
#define K_PDD_WIDTH   20.0
- (void)drawRect:(CGRect)rect {
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
```
虚线效果：

![虚线](https://github.com/wuyukobe24/WXQDrawRect/blob/master/5.png)

绘制圆形代码：
----
```
#define K_R    150.0
#define K_PDD  10.0
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //背景颜色设置
    [[UIColor greenColor] set];
    CGContextFillRect(context, rect);
    CGContextSetLineWidth(context, 2.0);
    //画虚线
    CGFloat dashArray[] = {3, 1};
    CGContextSetLineDash(context, 1, dashArray, 1);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
    CGContextAddArc(context,
                    K_PDD+K_R/2, K_R*2+20, K_R/2, 0, 2 * M_PI, 0);
    CGContextDrawPath(context, kCGPathFillStroke);
}
```

圆形效果：

![圆形](https://github.com/wuyukobe24/WXQDrawRect/blob/master/3.png)

其他效果请参考demo
----
