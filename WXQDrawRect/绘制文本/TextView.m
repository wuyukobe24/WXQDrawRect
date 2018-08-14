//
//  TextView.m
//  WXQDrawRect
//
//  Created by WXQ on 2018/8/10.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "TextView.h"

@implementation TextView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.label];
    }
    return self;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.backgroundColor = [UIColor lightGrayColor];
        _label.numberOfLines = 0;
    }
    return _label;
}

- (void)layoutSubviews {
    self.label.frame = CGRectMake(0, 250, CGRectGetWidth(self.frame), 150);
}

- (void)drawRect:(CGRect)rect {
    NSString * text = @"这是一段绘制文本、这是一段绘制文本、这是一段绘制文本、这是一段绘制文本、这是一段绘制文本、这是一段绘制文本、这是一段绘制文本";
    //文本段落样式
    NSMutableParagraphStyle * textStyle = [[NSMutableParagraphStyle alloc] init];
    textStyle.lineBreakMode = NSLineBreakByWordWrapping;//结尾部分的内容以……方式省略 ( "...wxyz" ,"abcd..." ,"ab...yz")
    textStyle.alignment = NSTextAlignmentLeft;//文本对齐方式：（左，中，右，两端对齐，自然）
    textStyle.lineSpacing = 8; //字体的行间距
    textStyle.firstLineHeadIndent = 35.0; //首行缩进
    textStyle.headIndent = 0.0; //整体缩进(首行除外)
    textStyle.tailIndent = 0.0; //尾部缩进
    textStyle.minimumLineHeight = 40.0; //最低行高
    textStyle.maximumLineHeight = 40.0; //最大行高
    textStyle.paragraphSpacing = 15; //段与段之间的间距
    textStyle.paragraphSpacingBefore = 22.0f; // 段首行空白空间
    textStyle.baseWritingDirection = NSWritingDirectionLeftToRight; //从左到右的书写方向
    textStyle.lineHeightMultiple = 15;
    textStyle.hyphenationFactor = 1; //连字属性 在iOS，唯一支持的值分别为0和1
    //文本属性
    NSMutableDictionary *textAttributes = [[NSMutableDictionary alloc] init];
    //段落样式
    [textAttributes setValue:textStyle forKey:NSParagraphStyleAttributeName];
    //字体名称和大小
    [textAttributes setValue:[UIFont systemFontOfSize:20.0] forKey:NSFontAttributeName];
    //颜色
    [textAttributes setValue:[UIColor redColor] forKey:NSForegroundColorAttributeName];
    //绘制文字
    [text drawInRect:rect withAttributes:textAttributes];
    self.label.text = text;
}

@end
