//
//  HHDataManager.h
//  HHWeather
//
//  Created by 胡传业 on 15/3/19.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  该单实例对象负责请求天气数据
 *  对请求到的天气数据载入天气模型
 *  保存天气数据
 *
 */
@interface HHDataManager : NSObject 

@property (nonatomic) UITableView *tableView;

// 需要请求数据的城市
@property (nonatomic, strong) NSMutableArray *requestedCities;

// 用户在搜索栏目添加的城市
@property (nonatomic, strong) NSMutableArray *addedRequestedCities;

// 请求的天气数据字典
@property (nonatomic, copy) NSDictionary *weatherDic;

// 请求的空气数据字典
@property (nonatomic, copy) NSDictionary *pmDic;

+ (instancetype) sharedDataManager;


// 对需要天气信息的城市属性的增删方法
- (void) addCity:(NSString *)cityName;
- (void) removeCity:(NSString *)cityName;
//- (BOOL) changeOrderForCity:(NSString *) toIndex:(NSInteger)index;

// Request for weather data
/**
 *  请求某个城市 3天的天气状况数据及空气质量数据
 *  并把数据载入天气模型
 *
 *  @param cityName 城市名
 */
- (void) requestWeatherDataForCity:(NSString *)cityName;

- (NSString *) dateFor:(NSString *)day;

- (void) initializeWeatherModel;

/**
 *  依据天气字符串，判断当前天气类型
 *
 *  @param string 天气字符串
 *
 *  @return 天气图标名
 */
- (NSString *) typeForWeather:(NSString *)string;

// 当用户在搜索栏添加城市以后，刷新城市数据，请求新增城市的天气信息
- (void) refreshWeatherData:(NSMutableArray *)citiesMutableArray;
- (void) refreshWeatherData_2:(NSMutableArray *)citiesMutableArray;

- (void) saveCitysData;

- (void) printRequestedCities;

- (void) printAddedRequestedCities;

- (BOOL) thereIsTheCity:(NSString *)cityName;

@end
