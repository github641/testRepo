//
//  ViewController.m
//  Runloop
//
//  Created by alldk on 2017/8/17.
//  Copyright © 2017年 alldk. All rights reserved.
//
/* lzy注170817：
 线程一般都是一次执行完任务，就销毁了。
 添加了runloop，并运行起来，实际上就是添加了一个do-while循环。
 这个线程的程序一直卡在这个do-while循环上。相当于线程的任务一直没有执行完，所以线程一直不会销毁。
 3.所以，一旦我们添加了一个runloop，并run了，那么我们如果要销毁这个线程，就必须停止runloop。
 
 [runLoop addPort:[nsmachport port] forMode:nsdefaultrunloopmode];
 
 添加一个端口，监听这个端口的事件。
 一种线程间的通信方法，即基于端口的通信。
 
 [runloop run];
 
 runloop开始跑起来，就只有一种方式可以终止了。
 [[nsrunloop currentrunloop] removePort:xxx forMode:xxx];
 只有从runloop中移除我们之前添加的端口，这样runloop没有任何时间，所以就直接退出
 
 AFN2.x的源码中，有相关的创建，但是它并没有记录下[nsmach port]的实例。显然就无法在别的地方移除之前添加的监听端口。原因就是AFN并没有打算退出这个runloop，这是一个常驻线程。
 
 看看AFN3.x，使用runloop的情况。
 开启：
 cfrunlooprun（）
 
 终止：
 cfrunloopStop（cfrunloopGetCurrent()）
 
 由于nsurlsession参考了afn2.x的优点，自己维护了一个线程池。做request线程的调度与管理。所以在afn3.x中，没有了常驻线程，都是用的时候run，结束的时候stop。
 
 
 看看rac中的runloop。
 do {
 [nsrunloop.mainrunloop runMode: nsdefaultrunloopmode beforedate:[nsdate datewithtimeintervalsincenow:0.1]];
 
 } while (!done);
 
 用一个bool值done，去控制runloop的运行，每次只运行这个模式的runloop0.1秒，0.1秒后开启runloop的下一次运行。
 
 以上是runloop在著名的开源类库中的使用示例。
 
 具体知识：
 
 Thread内部
 
 start :
 runUntilDate:
     handlePort:
     customSrc:
     mySelector:
     timerFired:
 end
 
 Input sources 内部
 
 Port  Ether
 Custom 
 performSelector:onThread:...
 
 
 Timer sources
 
 runloop，顾名思义就是跑圈，它的本质就是一个do-while循环。当有事情做的时候做事情，没有事情做的时候睡眠。
 至于怎么做事，怎么睡眠，这个是由内核来调度的。
 
 每一个线程都又一个runloop，主线程的runloop会在app运行时自动运行，子线程中需要手动获取运行，第一次获取时，才会创建。
 
 每个runloop都会以一个模式mode来运行，可以使用snrunloop的方法运行在某个特定模式mode。
 runloop的处理两大类事件源：timer source 和input source（包括了performSelector方法簇、port、或者自定义的input source），每个事件源都会绑定在rnloop的某个特定模式mode上。而且只有runloop在这个模式运行的时候才会触发timer和input source。
 
 最后如果没有任何source添加到runloop上，runloop就会立刻exit，这也是一开始af2.x的例子中，为什么需要绑定一个port的原因。
 
 先从runloop mode说起：
 iOS runloop的主要运行模式mode有：
 1.nsdefaultrunloopmode，默认的运行模式，除了nsconnection对象的事件。
 2.nsrunloopcommonmodes：是一组常用的模式集合，将一个input source关联到这个模式集合上，等于将input source关联到这个模式集合中的所有模式上。
 iOS系统中nsrunloopcommonmode包含的模式有：nsdefaultrunloopmode、nstaskdeathcheckmode、
 假如我又一个timer要关联到这些模式上，一个个注册很麻烦，我可以用：
 cfrunloopaddcommonmode（【【nsrunloop currentrunloop】getcfrunloop】，（__bridge cfstringref） uitrackingrunloopmode）；
 这个uitrackingrunloopmode或者其他模式添加到这个nsrunloopcommonmodes模式中，然后只需要将timer关联到nsrunloopcommonmodes，即可实现runloop运行在这个模式集合的任意一个模式中，这个timer都可以触发。
 
 默认情况下nsrunloopcommonmodes包含了nsdefaultrunloopmode和uitrackingrunloopmode，。
 对于一个时刻，一个runloop只能运行在一个特定模式下，而不可能同时运行在多个模式下。
 
 UITrackingRunLoopMode:用于跟踪触摸事件触发的模式。{例如UIScrollView的上下滚动}，主线程当触摸事件触发时会设置为这个模式，可以用来在控件事件触发过程中设置timer。
 
 GSEventReceiveRunLoopMode；用于接收系统事件，属于内部的runloop模式。
 自定义mode，可以设置自定义的运行mode，你也可以用CFRunLoopAddCommonMode添加到NSRunLoopCommonModes中。
 
 总结一下：
 run loop运行时只能以一种固定的模式运行，如果我们需要它切换模式，只有停掉它再重新开启它。
 run loop运行某个mode时，只会监控这个mode下添加的Timer source 和input source。如果这个模式下没有了一个事件源，runloop的运行也会立即返回的。注意runloop不能在运行在snrunloopcommonmodes模式中。因为nsrunloopcommonmodes其实是个模式集合，而不是一个具体的模式，我们可以在添加事件源的时候使用NSRunLoopCommonModes，只要runloop运行在NSRunLoopCommonModes中任意一个模式，这个事件源都可以被触发。
 
 runloop的运行接口。
 foundation和core foundation层都有相应的接口可以操作runloop：
 foundation层对应的是nsrunloop，core foundation层对应的是cfrunloopref，
 两组接口差不多，不过功能上还是有许多差别的：
 例如，cf层
 可以添加自定义input source事件源，cfrunloopsourceref。
 runloop观察者（cfrunloopobserverref）。
 
 
 nsrunloop的运行接口：
 // 运行nsrunloop，运行模式默认为nsdefaultrunloopmode模式，没有超时限制。
 -(void)run;
 不建议使用，因为这个借口会导致run loop永久性的运行在nsdefaultrunloopMode模式，
 即使使用cfrunloopStop（runloopRef），也无法停止run loop的运行，除非能移除这个runloop上所有的事件源，包括定时器和source事件。不然这个子线程就无法停止，只能永久运行下去。
 
 
 
 // 运行NSRunLoop：参数为运行时间期限，运行模式为默认的NSDefaultRunLoopMode模式
 - (void)runUntilDate:(NSDate *)limitDate;
 比上面的接口多一些控制，有超时时间可以传入，用于控制每次runloop'的运行时间。也是运行在NSDefaultRunLoopMode模式。
 
 这个方法运行run loop一段时间会退出给你检查运行条件的机会，如果需要可以再次运行run loop。
 
 注意cfrunloopStop（runloopRef）也无法停止run loop的运行。
 
 while (!Done){
 [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];
 NSLog(@"exiting runloop....");
 }
 
 Done参数，为自定义的BOOL，用于控制是否需要开启下一次的runLoop。
 
 这个runloop会每10秒钟退出一次。然后输出exiting runloop。。。，然后下一次根据我们的done值来判断是否再取运行runloop。
 
 
 // 运行NSRunLoop：参数为运行模式、时间期限，返回值为YES标识是处理事件后返回的，NO
表示超时，或者停止运行。
 - (BOOL)runMode:(NSString *)mode beforeDate:(NSDate *)limitDate;
 并上一个方法多一个mode，可以设置运行模式。
 这个运行模式是可以被CFRunLoopStop(runloopRef)所停止的。
 这个方法比上一个方法多了一种退出方式。
 这里指的退出方式是除了timer触发以外的事件，都会导致runloop退出。e.g.
 见下面的代码。
 
 使用performSelector:OnThread...这个方法去进行线程间通信，这只是其中最简单的方式。但是缺点也很明显。就是在去调用这个线程的时候，如果线程已经不存在了，程序就会crash。
 
 self.thread运行在runloop中，接收到了一个消息，这个消息是一个非timer事件，所以runloop处理完就退出了。为什么会这样呢，看下runloop的源代码。
 
 
 */



#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)NSThread *thread;
@end

@implementation ViewController

- (void)sourceOfRunloop{
    
    
    
    /// RunLoop的实现
    int CFRunLoopRunSpecific(runloop, modeName, seconds, stopAfterHandle) {
        
        /// 首先根据modeName找到对应mode
        CFRunLoopModeRef currentMode = __CFRunLoopFindMode(runloop, modeName, false);
        /// 如果mode里没有source/timer/observer, 直接返回。
        if (__CFRunLoopModeIsEmpty(currentMode)) return;
        
        /// 1. 通知 Observers: RunLoop 即将进入 loop。
        __CFRunLoopDoObservers(runloop, currentMode, kCFRunLoopEntry);
        
        /// 内部函数，进入loop
        __CFRunLoopRun(runloop, currentMode, seconds, returnAfterSourceHandled) {
            
            Boolean sourceHandledThisLoop = NO;
            int retVal = 0;
            do {
                
                /// 2. 通知 Observers: RunLoop 即将触发 Timer 回调。
                __CFRunLoopDoObservers(runloop, currentMode, kCFRunLoopBeforeTimers);
                /// 3. 通知 Observers: RunLoop 即将触发 Source0 (非port) 回调。
                __CFRunLoopDoObservers(runloop, currentMode, kCFRunLoopBeforeSources);
                /// 执行被加入的block
                __CFRunLoopDoBlocks(runloop, currentMode);
                
                /// 4. RunLoop 触发 Source0 (非port) 回调。
                sourceHandledThisLoop = __CFRunLoopDoSources0(runloop, currentMode, stopAfterHandle);
                /// 执行被加入的block
                __CFRunLoopDoBlocks(runloop, currentMode);
                
                /// 5. 如果有 Source1 (基于port) 处于 ready 状态，直接处理这个 Source1 然后跳转去处理消息。
                if (__Source0DidDispatchPortLastTime) {
                    Boolean hasMsg = __CFRunLoopServiceMachPort(dispatchPort, &msg)
                    if (hasMsg) goto handle_msg;
                }
                
                /// 6.通知 Observers: RunLoop 的线程即将进入休眠(sleep)。
                if (!sourceHandledThisLoop) {
                    __CFRunLoopDoObservers(runloop, currentMode, kCFRunLoopBeforeWaiting);
                }
                
                /// 7. 调用 mach_msg 等待接受 mach_port 的消息。线程将进入休眠, 直到被下面某一个事件唤醒。
                /// ? 一个基于 port 的Source 的事件。
                /// ? 一个 Timer 到时间了
                /// ? RunLoop 自身的超时时间到了
                /// ? 被其他什么调用者手动唤醒
                __CFRunLoopServiceMachPort(waitSet, &msg, sizeof(msg_buffer), &livePort) {
                    mach_msg(msg, MACH_RCV_MSG, port); // thread wait for receive msg
                }
                
                /// 8. 通知 Observers: RunLoop 的线程刚刚被唤醒了。
                __CFRunLoopDoObservers(runloop, currentMode, kCFRunLoopAfterWaiting);
                
                /// 9.收到消息，处理消息。
            handle_msg:
                
                /// 10.1 如果一个 Timer 到时间了，触发这个Timer的回调。
                if (msg_is_timer) {
                    __CFRunLoopDoTimers(runloop, currentMode, mach_absolute_time())
                }
                
                /// 10.2 如果有dispatch到main_queue的block，执行block。
                else if (msg_is_dispatch) {
                    __CFRUNLOOP_IS_SERVICING_THE_MAIN_DISPATCH_QUEUE__(msg);
                }
                
                /// 10.3 如果一个 Source1 (基于port) 发出事件了，处理这个事件
                else {
                    CFRunLoopSourceRef source1 = __CFRunLoopModeFindSourceForMachPort(runloop, currentMode, livePort);
                    sourceHandledThisLoop = __CFRunLoopDoSource1(runloop, currentMode, source1, msg);
                    if (sourceHandledThisLoop) {
                        mach_msg(reply, MACH_SEND_MSG, reply);
                    }
                }
                
                /// 执行加入到Loop的block
                __CFRunLoopDoBlocks(runloop, currentMode);
                
                
                if (sourceHandledThisLoop && stopAfterHandle) {
                    /// 进入loop时参数说处理完事件就返回。
                    retVal = kCFRunLoopRunHandledSource;
                } else if (timeout) {
                    /// 超出传入参数标记的超时时间了
                    retVal = kCFRunLoopRunTimedOut;
                } else if (__CFRunLoopIsStopped(runloop)) {
                    /// 被外部调用者强制停止了
                    retVal = kCFRunLoopRunStopped;
                } else if (__CFRunLoopModeIsEmpty(runloop, currentMode)) {
                    /// source/timer/observer一个都没有了
                    retVal = kCFRunLoopRunFinished;
                }
                
                /// 如果没超时，mode里没空，loop也没被停止，那继续loop。
            } while (retVal == 0);
        }
        
        /// 11. 通知 Observers: RunLoop 即将退出。
        __CFRunLoopDoObservers(rl, currentMode, kCFRunLoopExit);
    }
    

    
    
   
}

- (void)testDemo1{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"线程开始");
        //获取当前线程
        self.thread = [NSThread currentThread];
        
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        // 添加一个port，同理为了防止runloop没事干直接退出
        [runloop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        
        // 运行一个runloop，[NSDate distantFuture]:很久很久以后才让它失效
        [runloop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        
        NSLog(@"线程结束");
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 开启异步线程调用方法
        [self performSelector:@selector(receiveMsg) onThread:self.thread withObject:nil waitUntilDone:NO];
         
         
         });
}

- (void)receiveMsg{
    NSLog(@"收到消息了，在这个线程%@", [NSThread currentThread]);
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
