//
//  CityModel.m
//  城市选择系统
//
//  Created by 李宏贵 on 16/6/29.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "CityModel.h"

@implementation CityModel


-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)cityModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
