//
//  AntChannel.m
//  Pods
//
//  Created by 沈强 on 2017/3/8.
//
//

#import "AntChannel.h"
#import "AntQueen.h"

@implementation AntChannel

+ (id<AntProtocol>)antWith:(id<AntDescriptionProtocol>)antDescription {
  return [AntQueen createAnt:antDescription];
}

@end
