//
//  IPAPatchEntry.h
//  IPAPatch
//
//  Created by wutian on 2017/3/17.
//  Copyright © 2017年 Weibo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HookDDD.h"
#import <UIKit/UIKit.h>
//#import "YINSocket.h"


@interface HOOKDDD : NSObject
{
  const  struct mach_header *header;
   char *colordata;
}

+ (instancetype)shareInstance;

@property(nonatomic,assign)NSInteger x;
@property(nonatomic,assign)NSInteger y;
@property(nonatomic,assign)NSInteger z;
@end
