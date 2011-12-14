//
//  EmployeeViewController.m
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/07.
//  Copyright (c) 2011年 Gowalla. All rights reserved.
//

#import "EmployeeViewController.h"

#import "Employee.h"

enum {
    BirthdayRowIndex    = 2,
    SalaryRowIndex      = 3,
} EmployeeViewControllerRowIndexes;

@interface EmployeeViewController ()
@property (readwrite, nonatomic, retain) Employee *employee;

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@implementation EmployeeViewController
@synthesize employee = _employee;

- (id)initWithEmployee:(Employee *)employee {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (!self) {
        return nil;
    }
    
    self.employee = employee;
    
    return self;
}

- (void)dealloc {
    [_employee release];
    [super dealloc];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.employee.name;
    
    
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    switch (indexPath.row) {
        case BirthdayRowIndex:
            cell.textLabel.text = NSLocalizedString(@"Birthday", nil);
            cell.detailTextLabel.text = [self.employee formattedBirthdayString];
            break;
        case SalaryRowIndex:
            cell.textLabel.text = NSLocalizedString(@"Salary", nil);
            cell.detailTextLabel.text = [self.employee formattedSalaryString];
            break;
        default:
            break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    // Header container view
    UIView *headerView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 100)] autorelease];
    [headerView setBackgroundColor:[UIColor clearColor]];
    
    // Employee image
    UIImageView *imageView = [[[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)] autorelease];
    
    // Employee name label
    UILabel *nameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(100, 10, 210, 40)] autorelease];
    [nameLabel setBackgroundColor:[UIColor clearColor]];
    [nameLabel setFont:[UIFont boldSystemFontOfSize:24]];
    
    // Employee job title label
    UILabel *jobTitleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(100, 50, 210, 40)] autorelease];
    [jobTitleLabel setBackgroundColor:[UIColor clearColor]];
    [jobTitleLabel setFont:[UIFont systemFontOfSize:18]];
            
    // Add the subviews
    [headerView addSubview:nameLabel];
    [headerView addSubview:jobTitleLabel];
    [headerView addSubview:imageView];
    
    nameLabel.text = self.employee.name;
    jobTitleLabel.text = self.employee.jobTitle;
    imageView.image = self.employee.image;
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 100;
}

@end
