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

#define ANT_CHANNEL(protocol,antDescription) (id<protocol>)[AntChannel antWith:antDescription]

@interface AntChannel : NSObject

+(id)antWith:(id<AntDescriptionProtocol>)antDescription;

@end
