#import "InfoView.h"

@interface InfoView()

@end

@implementation InfoView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        //距离显示 UILabel
        _disLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 120)]; // x y w h
        _disLb.textAlignment=NSTextAlignmentCenter;
        _disLb.textColor = [UIColor yellowColor];// 字体颜色 whiteColor
        //        _disLb.backgroundColor = [UIColor colorWithRed:0.99 green:0.38 blue:0.42 alpha:0.6];
        _disLb.font = [UIFont boldSystemFontOfSize:10];// 字体大小 9
        _disLb.backgroundColor = [UIColor clearColor];// 背景颜色
        [self addSubview:_disLb];
        
        //
        UIView *infoBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 40)]; // x y w h
        infoBar.backgroundColor = [UIColor clearColor];// 背景颜色
        infoBar.layer.cornerRadius=1;//圆角度数
        infoBar.layer.masksToBounds=YES;
        infoBar.layer.borderColor = [UIColor clearColor].CGColor;
        
        infoBar.layer.borderWidth=1;
        [self addSubview:infoBar];
        
        //框框
        _teamLb = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 90, 15)]; // x y w h
        //        _teamLb.textAlignment=NSTextAlignmentCenter;
        _teamLb.textColor = [UIColor greenColor];// 剩余血量 字体颜色 whiteColor
        _teamLb.backgroundColor =[UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0];// 背景颜色//[UIColor colorWithRed: 1.00 green: 1.00 blue: 0.00 alpha: 0.80];// 背景颜色//改动
        _teamLb.font = [UIFont boldSystemFontOfSize:11];// 字体大小 9
        [infoBar addSubview:_teamLb];
        //        greedColor
        
        //名字显示 UILabel
        _nameLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 25)]; // x y w h
        _nameLb.textAlignment=NSTextAlignmentCenter;
        _nameLb.textColor = [UIColor greenColor]; // 字体颜色 whiteColor
        _nameLb.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0]; // 背景颜色
        _nameLb.font = [UIFont boldSystemFontOfSize:11]; //字体大小 9
        [infoBar addSubview:_nameLb];
    }
    return self;
}
#pragma mark----实现类方法
+(instancetype)infoViewWithName:(NSString *)name
                           isAI:(Boolean *)isAI
                           team:(UInt8) team
                            xue:(CGFloat) xue
                            dis:(CGFloat) dis
                          point:(CGPoint) point;
{
    InfoView *infoView=[[InfoView alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    infoView.backgroundColor=[UIColor clearColor];
    infoView.center=point;
    //    infoView.layer.cornerRadius=5;
    infoView.layer.masksToBounds=YES;
    infoView.dis=dis;
    infoView.team=team;
    infoView.name=name;
    return infoView;
}
#pragma mark--给属性重新赋值
-(void)setDis:(CGFloat)dis
{
    _disLb.text=[NSString stringWithFormat:@"%d m",(int)dis];
}

-(void)setName:(NSString *)name
{
    _nameLb.text=[NSString stringWithFormat:@" %@",name];
}

-(void)setTeam:(UInt8)team
{
    
}

-(void)setPoint:(CGPoint)point
{
    self.center=point;
}

-(void)setXue:(CGFloat)xue
{
    int x = xue;
    
    _teamLb.text=[NSString stringWithFormat:@"血量:%d",x];
}



-(void)setAi:(Boolean)ai
{
//        if(ai) {
//
////    _xueBar.backgroundColor = [UIColor colorWithRed:0.00 green: 1.00 blue: 0.00 alpha:0.90];
//    //
//        } else {
//
//            _xueBar.backgroundColor = [UIColor greenColor];
//
//        }
    
}

@end
