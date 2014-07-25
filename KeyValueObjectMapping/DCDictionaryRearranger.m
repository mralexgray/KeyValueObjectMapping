//
//  DCDictionaryRearranger.m
//  KeyValueObjectMapping
//
//  Created by Diego Chohfi on 4/18/12.
//  Copyright (c) 2012 dchohfi. All rights reserved.
//

#import "DCDictionaryRearranger.h"

#import "DCObjectMapping.h"
#import "DCPropertyAggregator.h"

@implementation DCDictionaryRearranger


+ (NSDictionary*) rearrangeDictionary: (NSDictionary*) dictionary forConfiguration: (DCParserConfiguration*) configuration {
    NSMutableArray* aggregators = [NSMutableArray arrayWithArray:[[configuration.aggregators reverseObjectEnumerator] allObjects]];
    NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    if(aggregators && [aggregators count] > 0){
        for(int i=(int)[aggregators count] - 1; i >= 0; --i){
            DCPropertyAggregator* aggregator = aggregators[i];
            [aggregators removeObject:aggregator];
            NSMutableDictionary *aggregatedValues = [[aggregator aggregateKeysOnDictionary:mutableDictionary] mutableCopy];
            if(mutableDictionary[aggregator.attribute]){
                [aggregatedValues addEntriesFromDictionary:mutableDictionary[aggregator.attribute]];
            }
            [mutableDictionary setValue:aggregatedValues forKey:aggregator.attribute];
        }
    }
    
    for (DCObjectMapping* mapper in configuration.objectMappers) {
        NSArray* keys = [mapper.keyReference componentsSeparatedByString:configuration.nestedPrepertiesSplitToken];
        // Composed key
        id value;
        if (keys.count >1) {
            
            for (NSString* key in keys) {
                if ([key isEqualToString:keys[0]]) {
                    value = mutableDictionary[key];
                } else if ([value isKindOfClass:[NSDictionary class]]) {
                    NSDictionary* dict = (NSDictionary*)value;
                    value = dict[key];
                    if ([key isEqualToString:[keys lastObject]]) {
                        [mutableDictionary setValue:value forKey:mapper.keyReference];
                    }
                }
            }
        }
    }
    
    return [NSDictionary dictionaryWithDictionary:mutableDictionary];
}


@end
