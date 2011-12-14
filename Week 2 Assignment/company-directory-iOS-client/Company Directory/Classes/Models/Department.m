//
//  Department.m
//  Company Directory
//
//  Created by Andrew Hite on 12/14/11.
//  Copyright (c) 2011 Gowalla. All rights reserved.
//

#import "CompanyDirectoryAPIClient.h"

#import "Department.h"
#import "Employee.h"

@implementation Department

@synthesize name = _name;
@synthesize employees = _employees;

- (void)dealloc {
    [_name release];
    [_employees release];
    [super dealloc];
}

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.name = [attributes valueForKey:@"name"];
    self.employees = [Employee employeesWithAttributes:[attributes valueForKey:@"employees"]];
    
    return self;
}

- (void)setEmployees:(NSArray *)employees {
    [self willChangeValueForKey:@"employees"];
    [employees retain];
    [_employees release];
    _employees = employees;
    [self didChangeValueForKey:@"employees"];
    
    for (Employee *employee in self.employees) {
        employee.department = self;
    }
}

+ (void)departmentsWithBlock:(void (^)(NSArray *departments))block {
    [[CompanyDirectoryAPIClient sharedClient] getPath:@"/departments" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *mutableDepartments = [NSMutableArray array];
        for (NSDictionary *attributes in [responseObject valueForKey:@"departments"]) {
            Department *department = [[[Department alloc] initWithAttributes:attributes] autorelease];
            [mutableDepartments addObject:department];
            
            if (block) {
                block(mutableDepartments);
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
