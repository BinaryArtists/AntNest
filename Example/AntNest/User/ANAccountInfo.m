//
//  ANAccountInfo.m
//  AntNest
//
//  Created by 沈强 on 2017/3/8.
//  Copyright © 2017年 yuzhoulangzik@126.com. All rights reserved.
//

#import "ANAccountInfo.h"

@implementation ANAccountInfo

ANT_EXPORT_ANT();

+ (AntType)antType {
  return @"AccountInfoAnt";
}

+ (BOOL)singleton {
  return YES;
}

+ (instancetype)createInstance:(id<AntDescriptionProtocol>)antDescription {
  
  ANAccountInfo *accountInfo = [ANAccountInfo new];
  accountInfo.userName = @"carl";
  accountInfo.age = 26;
  return accountInfo;
  
}

@end
