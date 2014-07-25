//
//  DCNSDateConverter.h
//  DCKeyValueObjectMapping
//
//  Created by Diego Chohfi on 4/13/12.
//  Copyright (c) 2012 None. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCValueConverter.h"

@interface DCNSDateConverter : NSObject <DCValueConverter>

@property(readonly) NSString *pattern;

- (BOOL) validDouble:(NSString*)doubleValue;

+ (DCNSDateConverter*) dateConverterForPattern:(NSString*)pattern;

@end
