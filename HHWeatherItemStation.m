//
//  HHWeatherItemStation.m
//  HHWeather
//
//  Created by 胡传业 on 15/2/27.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHWeatherItemStation.h"
#import "HHWeatherItem.h"
#import "HHWeatherGroup.h"

#import "JHAPISDK.h"
#import "JHOpenidSupplier.h"


@interface HHWeatherItemStation ()

@property (nonatomic) NSMutableDictionary *allPrivateWeatherGroups;

@property (nonatomic, copy) NSArray *citysArray;
@property (nonatomic, copy) NSMutableArray *MutableArray;

@end

@implementation HHWeatherItemStation

+ (instancetype) sharedStation {
    
    static HHWeatherItemStation *station = nil;
    
    if (!station) {
        
        station = [[self alloc] initWithPrivate];
    }
    
    return station;
}

// Deal with the possible situation
- (instancetype) init {
    
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +(instance) sharedStation " userInfo:nil];
    
    return nil;
}

// Real initializer method
- (instancetype) initWithPrivate {
    
    self = [super init];
    
    if (self) {
        
        _allPrivateWeatherGroups = [[NSMutableDictionary alloc] init];
        
        // 从 citys.txt 文件中读取到具有天气数据的所有城市，该 NSArray对象由 HHWeatherStation持有
//        NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"citys.txt"];
        
        _citysArray = [[NSArray alloc] init];
        _MutableArray = [[NSMutableArray alloc] init];

        _cityList = [[NSArray alloc] init];

        NSLog(@"_cityList: %@", _cityList);
    }
    
    return self;
}

- (void) addWeatherGroup:(HHWeatherGroup *)weatherGroup forCity:(NSString *)cityName {
    
    [self.allPrivateWeatherGroups setObject:weatherGroup forKey:cityName];
}

- (void) removeWeatherGroupForCity:(NSString *)cityName {

    [self.allPrivateWeatherGroups removeObjectForKey:cityName];
}

- (NSMutableDictionary *) allWeatherGroups {
    
    return self.allPrivateWeatherGroups;
}

/**
 *  请求到提供天气信息的城市列表
 *  写入 AvailableCities.plist 文件中
 */
- (void) requestAllAvailableCitys {
    
    // 1. 请求到 Json 数据
    JHAPISDK *juheapi = [JHAPISDK shareJHAPISDK];
    
    [juheapi executeWorkWithAPI:@"http://v.juhe.cn/weather/citys" APIID:@"39" Parameters:nil Method:@"GET" Success:^(id responseObject) {
        
        self.citysArray = [responseObject objectForKey:@"result"];
        
        NSLog(@"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        //        NSLog(@"%@", self.citysArray);
        
        // 对请求到的字典数据进行分层剥离
        NSDictionary *tempDic = [[NSDictionary alloc] init];
        
        [self.MutableArray addObject:@"北京"];
        
        NSLog(@"lastObject: %@", [self.MutableArray lastObject]);
        
        for (int i = 0; i < 2574 ; i++) {
            
            tempDic = [self.citysArray objectAtIndex:i];
            
            NSString *cityName = [tempDic objectForKey:@"city"];
            
            // 如果在数组中，该元素和上一个元素的值不相等，则把该元素添加到可变数组中
            if ([[self.MutableArray lastObject] isEqualToString:cityName]) {
                
            }
            else {
                
                [self.MutableArray addObject:cityName];
                //                NSLog(@"City_%i: %@", i,cityName);
                
            }
            
        }
        
    
        NSLog(@"readArray :\n %@", self.MutableArray);
        
        self.cityList = self.MutableArray;
        
        // 写入文件
        NSFileManager *fm = [NSFileManager defaultManager];
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *filePath = [path objectAtIndex:0];
        NSString *plistPath = [filePath stringByAppendingPathComponent:@"AvailableCities.plist"];
        
        [fm createFileAtPath:plistPath contents:nil attributes:nil];
        
        [self.MutableArray writeToFile:plistPath atomically:YES];
        
        
    } Failure:^(NSError *error) {
        NSLog(@"error : %@", error.description);
    }];
    
}

- (void) loadTheCityListFromPlist {
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [path objectAtIndex:0];
    NSString *plistPath = [filePath stringByAppendingPathComponent:@"AvailableCities.plist"];
    
    NSMutableArray *tempMutableArray = [NSMutableArray arrayWithContentsOfFile:plistPath];
    
    self.cityList = tempMutableArray;
    
    NSLog(@"%@", tempMutableArray);

}


@end
