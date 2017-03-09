//
//  ANAccountInfo.h
//  AntNest
//
//  Created by 沈强 on 2017/3/8.
//  Copyright © 2017年 yuzhoulangzik@126.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AntNest.h"

@interface ANAccountInfo : NSObject<AntProtocol>

@property(nonatomic, strong)NSString *userName;

@property(nonatomic, assign)NSUInteger age;

@end
