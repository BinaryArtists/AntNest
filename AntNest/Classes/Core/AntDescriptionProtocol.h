//
//  AntDescriptionProtocol.h
//  Pods
//
//  Created by 沈强 on 2017/3/8.
//
//

#import <Foundation/Foundation.h>
typedef NSString* AntType;

@protocol AntDescriptionProtocol <NSObject>

@property(nonatomic, copy)AntType antType;

@end
