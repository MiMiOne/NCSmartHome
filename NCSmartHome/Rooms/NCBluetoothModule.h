//
//  NCBluetoothModule.h
//  NCSmartHome
//
//  Created by Wiley on 2019/6/3.
//  Copyright © 2019 Wiley. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol NCBluetoothModuleDelegate <NSObject>
//将设备信息传到外面的页面
-(void)dataWithBluetoothDic:(NSMutableDictionary *)dic;

//已经连接的代理通知
-(void)didConnectBle;

//数据写入设备成功回调
-(void)didWriteSucessWithStyle:(NSInteger )style;
@end
@interface NCBluetoothModule : NSObject

@property(nonatomic,weak)id<NCBluetoothModuleDelegate>delegate;

//开始扫描
-(void)blueToothScanf;
//停止扫描
- (void)stopScanPeripheral;

+(instancetype)shareNCBluetoothModule;
@end

NS_ASSUME_NONNULL_END
