//
//  FindMinMaxThread.h
//  2020iOSMultiThreadDemo
//
//  Created by ASSASSIN on 2020/12/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FindMinMaxThread : NSThread

@property(nonatomic,assign)NSUInteger min;
@property(nonatomic,assign)NSUInteger max;

-(instancetype)initWithNumbers:(NSArray *)numbers;

@end

NS_ASSUME_NONNULL_END
