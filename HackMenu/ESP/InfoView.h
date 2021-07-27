#import <UIKit/UIKit.h>

@interface InfoView : UIView

@property(nonatomic,retain)UILabel *teamLb;
@property(nonatomic,retain)UILabel *nameLb;
@property(nonatomic,retain)UILabel *disLb;
@property(nonatomic,retain)UIView *xueBar;

@property(nonatomic,retain)NSString *name;
@property(nonatomic)CGFloat dis;
@property(nonatomic)CGFloat xue;
@property(nonatomic)UInt8 team;
@property(nonatomic)Boolean ai;

+(instancetype)infoViewWithName:(NSString *)name
                isAI:(Boolean *)isAI
                team:(UInt8) team
                xue:(CGFloat) xue
                dis:(CGFloat) dis
               point:(CGPoint) point;

@end
