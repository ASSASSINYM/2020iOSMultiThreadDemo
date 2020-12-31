//
//  MTNetworkMoniter.m
//  2020iOSMultiThreadDemo
//
//  Created by ASSASSIN on 2020/12/31.
//

#import "MTNetworkMoniter.h"

static MTNetworkMoniter *moniter = nil;

@interface MTNetworkMoniter ()<NSCopying>

@property(nonatomic,strong)Reachability *reach;

@end

@implementation MTNetworkMoniter

+(instancetype)moniter {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        moniter = [[MTNetworkMoniter alloc] init];
    });
    return moniter;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        moniter = [[MTNetworkMoniter alloc] init];
    });
    return moniter;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.reach = [[Reachability alloc] init];
    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone {
    return moniter;
}

-(void)moniterNetWorkWithBlock:(void (^)(NetworkStatus))block connectionBlock:(void (^)(BOOL))connectionBlock {
    if (block) {
        block([self.reach currentReachabilityStatus]);
    }
    if (connectionBlock) {
        NetworkStatus status = [self.reach currentReachabilityStatus];
        if (status != NotReachable) {
            connectionBlock(YES);
        }else {
            connectionBlock(NO);
        }
    }
}

@end
