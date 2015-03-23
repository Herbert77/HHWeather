//
//  HHDataManager.m
//  HHWeather
//
//  Created by 胡传业 on 15/3/19.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHDataManager.h"


#import "JHAPISDK.h"
#import "JHOpenidSupplier.h"

#import "HHWeatherItem.h"
#import "HHWeatherGroup.h"
#import "HHWeatherItemStation.h"

// 请求数据用的类型常量
// constant pointer

NSString *const PMPath = @"http://web.juhe.cn:8080/environment/air/pm";
NSString *const PMApi_Id = @"33";
NSString *const WeatherPath = @"http://v.juhe.cn/weather/index";
NSString *const WeatherAPI_Id = @"39";
NSString *const method = @"GET";

@interface HHDataManager ()


@end

@implementation HHDataManager

+ (instancetype) sharedDataManager {
    
    static HHDataManager *dataManager = nil;
    
    if (!dataManager) {
        dataManager = [[self alloc] initWithPrivate];
    }
    return dataManager;
}

// No permission to use this method
- (instancetype) init {
    
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +(instance) sharedDtaManager " userInfo:nil];
    
    return nil;
}

// Real initialzer method
- (instancetype) initWithPrivate {
    
    self = [super init];
    
    if (self) {
        self.citys = [[NSMutableArray alloc] init];
        self.weatherDic = [[NSDictionary alloc] init];
        self.pmDic = [[NSDictionary alloc] init];
        
        // TODO:initialization for JuheApiSDK
        [[JHOpenidSupplier shareSupplier] registerJuheAPIByOpenId:@"JH31e5fac42442d0b8f4cebc4ca717f7c7"];
    }
    
    return self;
}

/**
 *  依据城市名来请求天气数据
 *
 *  @param cityName 城市名（中文）
 */
- (void) requestWeatherDataForCity:(NSString *) cityName {

    JHAPISDK *juheapi = [JHAPISDK shareJHAPISDK];
    
    // TODO: Request for weather data
    NSDictionary *Weather_Parameters = @{@"cityname":cityName, @"dtype":@"json"};
    [juheapi executeWorkWithAPI:WeatherPath APIID:WeatherAPI_Id Parameters:Weather_Parameters Method:method Success:^(id responseObject) {
      
        self.weatherDic = [responseObject objectForKey:@"result"];
        NSLog(@"1");
      
       
    } Failure:^(NSError *error) {
        
        NSLog(@"error: %@", error.description);
    }];
    
    // TODO: Request for PM data
    NSDictionary *PM_Parameters = @{@"city": cityName};
    [juheapi executeWorkWithAPI:PMPath APIID:PMApi_Id Parameters:PM_Parameters Method:method Success:^(id responseObject) {
        
        NSArray *result = [responseObject objectForKey:@"result"];
        self.pmDic = result[0];
//        NSDictionary *pmValue = [dic objectForKey:@"PM2.5"];
//        NSString *cityString = [self.pmDic objectForKey:@"city"];
        NSLog(@"2");
        
        NSLog(@"Create the weather data model~");
        [self initializeWeatherModel];
        
    } Failure:^(NSError *error) {
        
        NSLog(@"error: %@", error.description);
    }];
    
    NSLog(@"3");
}

/**
 *  返回明天或后天的日期
 *
 *  @param day tomorrow or afterTomorrow
 *
 *  @return date
 */
- (NSString *) dateFor:(NSString *)day {
    
    // 获取明天和后天的日期
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    
    NSTimeInterval secondsPerDay = 24*60*60;
    if ([day isEqualToString:@"tomorrow"]) {
        
        return [dateFormatter stringFromDate:[today dateByAddingTimeInterval:1*secondsPerDay]];
    }
    else if ([day isEqualToString:@"afterTomorrow"]) {

        return [dateFormatter stringFromDate:[today dateByAddingTimeInterval:2*secondsPerDay]];
    }
    else {
        
        @throw [NSException exceptionWithName:@"Error" reason:@"Parameter for dateFor: is illegal." userInfo:nil];
    }
    
}

/**
 *  初始化天气数据模型
 */
- (void) initializeWeatherModel {
    
    NSString *cityName = [self.pmDic objectForKey:@"city"];
    NSLog(@"cityName: %@", cityName);
    NSDictionary *todayWeatherDic = [self.weatherDic objectForKey:@"today"];
    NSDictionary *skDic = [self.weatherDic objectForKey:@"sk"];
    
    NSDictionary *futureDic = [self.weatherDic objectForKey:@"future"];
    NSDictionary *tomoDic = [futureDic objectForKey:[NSString stringWithFormat:@"day_%@",[self dateFor:@"tomorrow"]]];
    NSDictionary *afterTomoDic = [futureDic objectForKey:[NSString stringWithFormat:@"day_%@", [self dateFor:@"afterTomorrow"]]];
    
    // Today's
    HHWeatherItem *todayItem = [[HHWeatherItem alloc] initWithCityName:cityName weather:[todayWeatherDic objectForKey:@"weather"] temperature:[todayWeatherDic objectForKey:@"temperature"] wind:[todayWeatherDic objectForKey:@"wind"] humidity: [skDic objectForKey:@"humidity"] pmValue:[self.pmDic objectForKey:@"PM2.5"]];
    // Tomorrow's
    HHWeatherItem *tomoItem = [[HHWeatherItem alloc] initWithCityName:cityName weather:[tomoDic objectForKey:@"weather"] temperature:[tomoDic objectForKey:@"temperature"] wind:[tomoDic objectForKey:@"wind"] humidity:@"" pmValue:@""];
    // The day After tomorrow's
    HHWeatherItem *afterTomoItem = [[HHWeatherItem alloc] initWithCityName:cityName weather:[afterTomoDic objectForKey:@"weather"] temperature:[afterTomoDic objectForKey:@"temperature"] wind:[afterTomoDic objectForKey:@"wind"] humidity:@"" pmValue:@""];
    
    // 创建一个天气组（以某一个城市为一个组）
    HHWeatherGroup *weatherGroup = [[HHWeatherGroup alloc] init];
    [weatherGroup addWeatherItems:@[todayItem, tomoItem, afterTomoItem]];
    
    // 把该天气组添加到天气中心
    [[HHWeatherItemStation sharedStation] addWeatherGroup:weatherGroup forCity:cityName];
    
    NSLog(@"todayItem: %@", [todayItem description]);
    NSLog(@"tomoItem: %@", [tomoItem description]);
    NSLog(@"afterTomoItem: %@", [afterTomoItem description]);
    
}

@end
