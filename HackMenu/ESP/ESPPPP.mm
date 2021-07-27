#import "ESP.h"
#import "ESPView.h"
#import <CoreText/CoreText.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UIKit/UIAlertView.h>
#import "InfoView.h"



#define kTest   0
#define g 0.86602540378444
#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kScale [UIScreen mainScreen].scale

@interface bbn4p()
@property (nonatomic,  strong) UILabel *numberLabel;
@property (nonatomic,  strong) UILabel *numberLabel2;
@property (nonatomic,  strong) UILabel *numberLabe;
@property (nonatomic,  strong) CAShapeLayer *drawLayer;
@property (nonatomic,  strong) CAShapeLayer *hpLayer;
@property (nonatomic,  strong) CAShapeLayer *wjLayer;
@property (nonatomic,  strong) CAShapeLayer *disLayer;
@property (nonatomic,  strong) CAShapeLayer *Line_Red;
@property (nonatomic,  strong) CAShapeLayer *Line_Green;

@property (nonatomic) CATextLayer * textLayer;
@property (nonatomic,  strong) NSArray *rects;
@property (nonatomic,  strong) NSArray *hpData;
@property (nonatomic,  strong) NSArray *disData;
@property (nonatomic,  strong) NSArray *nameData;
@property (nonatomic,  strong) NSArray *aiData;
@property (nonatomic,  weak) NSTimer *timer;

@property (nonatomic,  strong) NSArray *data1;
@property (nonatomic,  strong) NSArray *data2;
@property (nonatomic,  strong) NSArray *data3;
@property (nonatomic,  strong) NSArray *data4;
@property (nonatomic,  strong) NSArray *data5;
@property (nonatomic,  strong) NSArray *data6;
@property (nonatomic,  strong) NSArray *data7;
@property (nonatomic,  strong) NSArray *data8;

@end
static CATextLayer *tsLabel[100];
static CAShapeLayer *drawLayer[100];
static CAShapeLayer *hpLayer[100];
static InfoView *infoView[100];
NSMutableDictionary *newActions;
static UIBezierPath *Path[100];
CGRect rect ;
CGFloat xue;
CGFloat dis ;

BOOL kaiguan=YES;//开关
BOOL kaiguan1=YES;
BOOL kaiguan3=YES;
BOOL kaiguan2=YES;
BOOL kaiguan4=YES;
UIButton *closeButton;
UIView *menuView;
UIButton *menuButton;

@implementation bbn4p
#pragma mark -------------------------------------视图-------------------------------------------

+ (void)load
{
    //#warning ###################################################################################测试警告
    //        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(520 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //
    //
    //            exit(0);
    //
    //        });
    //#warning ###################################################################################测试警告
    
    
    //2秒后开启弹窗
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(16 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //这里是弹窗
//        [[[UIAlertView alloc]initWithTitle:@"欢迎使用" message: @"‼️最好搭配本端口使用，否则有封号风险‼️" delegate:nil cancelButtonTitle:@"进入游戏" otherButtonTitles:nil]show];
        
        UILabel* AL5 = [[UILabel alloc] initWithFrame:CGRectMake(20, 190, 60, 40)];
        //[AL5 setText:@"人数"];
        [AL5 setTextColor:[UIColor redColor]];
        [AL5 setBackgroundColor:[UIColor clearColor]];
        AL5.font = [UIFont systemFontOfSize:9];
        [[[[UIApplication sharedApplication] windows]lastObject] addSubview:AL5];
        bbn4p *view5 = [bbn4p zxcv];
        [view5 show];
        [[[[UIApplication sharedApplication]windows]lastObject]addSubview:view5];
        for(NSInteger i = 0; i < 100; i++){
            newActions = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[NSNull null], @"position", [NSNull null], @"bounds", nil];
            tsLabel[i] = [CATextLayer layer];
            tsLabel[i].actions = newActions;
            tsLabel[i].string = @"";
            tsLabel[i].bounds = CGRectMake(0, 0, 160, 30);
            tsLabel[i].fontSize = 12;//字体的大小
            tsLabel[i].wrapped = YES;//默认为No.  当Yes时，字符串自动适应layer的bounds大小
            tsLabel[i].alignmentMode = kCAAlignmentCenter;//字体的对齐方式
            tsLabel[i].position = CGPointMake(-100, -100);//layer在view的位置 适用于跟随摸一个不固定长的的控件后面需要的
            tsLabel[i].contentsScale = [UIScreen mainScreen].scale;//解决文字模糊
            tsLabel[i].foregroundColor =[UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1].CGColor;//字体的颜色
            [[[[UIApplication sharedApplication] windows]lastObject].layer addSublayer:tsLabel[i]];
            infoView[i] = [[InfoView alloc] init];
            infoView[i].hidden = YES;
            [[[[UIApplication sharedApplication] windows]lastObject] addSubview:infoView[i]];
        }
    });
    
}

-(void)initTapGes
{
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] init];
    tap1.numberOfTapsRequired = 2; // 点击次数
    tap1.numberOfTouchesRequired = 3; // 手指数
    [[[[UIApplication sharedApplication] windows] objectAtIndex:0].rootViewController.view addGestureRecognizer:tap1];
    [tap1 addTarget:self action:@selector(drawAction)];
}

+ (void)ts: (UISwitch*) zhuangtai {
    if(zhuangtai.isOn) {
        kaiguan = YES;
    } else {
        kaiguan = NO;
    }
}
+ (void)ts1: (UISwitch*) zhuangtai1 {
    if(zhuangtai1.isOn) {
        kaiguan1 = YES;
    } else {
        kaiguan1 = NO;
    }
}
+ (void)ts2: (UISwitch*) zhuangtai2 {
    if(zhuangtai2.isOn) {
        kaiguan2 = YES;
    } else {
        kaiguan2 = NO;
    }
}
+ (void)ts3: (UISwitch*) zhuangtai3 {
    if(zhuangtai3.isOn) {
        kaiguan3 = YES;
    } else {
        kaiguan3 = NO;
    }
}
+ (void)ts4: (UISwitch*) zhuangtai4 {
    if(zhuangtai4.isOn) {
        kaiguan4 = YES;
    } else {
        kaiguan4 = NO;
    }
}
- (void)closeMenu {    menuView.hidden = YES; }
+ (instancetype)zxcv
{
    return [[bbn4p alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.userInteractionEnabled = NO;
        [self.layer addSublayer:self.drawLayer];
        [self.layer addSublayer:self.disLayer];
        [self.layer addSublayer:self.hpLayer];
        [self.layer addSublayer:self.wjLayer];
        
        [self.layer addSublayer:self.Line_Red];
        [self.layer addSublayer:self.Line_Green];
        
        [self addSubview:self.numberLabel];
        [self addSubview:self.numberLabel2];
           [self addSubview:self.numberLabe];
        for(NSInteger i = 0; i < 100; i++){
            
            drawLayer[i] = [CAShapeLayer layer];
            drawLayer[i].frame = self.bounds;
            drawLayer[i].fillColor = [UIColor clearColor].CGColor;
            
            [self.layer addSublayer:drawLayer[i]];
        }
        
    }
    return self;
}

#pragma mark -------------------------------------事件-------------------------------------------


- (void)dealloc
{
    NSLog(@"--%s--", __func__);
}


- (void)clear{
    
    for (NSInteger i = 0; i < 100; i++) {
        
        
        tsLabel[i].string = @"";
        drawLayer[i].strokeColor =  [UIColor clearColor].CGColor;
        infoView[i].hidden = YES;
    }
}

- (void)show
{
    self.hidden = NO;
    self.timer.fireDate = [NSDate distantPast];
}

- (void)hide
{
    self.hidden = YES;
    self.timer.fireDate = [NSDate distantFuture];
}

- (void)configWithData:(NSArray *)rects hpData:(NSArray *)hpData disData:(NSArray *)disData nameData:(NSArray *)nameData aiData:(NSArray *)aiData data1:(NSArray *)data1 data2:(NSArray *)data2 data3:(NSArray *)data3 data4:(NSArray *)data4 data5:(NSArray *)data5 data6:(NSArray *)data6 data7:(NSArray *)data7 data8:(NSArray *)data8
{
    _rects = rects;
    _hpData = hpData;
    _disData = disData;
    _nameData = nameData;
    _aiData = aiData;
    
    if(kaiguan4 == YES){
        NSInteger aa =_rects.count;
        if (aa==0){
            _numberLabel.text =  [ NSString stringWithFormat:@"0" ];
     
                   }
        else{
            _numberLabel.text =  [ NSString stringWithFormat:@"%d" ,(int)(_rects.count)];}
       
    }
   
       _numberLabel2.text =[ NSString stringWithFormat:@"范围版"];
  
    [self clear];
    [self drawAction];
}


- (void)drawAction
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    UIBezierPath *hpPath = [UIBezierPath bezierPath];
    UIBezierPath *wjPath = [UIBezierPath bezierPath];
    UIBezierPath *disPath = [UIBezierPath bezierPath];
    float wanjia =0;
    
    for (NSInteger i = 0; i < _rects.count; i++) {
        
        Path[i] = [UIBezierPath bezierPath];
        
        NSValue *val0  = _rects[i];
        NSNumber *val1 = _hpData[i];
        NSNumber *val2 = _disData[i];
        NSNumber *val3 = _aiData[i];
        
        CGRect rect = [val0 CGRectValue];
        CGFloat xue = [val1 floatValue];
        CGFloat dis = [val2 floatValue];
        
        wanjia+=1;
        
        rect = [val0 CGRectValue];
        xue = [val1 floatValue];
        dis = [val2 floatValue];
        float xd = rect.origin.x;//人物X坐标
        float yd = rect.origin.y;//人物Y坐标
        
        
        if(dis<80){
            if([val3 intValue] == 1){
                infoView[i].name = [NSString stringWithFormat:@"人机"];
            }else{
                infoView[i].name = [NSString stringWithFormat:@"%@",_nameData[i]];
            }
            
            infoView[i].dis = dis;//距离。至于东西怎么获取你自己想办法
            infoView[i].xue = xue;//血量
            infoView[i].ai = NO;//yes血条绿色 no红色
            infoView[i].team = wanjia;//对标
            infoView[i].center = CGPointMake(xd-50, yd-30);//ui位置
            infoView[i].hidden=NO;
        }
        if(dis>=80 &&dis<200){
            
            if([val3 intValue] == 1){
                infoView[i].name = [NSString stringWithFormat:@"人机"];
            }else{
                infoView[i].name = [NSString stringWithFormat:@"%@",_nameData[i]];
            }
            infoView[i].dis = dis;//距离。至于东西怎么获取你自己想办法
            infoView[i].xue = xue;//血量
            infoView[i].ai = YES;//yes血条绿色 no红色
            infoView[i].team = wanjia;//对标
            infoView[i].center = CGPointMake(xd-50, yd-30);//ui位置
            infoView[i].hidden=NO;
        }
        if (dis>=200){
            
            if([val3 intValue] == 1){
                infoView[i].name = [NSString stringWithFormat:@"人机"];
            }else{
                infoView[i].name = [NSString stringWithFormat:@"%@",_nameData[i]];
            }
            infoView[i].dis = dis;//距离。至于东西怎么获取你自己想办法
            infoView[i].xue = xue;//血量
            infoView[i].ai = YES;//yes血条绿色 no红色
            infoView[i].team = wanjia;//对标
            infoView[i].center = CGPointMake(xd-50, yd-30);//ui位置
            infoView[i].hidden=NO;        }
        
        if (kaiguan == YES){
            
            UIBezierPath *sjx = [UIBezierPath bezierPath];
            [sjx moveToPoint:CGPointMake(xd-2, yd-2.5)];
            [sjx addLineToPoint:CGPointMake(xd+2, yd-2.5)];
            [sjx addLineToPoint:CGPointMake(xd, yd-1.75)];
            [sjx closePath];
            [disPath appendPath:sjx];
            
        }
        
        if(kaiguan4==YES){
            //骨骼
            
        }
        
        
        // 射线
        if (kaiguan2 == YES){
            UIBezierPath *line = [UIBezierPath bezierPath];
            [line moveToPoint:CGPointMake(kWidth*0.5, 45)];
            [line addLineToPoint:CGPointMake(xd, yd-18)];
            [path appendPath:line];
        }
      //  UIBezierPath *yuanPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(kWidth/2,kHeight/2) radius:160 startAngle:(0) endAngle:M_PI*2 clockwise:true];
        
    //    [path appendPath:yuanPath]; //中间
        
        
        
        //变色射线颜色
        //  if((int)dis>0&&(int)dis<=100 ){ _drawLayer.strokeColor =  [UIColor colorWithRed: 1.00 green: 0.00 blue: 0.00 alpha: 1.00].CGColor;};
        
        // if((int)dis>100&&(int)dis<=150 ){ _drawLayer.strokeColor =  [UIColor colorWithRed: 0.00 green: 1.00 blue: 1.00 alpha: 1.00].CGColor;};
        
        // if((int)dis>150&&(int)dis<=300 ){ _drawLayer.strokeColor =  [UIColor colorWithRed: 0.00 green: 1.00 blue: 0.00 //alpha: 1.00].CGColor;};
        //}
        
        
        if (kaiguan3 == YES){
            // 血量
            CGRect hpRect = CGRectMake(xd-30, yd-19, xue, 5);
            UIBezierPath *hpBz = [UIBezierPath bezierPathWithRect:hpRect];
            [hpPath appendPath:hpBz];
        }
        
    }

                                                             
    self.drawLayer.path = path.CGPath;
    self.hpLayer.path = hpPath.CGPath;
    self.disLayer.path = disPath.CGPath;
    self.wjLayer.path = wjPath.CGPath;
    self.Line_Red.path = Draw_Line_Red.CGPath;
    self.Line_Green.path = Draw_Line_Green.CGPath;
    }//;



- (void)doTheJob
{
    NSLog(@"*** doTheJob");
    
    
    [[rgtqm factory] fetchData:^(NSArray * _Nonnull data, NSArray * _Nonnull hpData, NSArray * _Nonnull disData, NSArray * _Nonnull nameData,NSArray * _Nonnull aiData, NSArray * _Nonnull data1, NSArray * _Nonnull data2, NSArray * _Nonnull data3, NSArray * _Nonnull data4, NSArray * _Nonnull data5, NSArray * _Nonnull data6, NSArray * _Nonnull data7, NSArray * _Nonnull data8) {
        
        [self configWithData:data hpData:hpData disData:disData nameData:nameData aiData:aiData data1:data1 data2:data2 data3:data3 data4:data4 data5:data5 data6:data6 data7:data7 data8:data8];
        
    }];
}

#pragma mark -------------------------------------懒加载-----------------------------------------
//人数
- (UILabel *)numberLabel{
    if (!_numberLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(kWidth/2, 20, 150, 40);
        label.text = @"";
        label.textColor = [UIColor redColor];//人数颜色
        label.font = [UIFont boldSystemFontOfSize:30];//显示大小
        label.shadowColor = [UIColor redColor];
        
        label.shadowOffset = CGSizeMake(0.5,1.1);
        _numberLabel = label;
    }
    return _numberLabel;
}

- (UILabel *)numberLabel2{
    if (!_numberLabel2) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(kWidth/2-12, 40, 150, 40);
        label.text = @"";
        label.textColor = [UIColor redColor];//版本绘制显示颜色
        label.font = [UIFont boldSystemFontOfSize:15];//版本绘制大小
        label.shadowColor = [UIColor redColor];

        label.shadowOffset = CGSizeMake(0.5,1.1);
        _numberLabel2 = label;
    }
    return _numberLabel2;
}

//射线
//- (CAShapeLayer *)drawLayer{
  //  if (!_drawLayer) {
    //    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
     //   shapeLayer.frame = self.bounds;
     //   shapeLayer.strokeColor  =[UIColor colorWithRed: 1.00 green: 1.00 blue: 1.00 alpha: 0.85].CGColor;//射线颜色
     //   shapeLayer.fillColor = [UIColor clearColor].CGColor;
    //   shapeLayer.lineWidth = 1.0;//射线宽度
     //   _drawLayer = shapeLayer;
 //   }
  //  return _drawLayer;
//}

- (CAShapeLayer *)drawLayer{
    if (!_drawLayer) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor  =[UIColor greenColor].CGColor;//射线颜色
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.lineWidth = 1.3;//射线宽度
        _drawLayer = shapeLayer;
    }
    return _drawLayer;
}
//血量
- (CAShapeLayer *)hpLayer{
    if (!_hpLayer) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor greenColor].CGColor;
        shapeLayer.fillColor = [UIColor greenColor].CGColor;
        _hpLayer = shapeLayer;
        shapeLayer.hidden=YES;
    }
    return _hpLayer;
}

- (CAShapeLayer *)disLayer{
    if (!_disLayer) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor yellowColor].CGColor;//骨骼颜色
        shapeLayer.fillColor = [UIColor yellowColor].CGColor;
        shapeLayer.lineWidth = 1.0;
        _disLayer = shapeLayer;
    }
    return _disLayer;
}

- (CAShapeLayer *)Line_Red{
    if (!_Line_Red) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor redColor].CGColor;
        shapeLayer.fillColor = [UIColor redColor].CGColor;
        shapeLayer.lineWidth = 1.0;
        _Line_Red = shapeLayer;
    }
    return _Line_Red;
}

- (CAShapeLayer *)Line_Green{
    if (!_Line_Green) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.strokeColor = [UIColor greenColor].CGColor;
        shapeLayer.fillColor = [UIColor greenColor].CGColor;
        shapeLayer.lineWidth = 1.0;
        _Line_Green = shapeLayer;
    }
    return _Line_Green;
}

- (NSTimer *)timer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.02 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [self doTheJob];
        }];
    }
    return _timer;
}
//创建关闭菜单
+ (void)closeMenu {   closeButton.hidden= NO; menuView.hidden = YES; }
+ (void)buttonDragged:(UIButton *)button withEvent:(UIEvent *)event {
    UITouch *touch = [[event touchesForView:button] anyObject];
    
    CGPoint previousLocation = [touch previousLocationInView:button];
    CGPoint location = [touch locationInView:button];
    CGFloat delta_x = location.x - previousLocation.x;
    CGFloat delta_y = location.y - previousLocation.y;
    
    button.center = CGPointMake(button.center.x + delta_x, button.center.y + delta_y);
}

@end
