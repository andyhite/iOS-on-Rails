//
//  Department.h
//  Company Directory
//
//  Created by Andrew Hite on 12/14/11.
//  Copyright (c) 2011 Gowalla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Department : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSArray *employees;

- (id)initWithAttributes:(NSDictionary *)attributes;

+ (void)departmentsWithBlock:(void (^)(NSArray *departments))block;

@end
