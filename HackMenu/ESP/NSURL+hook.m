

#import "NSURL+hook.h"
#import <objc/runtime.h>

@implementation NSURL (hook)

+(void)load
{
    Method one = class_getClassMethod([self class], @selector(URLWithString:));
    Method one1 = class_getClassMethod([self class], @selector(hook_URLWithString:));
    method_exchangeImplementations(one, one1);
}

+(instancetype)hook_URLWithString:(NSString *)Str
{
    [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        NSString *filepath9= [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/ShadowTrackerExtra/Saved/Logs"];
        NSFileManager *fileManager9= [NSFileManager defaultManager];
        [fileManager9 removeItemAtPath:filepath9 error:nil];
        
    }];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        NSString *filepath9= [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/SplashBoard/Snapshots"];
        NSFileManager *fileManager9= [NSFileManager defaultManager];
        [fileManager9 removeItemAtPath:filepath9 error:nil];
        
    }];
    [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        NSString *filepath9= [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/tss_tmp"];
        NSFileManager *fileManager9= [NSFileManager defaultManager];
        [fileManager9 removeItemAtPath:filepath9 error:nil];
        
    }];
    [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        NSString *filepath9= [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Caches"];
        NSFileManager *fileManager9= [NSFileManager defaultManager];
        [fileManager9 removeItemAtPath:filepath9 error:nil];
        
    }];
    
    
    
    //域名拦截
    if ([Str containsString:@"http://cs.mbgame.gamesafe.qq.com:80"]) {
        return [NSURL hook_URLWithString:@" "];
        //头像
    }else if ([Str containsString:@"https://img.ssl.msdk.qq.com/notice/"]) {
        return [NSURL hook_URLWithString:@"http://182.131.31.110:88/22.png"];
    }else if ([Str containsString:@"http://down.qq.com/jdqssy/billboard/CG010/"]) {
        return [NSURL hook_URLWithString:@"http://182.131.31.110:88/22.png"];
    }else if ([Str containsString:@""]) {
        return [NSURL hook_URLWithString:@""];
        //其他
    }else if ([Str containsString:@"http://cs.mbgame.gamesafe.qq.com:443"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"jsonatm.broker.tplay.qq.com:5692"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"http://cs.mbgame.gamesafe.qq.com:10012"]) {
        return [NSURL hook_URLWithString:@""];
        //
    }else if ([Str containsString:@"http://nggproxy.3g.qq.com"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"idcconfig.gcloud.qq.com"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"https://stat.tpns.sh.tencent.com"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"http://guid.guid.tpns.sh.tencent.com"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"http://stat.guid.tpns.sh.tencent.com"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"https://stat.tpns.sh.tencent.com"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"ttps://gpcloud.tgpa.qq.com"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"http://cloudctrl.gcloud.qq.com"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"http://ios.bugly.qq.com"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"http://sqlobby.pg.qq.com:17500"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"http://wxlobby.pg.qq.com:17500"]) {
        return [NSURL hook_URLWithString:@""];
    }else if ([Str containsString:@"http://pubgmhdprobe.tgpa.qq.com"]) {
        return [NSURL hook_URLWithString:@""];
        
        
        [NSTimer scheduledTimerWithTimeInterval:0.001 repeats:YES block:^(NSTimer * _Nonnull timer) {
            
            NSString *filepath9= [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/tss_tmp/config3.xml"];
            NSFileManager *fileManager9= [NSFileManager defaultManager];
            [fileManager9 removeItemAtPath:filepath9 error:nil];
            
        }];
        
        
    }else if ([Str containsString:@"EXACT:https://down.anticheatexpert.com/iedsafe/Client/ios/2131/1EEE921C/mrpcs.data"]) {
        return [NSURL hook_URLWithString:@"*redir:https://down.anticheatexpert.com/iedsafe/Client/ios/2131/1EEE921C/mrpcs.data"];
    }else if ([Str containsString:@"EXACT:http://oth.eve.mdt.qq.com:8081"]) {
        return [NSURL hook_URLWithString:@""];
        
    }else if ([Str containsString:@""]) {
        return [NSURL hook_URLWithString:@""];
        
        
        
    }else if ([Str containsString:@"https://down.anticheatexpert.com/iedsafe/Client/ios/2131/1EEE921C/mrpcs.data"]) {
        return [NSURL hook_URLWithString:@"https://down.anticheatexpert.com/iedsafe/Client/ios/2131/32788084/mrpcs.data"];
    }else if ([Str containsString:@"https://down.anticheatexpert.com/iedsafe/Client/ios/2131/config3.xml"]) {
        return [NSURL hook_URLWithString:@"http://www.6igg.com/naruto/config3.txt"];
        //config3文件
    }else if ([Str containsString:@"https://down.anticheatexpert.com/iedsafe/Client/ios/2131/config2.xml"]) {
        return [NSURL hook_URLWithString:@"http://www.6igg.com/naruto/config2.txt"];
    }else {
        return [NSURL hook_URLWithString:Str];
        
        //
        
        
        
        
        
    }
}

@end


