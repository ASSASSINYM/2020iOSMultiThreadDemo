//
//  FindMinMaxThread.m
//  2020iOSMultiThreadDemo
//
//  Created by ASSASSIN on 2020/12/30.
//

#import "FindMinMaxThread.h"

@interface FindMinMaxThread ()

@property(nonatomic,strong)NSArray *numbers;

@end

@implementation FindMinMaxThread

-(instancetype)initWithNumbers:(NSArray *)numbers {
    if (self = [super init]) {
        self.numbers = numbers;
    }
    return self;
}

-(void)main {
    NSUInteger min = 0;
    NSUInteger max = 0;
    self.min = min;
    self.max = max;
    
    if (self.finished) {
        NSLog(@"min = %lu max = %lu",(unsigned long)self.min,self.max);
    }
}

@end
