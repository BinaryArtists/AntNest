//
//  AntProtocol.h
//  Pods
//
//  Created by 沈强 on 2017/3/8.
//
//

#import <Foundation/Foundation.h>
#import "AntDescriptionProtocol.h"

@protocol AntProtocol <NSObject>

+ (AntType)antType;

+ (instancetype)createInstance:(id<AntDescriptionProtocol>)antDescription;

@optional

+ (BOOL)singleton;

@end
