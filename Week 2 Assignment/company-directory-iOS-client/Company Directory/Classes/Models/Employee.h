//
//  Employee.h
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/05.
//  Copyright (c) 2011年 CabForward. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Department.h"

@interface Employee : NSObject

@property (nonatomic, retain) Department *department;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *jobTitle;
@property (nonatomic, retain) NSDate *birthday;
@property (nonatomic, retain) NSNumber *salary;
@property (nonatomic, retain) NSURL *imageUrl;
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, copy) NSString *email;

- (id)initWithAttributes:(NSDictionary *)attributes;

- (NSString *)formattedBirthdayString;
- (NSString *)formattedSalaryString;
- (UIImage *)image;

+ (NSArray *)employeesWithAttributes:(NSDictionary *)attributes;
+ (void)employeesWithBlock:(void (^)(NSArray *employees))block;

@end
