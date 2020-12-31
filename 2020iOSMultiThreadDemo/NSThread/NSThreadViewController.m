//
//  NSThreadViewController.m
//  2020iOSMultiThreadDemo
//
//  Created by ASSASSIN on 2020/12/30.
//

#import "NSThreadViewController.h"
#import "FindMinMaxThread.h"

@interface NSThreadViewController ()

@property(nonatomic,strong)NSArray *numbers;

@end

@implementation NSThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self performSelector:@selector(print) withObject:nil afterDelay:5];
    
    for (int i = 0; i < 10000; i++) {
        FindMinMaxThread *thread = [[FindMinMaxThread alloc] initWithTarget:self selector:@selector(print) object:nil];
        [thread start];
    }
    
//    [NSThread detachNewThreadWithBlock:^{
//        [self print];
//    }];
    
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(print) object:nil];
//    NSLog(@"threadDictionary = %@",thread.threadDictionary);
//    NSLog(@"stackSize = %lu",(unsigned long)thread.stackSize);
//    NSLog(@"threadPriority = %lu",(unsigned long)thread.threadPriority);
//
//
//    [thread start];
    
//    NSMutableSet *threads = [NSMutableSet set];
//    NSUInteger numberCount = 10000;
//    NSUInteger threadCount = 4;
//    for (NSUInteger i = 0; i < threadCount; i++) {
//        NSUInteger offset = (numberCount / threadCount) * i;
//            NSUInteger count = MIN(numberCount - offset, numberCount / threadCount);
//            NSRange range = NSMakeRange(offset, count);
//            NSArray *subset = [self.numbers subarrayWithRange:range];
//            FindMinMaxThread *thread = [[FindMinMaxThread alloc] initWithNumbers:subset];
//            [threads addObject:thread];
//            [thread start];
//    }
//
//    for (FindMinMaxThread *thread in threads) {
//        if (thread.finished) {
//            NSLog(@"min = %lu max = %lu",thread.min,thread.min);
//        }
//    }
}

#pragma mark - method

-(void)print {
    NSLog(@"%@",[NSThread currentThread]);
    dispatch_async(dispatch_get_main_queue(), ^{
        self.view.backgroundColor = [UIColor redColor];
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
