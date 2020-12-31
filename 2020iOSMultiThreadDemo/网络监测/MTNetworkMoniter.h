//
//  MTNetworkMoniter.h
//  2020iOSMultiThreadDemo
//
//  Created by ASSASSIN on 2020/12/31.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

NS_ASSUME_NONNULL_BEGIN

@interface MTNetworkMoniter : NSObject

+(instancetype)moniter;

/// 检查网络
/// @param block 网络状态回调
/// @param connectionBlock 是否有网回调
-(void)moniterNetWorkWithBlock:(void(^)(NetworkStatus status))block connectionBlock:(void(^)(BOOL connected))connectionBlock;

@end

NS_ASSUME_NONNULL_END
