//
//  ANAntDes.h
//  AntNest
//
//  Created by 沈强 on 2017/3/8.
//  Copyright © 2017年 yuzhoulangzik@126.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AntDescriptionProtocol.h"

@interface ANAntDes : NSObject<AntDescriptionProtocol>

@property(nonatomic, copy)AntType antType;

- (instancetype)initWith:(AntType)antType;

@end
