
#import <Foundation/Foundation.h>


@interface VerifyEntry : NSObject

+ (instancetype)MySharedInstance;

- (NSString*)getIDFA;
- (void)startProcessActivateProcess:(NSString *)code finish:(void (^)(NSDictionary *done))finish;
- (void)showAlertMsg:(NSString *)show error:(BOOL)error;
- (void)processActivate;

@end
@interface YDcjash: NSObject
-(void)Bsphp;
@end
