//
//  NSObject+Hook.m
//  HKXB
//
//  Created by HackSX on 2021/4/11.
//

#import "Hook.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#include <sys/stat.h>
#include <stdlib.h>
#import <Foundation/NSObject.h>
#import "CaptainHook.h"

@implementation NSURL (hook)
+(void)load
{
    Method one = class_getClassMethod([self class], @selector(URLWithString:));
    Method one1 = class_getClassMethod([self class], @selector(hook_URLWithString:));
    method_exchangeImplementations(one, one1);
}

+(instancetype)hook_URLWithString:(NSString *)Str
{
  if ([Str containsString:@"1"]) {
          return [NSURL hook_URLWithString:@"2"];}
  if ([Str containsString:@"1"]) {
          return [NSURL hook_URLWithString:@"2"];}
  if ([Str containsString:@"1"]) {
          return [NSURL hook_URLWithString:@"2"];}
  
  
  else {

              
            
              
          return [NSURL hook_URLWithString:Str];
      }
  }

  @end

