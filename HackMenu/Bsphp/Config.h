

/**
 *  BSPHP网络验证系统 OC演示案例
 *  官方网站 Bsphp.com
 *  BSPHP 技术团队触屏
 *  下面是全局配置信息
 *  有技术上问题可以加群讨论 技术QQ群:sbbsbsbsb
 */


#import <Foundation/Foundation.h>
//下面信息通过软件后台>软件>对应软件配置上获得
//全局服务器地hur址
#define  BSPHP_HOST  @"http://44.154.183.134:88/AppEn.php?appid=88888888&m=a87ff77b7689934cf2253086a5039084"

//通信key
#define BSPHP_MUTUALKEY @"e8e372abe84ceba9e6249d88dd80b221"


//通信密码
#define BSPHP_PASSWORD @"kddbrsoyeblr12"

//POST默认
//图标地址
#define ICON @"http://8.136.104.148/ZQQ.jpg"
//几秒显示图标
#define TIME 10
//开关大小
#define ANNIU 0.95
//图标大小
#define ICONDX 40
//图标位置X轴
#define XX 100
//图标位置Y轴
#define YY 100
//菜单地址
#define CDURL @"https://iosgods.cn/test.json";

@interface NetTool : NSObject

/**
 *  AFN异步发送post请求，返回原生数据
 *
 *  @param appendURL 追加URL
 *  @param param     参数字典
 *  @param success   成功Block
 *  @param failure   失败Block
 *
 *  @return NSURLSessionDataTask任务类型
 */
+ (NSURLSessionDataTask *)__attribute__((optnone))Post_AppendURL:(NSString *)appendURL myparameters:(NSDictionary *)param mysuccess:(void (^)(id responseObject))success myfailure:(void (^)(NSError *error))failure;
@end
