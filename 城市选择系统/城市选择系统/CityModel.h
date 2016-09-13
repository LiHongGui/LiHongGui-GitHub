//
//  CityModel.h
//  城市选择系统
//
//  Created by 李宏贵 on 16/6/29.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityModel : NSObject
@property(nonatomic,strong) NSArray *cities;

@property(nonatomic,copy) NSString *name;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)cityModelWithDict:(NSDictionary *)dict;
@end
