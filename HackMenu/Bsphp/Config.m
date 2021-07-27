
#import "NetWorkingApiClient.h"
#import "Config.h"
#import "DES3Util.h"
#import "NSDictionary+StichingStringkeyValue.h"
#import "NSString+MD5.h"
#import "NSString+URLCode.h"
#define TESTLog(...)  NSLog(__VA_ARGS__)


@implementation NetTool : NSObject
+ (NSURLSessionDataTask *)__attribute__((optnone))Post_AppendURL:(NSString *)appendURL
myparameters:(NSDictionary *)param
mysuccess:(void (^)(id responseObject))success myfailure:(void (^)(NSError *error))failure{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
    [parameters setObject:@"ok" forKey:@"json"];
    if (param != nil) {
        NSString *desString  =  [NSDictionary stitchingStringFromDictionary:param];
        NSString *md5String = [BSPHP_PASSWORD md5:BSPHP_PASSWORD];
        desString = [DES3Utill encrypt:desString gkey:md5String];
        desString = [desString URLEncodedString];
        parameters[@"parameter"] = desString;
    }
    return [[NetWorkingApiClient sharedNetWorkingApiClient] POST:appendURL
                                                      parameters:parameters
                                                        progress:nil
                                                         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                             
                                                             NSString *str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
                                                             NSString *md5String = [BSPHP_PASSWORD md5:BSPHP_PASSWORD];
        str = [DES3Utill decrypt:str gkey:md5String];
                                                             //TESTLog(@"请求网址 = %@",appendURL);
                                                             ///TESTLog(@"parameters = %@",parameters);
                                                             //TESTLog(@"服务器返回数据 = %@",str);
                                                             NSData * data = [str dataUsingEncoding:NSUTF8StringEncoding];
                                                             //NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                                             //TESTLog(@"dict = %@",dict);
                                                             success(data);
                                                         }
                                                         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                             TESTLog(@"%@",error);
                                                             failure(error);
                                                         }];
    
}




@end
