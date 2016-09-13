//
//  ViewController.m
//  城市选择系统
//
//  Created by 李宏贵 on 16/6/29.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "ViewController.h"
#import "CityModel.h"
@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UILabel *provinceLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;

#warning 保存上一次显示的省的模型
@property(nonatomic,strong) CityModel *cityModel;
@end

@implementation ViewController
#pragma mark
#pragma mark -  懒加载
-(NSArray *)dataArray
{
    if (nil ==_dataArray) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"02cities.plist" ofType:nil];
        NSArray *tempArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *mutab = [NSMutableArray array];
        for (NSDictionary *dict in tempArray) {
            CityModel *cityModel = [CityModel cityModelWithDict:dict];
            [mutab addObject:cityModel];
        }
        _dataArray = mutab;
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    //设置代理
    _pickView.delegate = self;
    _pickView.dataSource = self;
    [self pickerView:self.pickView didSelectRow:0 inComponent:1 ];
}
#pragma mark
#pragma mark -  返回组内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //如果是0列那就是省 第1列就是市
    if (component ==0) {
        CityModel *cityModel = self.dataArray[row];
        return cityModel.name;
    }
    else
    {
//        //先取出对应的省
//        NSInteger proviceNumber =  [pickerView selectedRowInComponent:0];
//        //市
//        CityModel *cityModel = self.dataArray[proviceNumber];
//        NSArray *city = cityModel.cities;
//        return city[row];
        #warning 直接返回对应的 row
        return self.cityModel.cities[row];
    }

}
#pragma mark
#pragma mark -  选中省对应的城市
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //如果是0列
    if (component ==0) {
        //刷新城市
        [pickerView reloadComponent:1];
        //刷新城市后,显示第一个
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
        /**
         显示省市到 Label
         */

        //取出省
        NSInteger  selectProvince =  [pickerView selectedRowInComponent:0];
        //取出市
        NSInteger selectCity = [pickerView selectedRowInComponent:1];
        //设置省
        CityModel *province = self.dataArray[selectProvince];
        _provinceLabel.text = province.name;
        //设置市
//        _cityLabel.text = province.cities[selectCity];
    _cityLabel.text = self.cityModel.cities[selectCity];

}
#pragma mark
#pragma mark -  组数(代表的是 section
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    #warning return self.data.count 返回的是省的数量 34
    NSLog(@"%ld",self.dataArray.count);

    return 2;
}
#pragma mark
#pragma mark -  行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{

    //0列
    if (component == 0) {
        return self.dataArray.count;
    }else
    {
        //根据0列省确定城市的数量
         NSInteger proviceNumber =  [pickerView selectedRowInComponent:0];
        CityModel *cityModel = self.dataArray[proviceNumber];
        #warning 保存省的模型
        self.cityModel = cityModel;


//
//        return cityModel.cities.count;
        return self.cityModel.cities.count;
    }
}
@end
