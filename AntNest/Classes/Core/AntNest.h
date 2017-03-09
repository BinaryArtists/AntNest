//
//  AntNest.h
//  Pods
//
//  Created by 沈强 on 2017/3/8.
//
//

#import <Foundation/Foundation.h>
#import "AntChannel.h"
#import "AntDescriptionProtocol.h"
#import "AntProtocol.h"
#import "AntQueen.h"
#import "AntRoomProtocol.h"

@interface AntNest : NSObject<UIApplicationDelegate>

+ (instancetype)sharedAntNest;

@end
