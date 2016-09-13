//
//  ViewController.m
//  汤姆猫
//
//  Created by 李宏贵 on 16/7/18.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)drinkMilk:(UIButton *)sender;
- (IBAction)didCymbal:(UIButton *)sender;
- (IBAction)didEat:(UIButton *)sender;
- (IBAction)didFart:(UIButton *)sender;
- (IBAction)didPie:(UIButton *)sender;
- (IBAction)didScratch:(UIButton *)sender;
- (IBAction)leftFoot:(UIButton *)sender;
- (IBAction)rightFoot:(UIButton *)sender;
- (IBAction)hitHead:(UIButton *)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark
#pragma mark -  喝牛奶
- (IBAction)drinkMilk:(UIButton *)sender {
    #warning 可变数组一定在 for循环之前
//    NSMutableArray *muta = [NSMutableArray array];
//    /*------for循环------*/
//    for (int i = 0; i< 81; i++) {
//        NSString *name = [NSString stringWithFormat:@"drink_%02d",i];
//
//
//        UIImage *imageName = [UIImage imageNamed:name];
//         [muta addObject:imageName];
//
//    }
//    self.imageView.animationImages =muta;
//    //设置动画时间--->每个图片显示0.1s
//    self.imageView.animationDuration = self.imageView.animationImages.count*0.2;
//    self.imageView.animationDuration = 1;
//    self.imageView.animationRepeatCount = 1;
//#warning 开启动画
//    [self.imageView startAnimating];
    [self animation:81 WithName:@"drink"];
}
#pragma mark
#pragma mark -  play cymbal(钹)
- (IBAction)didCymbal:(UIButton *)sender {
    //创建可变数组
//    NSMutableArray *mutb = [NSMutableArray array];
//    //for循环
//    for (int i = 0; i <12; i++) {
//        //拼接图片
//        NSString *name = [NSString stringWithFormat:@"cymbal_%02d",i];
//        //加载图片
//        UIImage *imageName = [UIImage imageNamed:name];
//        //图片放到可遍数组中
//        [mutb addObject:imageName];
//    }
//    //可遍数组数据----> animationImages
//    self.imageView.animationImages =mutb ;
//    self.imageView.animationDuration = self.imageView.animationImages.count*0.1;
//    self.imageView.animationDuration = 1;
//    self.imageView.animationRepeatCount = 1;
//    [self.imageView startAnimating];
    [self animation:12 WithName:@"cymbal"];
}

#pragma mark
#pragma mark -  吃
- (IBAction)didEat:(UIButton *)sender {
//    NSMutableArray *mutb = [NSMutableArray array];
//    for (int i=0; i < 39; i++) {
//        NSString *name = [NSString stringWithFormat:@"eat_%02d",i];
//        UIImage *imageName = [UIImage imageNamed:name];
//        [mutb addObject:imageName];
//
//    }
//    self.imageView.animationDuration = self.imageView.animationImages.count*0.1;
//    self.imageView.animationImages = mutb;
//    self.imageView.animationRepeatCount = 1;
//    [self.imageView startAnimating];
    [self animation:39 WithName:@"eat"];
}

#pragma mark
#pragma mark -  放屁
- (IBAction)didFart:(UIButton *)sender {
//    NSMutableArray *mutb = [NSMutableArray array];
//    for (int i = 0; i <27; i++) {
//        NSString *name = [NSString stringWithFormat:@"fart_%02d",i];
//        UIImage *imageName = [UIImage imageNamed:name];
//        [mutb addObject:imageName];
//
//    }
//
//    self.imageView.animationImages = mutb;
//    self.imageView.animationDuration =self.imageView.animationImages.count*0.1;
//    self.imageView.animationRepeatCount = 1;
//    [self.imageView startAnimating];
    [self animation:27 WithName:@"fart"];
}
#pragma mark
#pragma mark -  馅饼
- (IBAction)didPie:(UIButton *)sender {
//    NSMutableArray *mutb = [NSMutableArray array];
//    for (int i = 0; i <23; i++) {
//        NSString *name = [NSString stringWithFormat:@"pie_%02d",i];
//        UIImage *imageName = [UIImage imageNamed:name];
//        [mutb addObject:imageName];
//
//    }
//    self.imageView.animationImages = mutb;
//    self.imageView.animationDuration = self.imageView.animationImages.count*0.1;
//    self.imageView.animationRepeatCount = 1;
//    [self.imageView startAnimating];
    [self animation:23 WithName:@"pie"];
}

#pragma mark
#pragma mark -  抓痕
- (IBAction)didScratch:(UIButton *)sender {
//    NSMutableArray *mutb = [NSMutableArray array];
//    for (int i = 0; i<55; i++) {
//        NSString *name = [NSString stringWithFormat:@"scratch_%02d",i];
//        UIImage *imageName = [UIImage imageNamed:name];
//        [mutb addObject:imageName];
//
//    }
//    self.imageView.animationImages =mutb;
//    self.imageView.animationDuration =self.imageView.animationImages.count*0.1;
//    self.imageView.animationRepeatCount = 1;
//    [self.imageView startAnimating];
    [self animation:55 WithName:@"scratch"];
}

#pragma mark
#pragma mark -  踩左脚
- (IBAction)leftFoot:(UIButton *)sender {
//    NSMutableArray *mutb = [NSMutableArray array];
//    for (int i= 0; i<29; i++) {
//        NSString *name = [NSString stringWithFormat:@"footLeft_%02d",i];
//        UIImage *imageName = [UIImage imageNamed:name];
//        [mutb addObject:imageName];
//
//
//    }
//    self.imageView.animationImages = mutb;
//    self.imageView.animationDuration = self.imageView.animationImages.count*0.1;
//    self.imageView.animationRepeatCount=1;
//    [self.imageView startAnimating];
    [self animation:29 WithName:@"footLeft"];
}

#pragma mark
#pragma mark -  踩右脚
- (IBAction)rightFoot:(UIButton *)sender {
//    NSMutableArray *mutb = [NSMutableArray array];
//    for (int i= 0; i<29; i++) {
//        NSString *name = [NSString stringWithFormat:@"footRight_%02d",i];
//        UIImage *imageName = [UIImage imageNamed:name];
//        [mutb addObject:imageName];
//
//    }
//    self.imageView.animationImages = mutb;
//    self.imageView.animationDuration = self.imageView.animationImages.count*0.1;
//    self.imageView.animationRepeatCount=1;
//    [self.imageView startAnimating];
    [self animation:29 WithName:@"footRight"];
}

#pragma mark
#pragma mark -  打头
- (IBAction)hitHead:(UIButton *)sender {
    [self animation:81 WithName:@"knockout"];
}

#pragma mark
#pragma mark -  封装
-(void)animation:(int)number WithName:(NSString *)name
{
    //播放动画时,不可再点击
    if (self.imageView.isAnimating) {
        return;
    }

    NSMutableArray *mutb = [NSMutableArray array];
    for (int i=0; i<number; i++) {
        //拼接图片
        NSString *string = [NSString stringWithFormat:@"%@_%02d.jpg",name,i];
        NSString *path =[[NSBundle mainBundle]pathForResource:string ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [mutb addObject:image];


    }
    self.imageView.animationImages = mutb;
    self.imageView.animationDuration = self.imageView.animationImages.count*0.1;
    self.imageView.animationRepeatCount=1;
    [self.imageView startAnimating];

    #warning 延迟清理内存
    [self.imageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.imageView.animationImages.count*0.1];

}
@end
