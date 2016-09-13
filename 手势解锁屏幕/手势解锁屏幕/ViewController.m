//
//  ViewController.m
//  手势解锁屏幕
//
//  Created by 李宏贵 on 16/7/14.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "ViewController.h"
#import "LockView.h"
@interface ViewController ()<LockViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet LockView *LockViewImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //设置背景图片
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Home_refresh_bg"]];
    #warning 实现代理
    self.LockViewImage.delegate = self;

}

#pragma mark
#pragma mark -  代理
-(void)lockView:(LockView *)lockViewDraw andWith:(NSString *)passWord
{

    //开启上下文
    UIGraphicsBeginImageContextWithOptions(self.LockViewImage.frame.size, NO, 0.0);
    //获取图形上下文
    CGContextRef view = UIGraphicsGetCurrentContext();

    //把获取的图形--->layer--->renderInContext 绘图传到图形上下文中
    [self.LockViewImage.layer renderInContext:view];
    //获取图片
    UIImage *getImage = UIGraphicsGetImageFromCurrentImageContext();
    //结束图形上下文
    UIGraphicsEndImageContext();
    self.imageView.image = getImage;

    //保存图片
    UIImageWriteToSavedPhotosAlbum(getImage, self, nil, nil);
    //打印密码
//    NSLog(@"%@",passWord);
}
//-(void)//- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
//{
//
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
