//
//  MyProxy.h
//  FLAnimatedImage衍生
//
//  Created by alldk on 2017/8/16.
//  Copyright © 2017年 alldk. All rights reserved.
//


/* lzy注170816：
 申明了方法签名类、消息类
 */
//@class NSMethodSignature, NSInvocation;
//
//NS_ASSUME_NONNULL_BEGIN
// 有一个标识这个类是根类的宏，内部是objc_root_class；
// isa指针
//NS_ROOT_CLASS
//@interface NSProxy <NSObject> {
//    Class	isa;
//}
//
//+ (id)alloc;
//+ (id)allocWithZone:(nullable NSZone *)zone NS_AUTOMATED_REFCOUNT_UNAVAILABLE;
//+ (Class)class;
//
//- (void)forwardInvocation:(NSInvocation *)invocation;
//- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel NS_SWIFT_UNAVAILABLE("NSInvocation and related APIs not available");
//- (void)dealloc;
//- (void)finalize;
//@property (readonly, copy) NSString *description;
//@property (readonly, copy) NSString *debugDescription;
//+ (BOOL)respondsToSelector:(SEL)aSelector;
//
//- (BOOL)allowsWeakReference NS_UNAVAILABLE;
//- (BOOL)retainWeakReference NS_UNAVAILABLE;
//
//// - (id)forwardingTargetForSelector:(SEL)aSelector;
//
//@end

/* lzy注170816：
 NSProxy is an abstract superclass defining an API for objects that act as stand-ins（替身） for other objects or for objects that don’t exist yet.
 
 Typically, a message to a proxy is forwarded（传递、转发） to the real object or causes the proxy to load (or transform itself into) the real object.
 
 Subclasses of NSProxy can be used to implement transparent distributed messaging (for example, NSDistantObject) or for lazy instantiation（懒加载实例化） of objects that are expensive to create.
 
 NSProxy implements the basic methods required of a root class, including those defined in the NSObject protocol.
 
 However, as an abstract class it doesn’t provide an initialization method, and it raises an exception upon receiving any message it doesn’t respond to.
 
  A concrete subclass must therefore provide an initialization or creation method and override the forwardInvocation: and methodSignatureForSelector: methods to handle messages that it doesn’t implement itself.
 
 A subclass’s implementation of forwardInvocation: should do whatever is needed to process the invocation, such as forwarding the invocation over the network or loading the real object and passing it the invocation. 
 
 methodSignatureForSelector: is required to provide argument type information for a given message; a subclass’s implementation should be able to determine the argument types for the messages it needs to forward and should construct an NSMethodSignature object accordingly. 
 
 See the NSDistantObject, NSInvocation, and NSMethodSignature class specifications for more information.
 */

#import <Foundation/Foundation.h>

@interface MyProxy : NSProxy

@end
