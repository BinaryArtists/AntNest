//
//  AntChannel.h
//  Pods
//
//  Created by 沈强 on 2017/3/8.
//
//

#import <Foundation/Foundation.h>
#import "AntDescriptionProtocol.h"
#import "AntProtocol.h"

@interface AntChannel : NSObject

+(id)antWith:(id<AntDescriptionProtocol>)antDescription;

@end
