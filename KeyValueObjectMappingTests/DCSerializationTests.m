//
//  DCSerializationTests.m
//  KeyValueObjectMapping
//
//  Created by Diego Chohfi on 6/13/12.
//  Copyright (c) 2012 dchohfi. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "DCKeyValueObjectMapping.h"
#import "DCObjectMapping.h"
#import "DCParserConfiguration.h"
#import "Bus.h"

@interface DCSerializationTests : SenTestCase
@property(nonatomic) DCKeyValueObjectMapping *parser;
@end

@implementation DCSerializationTests @synthesize parser;

-(void)setUp {
    DCParserConfiguration *configuration = [DCParserConfiguration configuration];
    
    DCObjectMapping *nameMapper = [DCObjectMapping mapKeyPath:@"name" toAttribute:@"name" onClass:[Bus class]];

    [configuration addObjectMapping:nameMapper];
    
    
    parser = [DCKeyValueObjectMapping mapperForClass:[Bus class] andConfiguration:configuration];

}

- (void)testSimpleFieldSerialization {
    Location *localizacao = [[Location alloc] initWithLatitude:@10 andLongitude:@20];
    Bus *bus = [[Bus alloc] initWithName:@"Vila carrão" andLocation:localizacao];
    
    NSDictionary *busParsed = [parser serializeObject:bus];
    STAssertTrue([busParsed[@"name"] isEqualToString:@"Vila carrão"], nil);
    STAssertTrue([busParsed[@"name"] isEqualToString:@"Vila carrão"], nil);
}


@end
