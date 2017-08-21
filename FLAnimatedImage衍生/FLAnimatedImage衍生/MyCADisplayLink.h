//
//  MyCADisplayLink.h
//  FLAnimatedImage衍生
//
//  Created by alldk on 2017/8/16.
//  Copyright © 2017年 alldk. All rights reserved.
//

//#import <QuartzCore/CABase.h>
//#import <Foundation/NSObject.h>
//
//@class NSString, NSRunLoop;
//
//NS_ASSUME_NONNULL_BEGIN
//这个类是一个，定时器，用于vsync（vertical sync）垂直同步
///** Class representing a timer bound to the display vsync. **/
//
//CA_CLASS_AVAILABLE_IOS(3.1, 9.0, 2.0)
//@interface CADisplayLink : NSObject
//{
//@private
//    void *_impl;
//}
//为main display创建一个新的display链接对象。它将在target上调用方法sel。方法有方法签名：'(void)selector:(CADisplayLink *)sender'
///* Create a new display link object for the main display. It will
// * invoke the method called 'sel' on 'target', the method has the
// * signature '(void)selector:(CADisplayLink *)sender'. */
//
//+ (CADisplayLink *)displayLinkWithTarget:(id)target selector:(SEL)sel;
//把接收者加入到指定的run-loop和mode中。除非自身被暂停，不然它将在每一个垂直同步时被触发。每一个对象只能被加入到单一的run-loop中，但是它可能被一次性添加到多个mode中。当它被加入到一个run-loop中，它将被『隐式的』持有住。
///* Adds the receiver to the given run-loop and mode. Unless paused, it
// * will fire every vsync until removed. Each object may only be added
// * to a single run-loop, but it may be added in multiple modes at once.
// * While added to a run-loop it will implicitly be retained. */
//
//- (void)addToRunLoop:(NSRunLoop *)runloop forMode:(NSRunLoopMode)mode;
//
///* Removes the receiver from the given mode of the runloop. This will
// * implicitly release it when removed from the last mode it has been
// * registered for. */
//将接收者从给定的runloop的mode中移除，当它从最后一个注册的mode移除的时候，它将被隐式的release
//- (void)removeFromRunLoop:(NSRunLoop *)runloop forMode:(NSRunLoopMode)mode;
//
///* Removes the object from all runloop modes (releasing the receiver if
// * it has been implicitly retained) and releases the 'target' object. */
//这将把它从所有的runloop modes中移除，如果曾经被隐式的retain，那么将被隐式的release。并且将把『target』隐式的release
//- (void)invalidate;
//
///* The current time, and duration of the display frame associated with
// * the most recent target invocation. Time is represented using the
// * normal Core Animation conventions, i.e. Mach host time converted to
// * seconds. */
// 当前的时间，最近的target消息的展示帧数所经历的时间长度。time一般使用一般 Core Animation惯例。i.e.
//@property(readonly, nonatomic) CFTimeInterval timestamp;
//@property(readonly, nonatomic) CFTimeInterval duration;
//
///* The next timestamp that the client should target their render for. */
//
//@property(readonly, nonatomic) CFTimeInterval targetTimestamp CA_AVAILABLE_IOS_STARTING(10.0, 10.0, 3.0);
//
///* When true the object is prevented from firing. Initial state is
// * false. */
// 初始为NO
//@property(getter=isPaused, nonatomic) BOOL paused;
//
///* Defines how many display frames must pass between each time the
// * display link fires. Default value is one, which means the display
// * link will fire for every display frame. Setting the interval to two
// * will cause the display link to fire every other display frame, and
// * so on. The behavior when using values less than one is undefined.
// * DEPRECATED - use preferredFramesPerSecond. */
// display link的触发间隔时间内，默认多少的展示帧数必须被传递。默认值是1。如果设置为2，那么将在display link每两次被触发是传递展示帧数。其他大于1的数值类似。若设置小于1的值，是为被定义的。
// 这个值已经被废弃了，需要使用 preferredFramesPerSecond
//@property(nonatomic) NSInteger frameInterval
//CA_AVAILABLE_BUT_DEPRECATED_IOS (3.1, 10.0, 9.0, 10.0, 2.0, 3.0, "use preferredFramesPerSecond");
//
///* Defines the desired callback rate in frames-per-second for this
// * display link. The default value is 60. If set to zero, the
// * display link will fire at the native cadence`keɪdns` of the display hardware.
// * The display link will make a best-effort attempt at issuing callbacks
// * at the requested rate. */
// 定义了 frames-per-seconde的默认的回调频率。默认的值是60。如果设置为0，那么它将使用 dispaly 硬件默认的节奏。
//@property(nonatomic) NSInteger preferredFramesPerSecond CA_AVAILABLE_IOS_STARTING(10.0, 10.0, 3.0);
//
//@end

/* lzy注170816：文档
 

 Relationships
 A CADisplayLink object is a timer object that allows your application to synchronize its drawing to the refresh rate of the display.
 
 Overview
 
 addToRunLoop:forMode: method
 
 Your application initializes a new display link, providing a target object and a selector to be called when the screen is updated. To synchronize your display loop with the display, your application adds it to a run loop using the addToRunLoop:forMode: method
 
 timestamp
 Once the display link is associated with a run loop, the selector on the target is called when the screen’s contents need to be updated. The target can read the display link’s timestamp property to retrieve the time that the previous frame was displayed. For example, an application that displays movies might use the timestamp to calculate which video frame will be displayed next. An application that performs its own animations might use the timestamp to determine where and how displayed objects appear in the upcoming frame. 
 
 duration
 The duration property provides the amount of time between frames. You can use this value in your application to calculate the frame rate of the display, the approximate time that the next frame will be displayed, and to adjust the drawing behavior so that the next frame is prepared in time to be displayed.
 
 Your application can disable notifications by setting the paused property to YES. Also, if your application cannot provide frames in the time provided, you may want to choose a slower frame rate. An application with a slower but consistent frame rate appears smoother to the user than an application that skips frames. You can define the number of frames per second by setting the preferredFramesPerSecond property.
 
 When your application finishes with a display link, it should call invalidate to remove it from all run loops and to disassociate it from the target.
 
 不应该被自定义。
 CADisplayLink should not be subclassed.
 
 */

#import <QuartzCore/QuartzCore.h>

@interface MyCADisplayLink : CADisplayLink

@end
