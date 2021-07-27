

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ESPDataFetchDataBlock)(NSArray *data, NSArray *hpData, NSArray *disData,NSArray *nameData,NSArray *aiData,NSArray *data1,NSArray *data2,NSArray *data3,NSArray *data4,NSArray *data5,NSArray *data6,NSArray *data7,NSArray *data8);

@interface rgtqm : NSObject//特征坐标

+ (instancetype)factory;

- (void)fetchData:(ESPDataFetchDataBlock)block;

@end

NS_ASSUME_NONNULL_END
