//
//  Employee.m
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/05.
//  Copyright (c) 2011年 CabForward. All rights reserved.
//

#import "CompanyDirectoryAPIClient.h"

#import "Employee.h"

#import "ISO8601DateFormatter.h"

static NSDate * BirthdayWithMonthDayYear(NSUInteger month, NSUInteger day, NSUInteger year) {
    NSCalendar *gregorianCalendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    
    NSDateComponents *birthdayComponents = [[[NSDateComponents alloc] init] autorelease];
    [birthdayComponents setMonth:month];
    [birthdayComponents setDay:day];
    [birthdayComponents setYear:year];
    
    return [gregorianCalendar dateFromComponents:birthdayComponents];
}

@implementation Employee

@synthesize department = _department;
@synthesize name = _name;
@synthesize jobTitle = _jobTitle;
@synthesize birthday = _birthday;
@synthesize salary = _salary;

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.name = [attributes valueForKey:@"name"];
    self.jobTitle = [attributes valueForKey:@"job_title"];
    
    ISO8601DateFormatter *iso8601Formatter = [[[ISO8601DateFormatter alloc] init] autorelease];
    self.birthday = [iso8601Formatter dateFromString:[attributes valueForKey:@"birthday"]];
    
    self.salary = [NSNumber numberWithFloat:[[attributes valueForKey:@"salary"] floatValue]];
    
    return self;
}

- (void)dealloc {
    [_name release];
    [_jobTitle release];
    [_birthday release];
    [_salary release];
    [super dealloc];
}

- (NSString *)formattedBirthdayString {
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    return [dateFormatter stringFromDate:self.birthday];
}

- (NSString *)formattedSalaryString {
    NSNumberFormatter *numberFormatter = [[[NSNumberFormatter alloc] init] autorelease];
    [numberFormatter setLocale:[NSLocale currentLocale]];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    return [numberFormatter stringFromNumber:self.salary];
}

+ (NSArray *)employeesWithAttributes:(NSDictionary *)attributes {
    NSMutableArray *mutableEmployees = [NSMutableArray array];
    for (NSDictionary *employeeAttributes in attributes) {
        Employee *employee = [[[Employee alloc] initWithAttributes:employeeAttributes] autorelease];
        [mutableEmployees addObject:employee];
    }
    return mutableEmployees;
}

+ (void)employeesWithBlock:(void (^)(NSArray *employees))block {
    [[CompanyDirectoryAPIClient sharedClient] getPath:@"employees" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (block) {
            block([Employee employeesWithAttributes:[responseObject valueForKey:@"employees"]]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}


@end
