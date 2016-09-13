//
//  LockView.h
//  手势解锁屏幕
//
//  Created by 李宏贵 on 16/7/14.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import <UIKit/UIKit.h>

#warning 设置代理
@class LockView;
@protocol LockViewDelegate <NSObject>

-(void) lockView:(LockView *)lockViewDraw andWith:(NSString *)passWord;


@end
@interface LockView : UIView

@property(nonatomic,weak) id <LockViewDelegate>delegate;

@end
