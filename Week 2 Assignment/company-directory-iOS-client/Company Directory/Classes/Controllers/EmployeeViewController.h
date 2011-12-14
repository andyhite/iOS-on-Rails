//
//  EmployeeViewController.h
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/07.
//  Copyright (c) 2011年 Gowalla. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <QuartzCore/QuartzCore.h>

// This is a forward-class declaration, used instead of an #import. 
// See http://stackoverflow.com/questions/322597/class-vs-import for a detailed explanation.
@class Employee;

@interface EmployeeViewController : UITableViewController <MFMailComposeViewControllerDelegate, UIActionSheetDelegate>

@property (readonly, nonatomic, retain) Employee *employee;

- (id)initWithEmployee:(Employee *)employee;
- (void)callPhoneNumber;
- (void)composeMail;
@end
