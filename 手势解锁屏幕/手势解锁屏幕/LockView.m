//
//  LockView.m
//  手势解锁屏幕
//
//  Created by 李宏贵 on 16/7/14.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "LockView.h"
@interface LockView()

@property(nonatomic,strong) NSMutableArray *muta;
@property(nonatomic,assign) CGPoint nowButton;
@end
@implementation LockView
//懒加载
-(NSMutableArray *)muta
{
    if (nil ==_muta) {
        _muta = [NSMutableArray array];

    }
    return _muta;
}

#pragma mark
#pragma mark -  创建按钮
-(void)awakeFromNib
{
    //创建9个按钮
    for (int i =0; i< 9; i++) {

        //实例化按钮
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置按钮图片
        [button setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        //添加到 View 上
        [self addSubview:button];

        #warning 禁止用户交互
        button.userInteractionEnabled = NO;
        button.tag = i;
    }

}

#pragma mark
#pragma mark -  设置按钮的 Frame 只设置 Frame 不可 addSubview
-(void)layoutSubviews
{
    [super layoutSubviews];

    //获取 LockView 的 Frame
    CGSize superSize = self.frame.size;

    //设置 列=行

    NSInteger row = 3;
    NSInteger buttonWidth = 74;
    //设置间距
    CGFloat margin = (superSize.width - buttonWidth*row)/4;

    //行数
    for (int i= 0; i < self.subviews.count; i++) {

        NSInteger rowX = i/row;
        NSInteger rowY = i % row;
        //Button.x

        CGFloat buttonX = margin*(rowY+1) +buttonWidth*rowY;
        CGFloat buttonY = margin*(rowX +1) + buttonWidth*rowX;


//        ButtonView.backgroundColor = [UIColor redColor];
        UIButton * button = self.subviews[i];
        button.frame = CGRectMake(buttonX, buttonY, buttonWidth, buttonWidth);

    }


}

#pragma mark
#pragma mark -  手指点按
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // touch 任何对象
    UITouch *touch = touches.anyObject;
    //当前的点
    CGPoint location = [touch locationInView:touch.view];

    /*------判断点是否在Button 上------*/
    for (int i = 0; i<self.subviews.count; i++){
        //获取按钮
        UIButton *button = self.subviews[i];
        //当前的点在按钮范围内
        if (CGRectContainsPoint(button.frame, location)&& ! (button.selected)) {
            button.selected = YES;

            //把当前的点添加到数组中
            [self.muta addObject:button];
            break;
        }
    }

}

#pragma mark
#pragma mark -  手指移动
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    //收集移动的点
    self.nowButton = [touch locationInView:touch.view];

    [self touchesBegan:touches withEvent:event];

    //重绘

    [self setNeedsDisplay];
}

#pragma mark
#pragma mark -  手指离开屏幕
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //设置最后一个点是 Button 的中心点
    self.nowButton = [self.muta.lastObject center];

    //获取密码
    NSMutableString *passWord = [NSMutableString string];
    //遍历
    for (UIButton *button in self.muta) {
        [passWord appendFormat:@"%@",@(button.tag)];
    }

    [self setNeedsDisplay];
    //打印密码
    NSLog(@"%@",passWord);
    #warning 调用代理
    if ([self.delegate respondsToSelector:@selector(lockView:andWith:)]) {
        [self.delegate lockView:self andWith:nil];
    }

    for (UIButton *button in self.muta) {
        button.selected = NO;
    }

    //移除
    [self.muta removeAllObjects];
        //执行重绘
    [self setNeedsDisplay];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //没选就什么也不打印
    if (self.muta.count ==0) {
        return;
    }
    //绘画路径
    UIBezierPath *path =[ UIBezierPath bezierPath];

    path.lineWidth = 5;
    //线头样式
    path.lineCapStyle = kCGLineCapRound;
    //连接处样式
    path.lineJoinStyle = kCGLineJoinRound;
    [[UIColor whiteColor]set];

    //设置子路径
    for (int i=0; i<self.muta.count; i++) {
        //获取点按钮
        UIButton *button = self.muta[i];
        //设置点在按钮的中心
        CGPoint point = button.center;

        if (i ==0) {
            [path moveToPoint:point];
        }else
        {
            [path addLineToPoint:point];
        }
    }
    [path addLineToPoint:self.nowButton];
    [path stroke];
}


@end
