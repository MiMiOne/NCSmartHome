//
//  NCCaiYunModel.h
//  
//  Created by  on 2019/06/03.
//  Copyright © 2019年 . All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<YYModel/YYModel.h>)
#import <YYModel/YYModel.h>
#else
#import"YYModel.h" 
#endif

@class NCCaiYunModelLocation;
@class NCCaiYunModelResult;
@class NCCaiYunModelResultUltraviolet;
@class NCCaiYunModelResultPrecipitation;
@class NCCaiYunModelResultPrecipitationNearest;
@class NCCaiYunModelResultPrecipitationLocal;
@class NCCaiYunModelResultWind;
@class NCCaiYunModelResultComfort;

@interface NCCaiYunModel : NSObject

/** <#status#>*/
@property (nonatomic, copy) NSString *status;

/** <#unit#>*/
@property (nonatomic, copy) NSString *unit;

/** <#lang#>*/
@property (nonatomic, copy) NSString *lang;

/** <#server_time#>*/
@property (nonatomic, strong) NSNumber *server_time;

/** <#location#>*/
@property (nonatomic, strong) NSArray<NSNumber *> *location;

/** <#api_status#>*/
@property (nonatomic, copy) NSString *api_status;

/** <#api_version#>*/
@property (nonatomic, copy) NSString *api_version;

/** <#result#>*/
@property (nonatomic, strong) NCCaiYunModelResult *result;

/** <#tzshift#>*/
@property (nonatomic, strong) NSNumber *tzshift;


+ (instancetype)modelWithJson:(id)json;

@end


@interface NCCaiYunModelLocation : NSObject

@end


@interface NCCaiYunModelResult : NSObject

/** <#so2#>*/
@property (nonatomic, strong) NSNumber *so2;

/** <#ultraviolet#>*/
@property (nonatomic, strong) NCCaiYunModelResultUltraviolet *ultraviolet;

/** <#status#>*/
@property (nonatomic, copy) NSString *status;

/** <#precipitation#>*/
@property (nonatomic, strong) NCCaiYunModelResultPrecipitation *precipitation;

/** <#temperature#>*/
@property (nonatomic, strong) NSNumber *temperature;

/** <#cloudrate#>*/
@property (nonatomic, strong) NSNumber *cloudrate;

/** <#pm25#>*/
@property (nonatomic, strong) NSNumber *pm25;

/** <#skycon#>*/
@property (nonatomic, copy) NSString *skycon;

/** <#no2#>*/
@property (nonatomic, strong) NSNumber *no2;

/** <#visibility#>*/
@property (nonatomic, strong) NSNumber *visibility;

/** <#pres#>*/
@property (nonatomic, strong) NSNumber *pres;

/** <#humidity#>*/
@property (nonatomic, strong) NSNumber *humidity;

/** <#pm10#>*/
@property (nonatomic, strong) NSNumber *pm10;

/** <#o3#>*/
@property (nonatomic, strong) NSNumber *o3;

/** <#dswrf#>*/
@property (nonatomic, strong) NSNumber *dswrf;

/** <#apparent_temperature#>*/
@property (nonatomic, strong) NSNumber *apparent_temperature;

/** <#aqi#>*/
@property (nonatomic, strong) NSNumber *aqi;

/** <#co#>*/
@property (nonatomic, strong) NSNumber *co;

/** <#wind#>*/
@property (nonatomic, strong) NCCaiYunModelResultWind *wind;

/** <#comfort#>*/
@property (nonatomic, strong) NCCaiYunModelResultComfort *comfort;

@end


@interface NCCaiYunModelResultUltraviolet : NSObject

/** <#index#>*/
@property (nonatomic, strong) NSNumber *index;

/** <#desc#>*/
@property (nonatomic, copy) NSString *desc;

@end


@interface NCCaiYunModelResultPrecipitation : NSObject

/** <#nearest#>*/
@property (nonatomic, strong) NCCaiYunModelResultPrecipitationNearest *nearest;

/** <#local#>*/
@property (nonatomic, strong) NCCaiYunModelResultPrecipitationLocal *local;

@end


@interface NCCaiYunModelResultPrecipitationNearest : NSObject

/** <#status#>*/
@property (nonatomic, copy) NSString *status;

/** <#distance#>*/
@property (nonatomic, strong) NSNumber *distance;

/** <#intensity#>*/
@property (nonatomic, strong) NSNumber *intensity;

@end


@interface NCCaiYunModelResultPrecipitationLocal : NSObject

/** <#status#>*/
@property (nonatomic, copy) NSString *status;

/** <#datasource#>*/
@property (nonatomic, copy) NSString *datasource;

/** <#intensity#>*/
@property (nonatomic, strong) NSNumber *intensity;

@end


@interface NCCaiYunModelResultWind : NSObject

/** <#speed#>*/
@property (nonatomic, strong) NSNumber *speed;

/** <#direction#>*/
@property (nonatomic, strong) NSNumber *direction;

@end


@interface NCCaiYunModelResultComfort : NSObject

/** <#index#>*/
@property (nonatomic, strong) NSNumber *index;

/** <#desc#>*/
@property (nonatomic, copy) NSString *desc;

@end

