//
//  ANAntDes.m
//  AntNest
//
//  Created by 沈强 on 2017/3/8.
//  Copyright © 2017年 yuzhoulangzik@126.com. All rights reserved.
//

#import "ANAntDes.h"

@implementation ANAntDes

- (instancetype)initWith:(AntType)antType {
  if (self = [super init]) {
    _antType = antType;
  }
  return self;
}

@end
