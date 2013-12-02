//
//  DCValueConverter.h
//  DCKeyValueObjectMapping
//
//  Created by Diego Chohfi on 4/13/12.
//  Copyright (c) 2012 None. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DCDynamicAttribute, DCParserConfiguration;

@protocol DCValueConverter <NSObject>

@required
- (id)transformValue:(id)value forDynamicAttribute:(DCDynamicAttribute *)attribute dictionary:(NSDictionary *)dictionary parentObject:(id)parentObject;
- (id)serializeValue:(id)value forDynamicAttribute:(DCDynamicAttribute *)attribute;
<<<<<<< HEAD
- (BOOL)canTransformValueForClass:(Class)klass;
=======
- (BOOL)canTransformValueForClass:(Class)cls;
>>>>>>> Change varialble  to  because class is used in c++

@end
