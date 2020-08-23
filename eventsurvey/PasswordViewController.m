//
//  PasswordViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 16/12/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <QuartzCore/QuartzCore.h>

#import "DashboardViewController.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "CommonUtils.h"
#import "PasswordViewController.h"
#import "NSString+AESCrypt.h"


@interface PasswordViewController ()



@end

#pragma mark -

#define IMAGE_WIDTH 320

#define IMAGE_HEIGHT 360



@implementation PasswordViewController

@synthesize lblNewPassword;
@synthesize lblOldPassword;
@synthesize lblRepeatPassword;

@synthesize txtNewPassword;
@synthesize txtOldPassword;
@synthesize txtRepeatPassword;

@synthesize btnChangePassword;





@synthesize menuId;

@synthesize dataDictionary;
//@synthesize lastLoginDate;
//@synthesize deviceToken;
//@synthesize newsArray;
//@synthesize newsDateArray;

@synthesize passwordArray;
@synthesize passwordData;

@synthesize userArray;
@synthesize userData;

//NSUInteger numberOfImages=3;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor=[UIColor controllerBGColor];
    
   
    
    
    //[self.navigationItem setHidesBackButton:NO animated:YES];
    
    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryHidden;
    [self.splitViewController.displayModeButtonItem action];
    
    
    self.navigationItem.title=@"Change Password";
    
    //UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,150,20)];
    //    UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,20,40)];
    //    companyLogo.image=[UIImage imageNamed:@"logo_MobileBanker1.png"];//@"Mashreq_logo.png"];
    //    companyLogo.contentMode = UIViewContentModeScaleAspectFit;
    //    companyLogo.clipsToBounds = NO;
    //    companyLogo.layer.masksToBounds=NO;
    //[self.view addSubview:companyLogo];
    
    //self.navigationItem.titleView=companyLogo;
    
    
    
    
    
    [CommonUtils loadActivityIndicator:self];
    
    
    //    keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"TechElite" accessGroup:nil];
    //
    //    keychainUserid = [keychainItem objectForKey:(__bridge id)(kSecAttrAccount)];
    //    keychainPassword = [keychainItem objectForKey:(__bridge id)(kSecValueData)];
    
    
    
    
    
    lblOldPassword = [[UILabel alloc] init];
    lblOldPassword.font = [UIFont systemFontOfSize:18];
    lblOldPassword.text=@"Old Password";
    lblOldPassword.contentMode=UIControlContentHorizontalAlignmentLeft;
    lblOldPassword.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblOldPassword];
    
    
    
    lblNewPassword = [[UILabel alloc] init];
    lblNewPassword.font = [UIFont systemFontOfSize:18];
    lblNewPassword.text=@"New Password";
    lblNewPassword.contentMode=UIControlContentHorizontalAlignmentLeft;
    lblNewPassword.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblNewPassword];
    
    
    
    lblRepeatPassword = [[UILabel alloc] init];
    lblRepeatPassword.font = [UIFont systemFontOfSize:18];
    lblRepeatPassword.text=@"Repeat Password";
    lblRepeatPassword.contentMode=UIControlContentHorizontalAlignmentLeft;
    lblRepeatPassword.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblRepeatPassword];
    
    
    txtOldPassword = [[UITextField alloc] init];
    txtOldPassword.borderStyle = UITextBorderStyleRoundedRect;
    txtOldPassword.layer.borderWidth=0.5;
    txtOldPassword.layer.borderColor=[UIColor blackColor].CGColor;
    txtOldPassword.layer.cornerRadius=5.0;
    txtOldPassword.font = [UIFont systemFontOfSize:18];
    txtOldPassword.placeholder = @"Enter old password";
    txtOldPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    txtOldPassword.keyboardType = UIKeyboardTypeDefault;
    txtOldPassword.returnKeyType = UIReturnKeyDone;
    txtOldPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtOldPassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtOldPassword.delegate = self;
    //txtOldPassword.text=@"saikiran";
    
    //    if(keychainUserid!=nil)
    //   {
    //        txtUserid.text=keychainUserid;
    //    }
    [txtOldPassword setSecureTextEntry:YES];
    txtOldPassword.delegate=self;
    txtOldPassword.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtOldPassword];
    
    
    
    txtNewPassword = [[UITextField alloc] init];
    txtNewPassword.borderStyle = UITextBorderStyleRoundedRect;
    txtNewPassword.layer.borderWidth=0.5;
    txtNewPassword.layer.borderColor=[UIColor blackColor].CGColor;
    txtNewPassword.layer.cornerRadius=5.0;
    txtNewPassword.font = [UIFont systemFontOfSize:18];
    txtNewPassword.placeholder = @"Enter New Password";
    txtNewPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    txtNewPassword.keyboardType = UIKeyboardTypeDefault;
    txtNewPassword.returnKeyType = UIReturnKeyDone;
    txtNewPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtNewPassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtNewPassword.delegate = self;
    //    if(keychainUserid!=nil)
    //    {
    //        txtPassword.text=keychainUserid;
    //    }
    [txtNewPassword setSecureTextEntry:YES];
    txtNewPassword.delegate=self;
    txtNewPassword.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtNewPassword];
    
    
    txtRepeatPassword = [[UITextField alloc] init];
    txtRepeatPassword.borderStyle = UITextBorderStyleRoundedRect;
    txtRepeatPassword.layer.borderWidth=0.5;
    txtRepeatPassword.layer.borderColor=[UIColor blackColor].CGColor;
    txtRepeatPassword.layer.cornerRadius=5.0;
    txtRepeatPassword.font = [UIFont systemFontOfSize:18];
    txtRepeatPassword.placeholder = @"Repeat New Password";
    txtRepeatPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    txtRepeatPassword.keyboardType = UIKeyboardTypeDefault;
    txtRepeatPassword.returnKeyType = UIReturnKeyDone;
    txtRepeatPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtRepeatPassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtRepeatPassword.delegate = self;
    //    if(keychainUserid!=nil)
    //    {
    //        txtPassword.text=keychainUserid;
    //    }
    [txtRepeatPassword setSecureTextEntry:YES];
    txtRepeatPassword.delegate=self;
    txtRepeatPassword.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtRepeatPassword];
    
    
    btnChangePassword = [[UIButton alloc ] init];//WithFrame:CGRectMake(120, 200, 60, 30) ];
    [btnChangePassword setTitle:@"Change Password" forState:UIControlStateNormal];
    //btnLogin.titleLabel.text=@"Login";
    //[btnLogin setTitleColor:[UIColor grayColor] forState: UIControlStateNormal];
    //btnLogin.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    btnChangePassword.layer.borderColor=[UIColor grayColor].CGColor;
    btnChangePassword.layer.borderWidth=0.5f;
    [btnChangePassword setBackgroundColor:[UIColor whiteColor]];
    [btnChangePassword setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //btnLogin.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
    btnChangePassword.titleLabel.font = [UIFont systemFontOfSize:18];
    btnChangePassword.layer.cornerRadius=5.0f;
    //btnLogin.layer.masksToBounds=YES;
    //btnLogin.clipsToBounds=YES;
    [btnChangePassword addTarget:self action:@selector(doValidate) forControlEvents:UIControlEventTouchUpInside];
    btnChangePassword.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnChangePassword];
    
    //
    //    lblMessage = [[UILabel alloc] initWithFrame:CGRectMake(40, 240, 300, 20)];
    //    lblMessage.font = [UIFont systemFontOfSize:14];
    //    lblMessage.contentMode=UIControlContentHorizontalAlignmentLeft;
    //    [self.view addSubview:lblMessage];
    
    
    
    //------lblOldpassword
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblOldPassword attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblOldPassword attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:-110]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtOldPassword attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtOldPassword attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtOldPassword attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    //[self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtUserid attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtUserid attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    //
    //-------lblNewPassword
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblNewPassword attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.55 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblNewPassword attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:-110]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtNewPassword attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.55 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtNewPassword attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtNewPassword attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    //[self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtPassword attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];
    
    //-------lblRepeatPassword
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblRepeatPassword attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblRepeatPassword attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:-110]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtRepeatPassword attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtRepeatPassword attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtRepeatPassword attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    
    //-----Password Creation button
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnChangePassword attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.85 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnChangePassword attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnChangePassword attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnChangePassword attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
   
    
    
    
    
    //    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    //    //tableView.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    //    tableView.delegate = self;
    //    tableView.dataSource = self;
    //    //tableView.frame = CGRectMake(30,200,270,300);
    //    tableView.backgroundColor = [UIColor whiteColor];//[UIColor groupTableViewBackgroundColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];////[UIColor lightGrayColor];
    //    tableView.layer.borderWidth=1.0f;
    //    tableView.layer.borderColor=[UIColor borderBlueColor].CGColor;
    //    tableView.layer.cornerRadius=15.0f;
    //    //tableView.allowsSelection = NO;
    //    tableView.alwaysBounceVertical = NO;
    //    tableView.contentInset = UIEdgeInsetsMake(-40, 0, 0, 0);
    //
    //    tableView.sectionHeaderHeight = 0.0;
    //    tableView.sectionFooterHeight = 0.0;
    //
    //    //self.edgesForExtendedLayout = UIRectEdgeNone;
    //
    //    //    CGRect titleRect = CGRectMake(0, 0, 100, 20);
    //    //    UILabel *tableTitle = [[UILabel alloc] initWithFrame:titleRect];
    //    //    tableTitle.textColor = [UIColor captionColor];
    //    //    tableTitle.backgroundColor = [tableView backgroundColor];
    //    //    tableTitle.opaque = YES;
    //    //    tableTitle.font = [UIFont boldSystemFontOfSize:14];
    //    //    tableTitle.textAlignment=NSTextAlignmentCenter;
    //    //    tableTitle.text = @"";
    //    //    //tableTitle.translatesAutoresizingMaskIntoConstraints=NO;
    //    //    tableView.tableHeaderView = tableTitle;
    //
    //    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    //    //[tableView setSeparatorColor:[UIColor whiteColor]];
    //    tableView.separatorInset=UIEdgeInsetsZero;
    //    //tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //
    //
    //    // add to canvas
    //    tableView.translatesAutoresizingMaskIntoConstraints=NO;
    //    //[self.view addSubview:tableView];
    //
    
    //    //---header UIView
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.62 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.90 constant:0]];
    //
    //    newsDateArray = [[NSMutableArray alloc] init];
    //    newsArray = [[NSMutableArray alloc] init];
    //
    //    [newsDateArray addObject:@"01-Mar-2015"];
    //    [newsDateArray addObject:@"25-Feb-2015"];
    //    [newsDateArray addObject:@"20-Feb-2015"];
    //    [newsDateArray addObject:@"28-Jan-2015"];
    //    [newsDateArray addObject:@"10-Jan-2015"];
    //
    //    [newsArray addObject:@"New product launched"];
    //    [newsArray addObject:@"New Branch opened in Quasis"];
    //    [newsArray addObject:@"New credit card launched"];
    //    [newsArray addObject:@"New branch opened in Burdubai"];
    //    [newsArray addObject:@"New loan product launched"];
    
    
    
    // pages are created on demand
    // load the visible page
    // load the page on either side to avoid flashes when the user starts scrolling
    //
    //    [self loadScrollViewWithPage:0];
    //    [self loadScrollViewWithPage:1];
    
    
    
    //        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scr attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.2 constant:0]];
    //
    //        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scr attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    //
    //        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scr attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    //
    //        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scr attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.4 constant:0]];
    //------page control
    
    //        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageControl attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.7 constant:0]];
    //
    //        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageControl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    //
    //        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageControl attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.1 constant:0]];
    //
    //        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageControl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0]];
    
    
    
    //--load passwordpolicy
    [self loadData];
    
    
    
}

//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.txtOldPassword) {
        [textField resignFirstResponder];
        return NO;
    }
    
    if (textField == self.txtNewPassword) {
        [textField resignFirstResponder];
        return NO;
    }
    if (textField == self.txtRepeatPassword) {
        [textField resignFirstResponder];
        return NO;
    }
    
    return YES;
}



- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
}

- (void) doValidate {
    
   
        
    //------validation starts---------
    
    NSLog(@"button clicked");
    
    [self.txtOldPassword resignFirstResponder];
    [self.txtNewPassword resignFirstResponder];
    [self.txtRepeatPassword resignFirstResponder];
    
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    
    
    NSString *oldPassword=self.txtOldPassword.text;
    NSString *newPassword=self.txtNewPassword.text;
    NSString *repeatPassword=self.txtRepeatPassword.text;
    
    //self.sessionid=@"";
    
    
    
    //trim spaces
    //userid = [userid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    oldPassword = [CommonUtils removeSpaces:oldPassword];
  
    newPassword=[CommonUtils removeSpaces:newPassword];
    
    repeatPassword=[CommonUtils removeSpaces:repeatPassword];
    
    
    //if ([userid length] <= 0 || userid == nil || [userid  isEqual:@""] == TRUE)
    if([CommonUtils checkEmptyString:oldPassword]==YES)
    {
        
        [CommonUtils showMessage:@"Old password can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    else if([CommonUtils checkEmptyString:newPassword]==YES)
    {
        
        [CommonUtils showMessage:@"New password can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    else if([CommonUtils checkEmptyString:repeatPassword]==YES)
    {
        
        [CommonUtils showMessage:@"Repeat password can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    
    else if([passwordData.policyAvailable boolValue]==NO)  //--Check Password Policy Availability
    {
        [CommonUtils showMessage:@"Password policy not avilable":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        return;
    }
    
    
    else if([oldPassword isEqualToString:newPassword])
    {
        [CommonUtils showMessage:@"Old and New Passwords can't be same":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        return;
    }
    
    else if(![newPassword isEqualToString:repeatPassword])
    {
        [CommonUtils showMessage:@"New and Repeat Passwords are not same":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        return;
    }
    else{
        
        
        
        
        [self buildJSON];
        
        
        
        
    }
    
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
    
    
    
    
    
}
- (void) buildJSON {
    
    
    NSDictionary *jsonDictionary;
    //NSData *newData;
    
    
    //     txtPassword.text=@"password";
    //     deviceToken=@"deviceToken";
    
    //[[NSUserDefaults standardUserDefaults] setObject:self.userid forKey:@"userid"];
    //[[NSUserDefaults standardUserDefaults] setObject:self.deviceToken forKey:@"deviceToken"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    @try{
        
        
        NSString *oldPassword=txtOldPassword.text;
        oldPassword=[CommonUtils removeSpaces:oldPassword];
        
        NSString *newPassword=txtNewPassword.text;
        newPassword=[CommonUtils removeSpaces:newPassword];
        
        
        //--to encrypt password
        NSString *encryptedOldPassword= [self passwordEncrypt:oldPassword];
        NSString *encryptedNewPassword= [self passwordEncrypt:newPassword];
        
        NSString *ipAddress=[CommonUtils getIPAddress];
       
        
        //-------
        jsonDictionary= @{
                          @"userid":[[NSUserDefaults standardUserDefaults] stringForKey:@"userid"],
                          @"password":emptyStringIfNil(encryptedNewPassword),
                          @"oldPassword":emptyStringIfNil(encryptedOldPassword),
                          @"ipAddress":emptyStringIfNil(ipAddress)
                          };
        
        
        
        //newData=[CommonUtils connectHost :@"changePassword" :jsonDictionary :self];
        //[self parseResponsePassword:newData:@"changePassword":@"usersWrapper"];
        
        
        if([userData.invalidOldPassword boolValue]==YES)
        {
            [CommonUtils showMessage:@"Old Password Invalid":self];
        }
        
        if([userData.oldPasswordRepeat boolValue]==YES)
        {
            [CommonUtils showMessage:@"Old Password Can't Be Repeated":self];
        }
        
        if([userData.passwordChanged boolValue]==YES)
        {
           [CommonUtils showMessage:@"Password Successfully Changed":self];
        }
        if([userData.passwordChanged boolValue]==NO)
        {
            [CommonUtils showMessage:@"Password Not Changed":self];
        }
  
        
        
        NSLog(@"To invoke search screen %@",menuId);
        
        
        
      
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in validate user  code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in validate user Code");
    }
    
    
}


//- (BOOL) validateUser  {
//
//
//    @try {
//
//
//
//        NSLog(@"validate user %@",userid);
//
//
//
//
//        //string for the URL request
//        //NSString *myUrlString = @"http://192.168.2.8:8080/FinnoneWeb/AccountsServlet";
//        NSString *myUrlString = [self ReadSingleTonInstanceVariable:@"hostServerURL"];
//        NSLog(@"Host Server URL %@", myUrlString);
//        //create string for parameters that we need to send in the HTTP POST body
//        //        NSString *body =  [NSString stringWithFormat:@"userid=%@&sessionid=%@&deviceToken=%@&methodAction=validateUser",userid,sessionid,deviceToken];
//        NSString *body =  [NSString stringWithFormat:@"userid=%@&deviceToken=%@&methodAction=validateUser",userid,deviceToken];
//
//
//        //create a NSURL object from the string data
//        NSURL *myUrl = [NSURL URLWithString:myUrlString];
//
//        //create a mutable HTTP request
//        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:myUrl];
//        [urlRequest setHTTPShouldHandleCookies:YES];
//
//        NSString *bodyLength = [NSString stringWithFormat:@"%lu", (unsigned long)[body length]];
//        [urlRequest setValue:bodyLength forHTTPHeaderField:@"Content-Length"];
//
//        //sets the receiver’s timeout interval, in seconds
//        [urlRequest setTimeoutInterval:30.0f];
//        //sets the receiver’s HTTP request method
//        [urlRequest setHTTPMethod:@"POST"];
//        //sets the request body of the receiver to the specified data.
//        [urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
//
//
//        //        NSString *post = [NSString stringWithFormat:@"test=Message&this=isNotReal"];
//        //        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//        //        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
//        //        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//        //        [request setHTTPBody:postData];
//
//
//
//        //allocate a new operation queue
//        //NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//        //Loads the data for a URL request and executes a handler block on an
//        //operation queue when the request completes or fails.
//        /*[NSURLConnection
//         sendAsynchronousRequest:urlRequest
//         queue:queue
//         completionHandler:^(NSURLResponse *response,
//         NSData *data,
//         NSError *error) {
//         if ([data length] >0 && error == nil){
//         //process the JSON response
//         //use the main queue so that we can interact with the screen
//         dispatch_async(dispatch_get_main_queue(), ^{
//         [self parseResponse:data];
//         });
//         }
//         else if ([data length] == 0 && error == nil){
//         NSLog(@"Empty Response, not sure why?");
//         }
//         else if (error != nil){
//         NSLog(@"Not again, what is the error = %@", error);
//         }
//         }];*/
//
//
//        NSURLResponse *response = nil;
//        NSError *error = nil;
//        //getting the data
//        NSData *newData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
//
//
//        if ([response respondsToSelector:@selector(allHeaderFields)]) {
//            NSDictionary *dictionary = [(NSHTTPURLResponse*)response allHeaderFields];
//            NSLog(@"Cookie Dictionary: %@", [dictionary description]);
//
//            //            for(NSString *key in [dictionary allKeys]) {
//            //                NSLog(@"Cookie key code: %@",key);
//            //                NSLog(@"Cookie key: %@",[dictionary objectForKey:key]);
//            //
//            //
//            //            }
//
//            NSString *cookie = [dictionary valueForKey:@"Set-Cookie"];
//
//            NSLog(@"Cookie : %@",cookie);
//
//            [[NSUserDefaults standardUserDefaults] setObject:cookie forKey:@"Cookie"];
//
//        }
//
//        if ([newData length] >0 && error == nil){
//            //process the JSON response
//            //use the main queue so that we can interact with the screen
//
//            if([self parseResponse:newData]==YES)
//            {
//                return YES;
//            }
//            else{
//                return NO;
//            }
//
//
//        }
//        else if ([newData length] == 0 && error == nil){
//            NSLog(@"Empty Response, not sure why?");
//            [CommonUtils showMessage:@"No response from host system":self];
//            return NO;
//        }
//        else if (error != nil){
//            NSLog(@"Not again, what is the error = %@", error);
//
//            [CommonUtils showError:error:self:@"validateUser"];
//            return NO;
//
//        }
//
//
//
//
//
//    }
//    @catch (NSException *exception) {
//
//        NSLog(@"Exception in validate user code %@ reason %@ " , [exception name], [exception reason]);
//
//         [CommonUtils showMessage:[exception reason] :self];
//    }
//    @finally {
//
//        NSLog(@"finally in fetch validate user");
//    }
//
//
//}


- (void) parseResponse:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
       // NSLog(@"get validate user %@",userid);
        
        
        
        NSString *myData = [[NSString alloc] initWithData:data
                                                 encoding:NSUTF8StringEncoding];
        NSLog(@"JSON data = %@", myData);
        NSError *error = nil;
        
        //parsing the JSON response
        id jsonObject = [NSJSONSerialization
                         JSONObjectWithData:data
                         options:NSJSONReadingAllowFragments
                         error:&error];
        if (jsonObject != nil && error == nil){
            NSLog(@"Successfully deserialized...");
            
            //check if the customer code was valid
            //userid = [jsonObject objectForKey:@"userid"];
            //sessionid = [jsonObject objectForKey:@"sessionid"];
            
            
            
            NSNumber *success = [jsonObject objectForKey:@"success"];
            if([success boolValue] == YES){
                
                
                
                //set the customer object of the second view controller
                dataDictionary =[jsonObject objectForKey:methodAction];
                
                NSLog(@"Dictionary: %@", [dataDictionary description]);
                
                
                for(NSString *key in [dataDictionary allKeys]) {
                    NSLog(@"key code: %@",key);
                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
                    
                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                    
                }
                
                // Create a new array to hold the locations
                passwordArray = [[NSMutableArray alloc] init];
                
                
                // Get an array of dictionaries with the key "locations"
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    
                    
                    
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    
                    
                    passwordData = [[PasswordData alloc] initWithJSONDictionary:dict];
                    
                    //NSLog(@" users validuser %@",password.validUser);
                    
                    // Add the Location object to the array
                    [passwordArray addObject:passwordData];
                    
                    
                    
                }
                
                
                NSLog(@"data count %lu",(unsigned long)passwordArray.count);
                
                
                
                
                
                
                
            }
            else {
                NSLog(@"Success is invalid...");
                
                [CommonUtils showMessage:@"Invalid userid or password":self];
                
                
            }
            
        }
        else{
            
            [CommonUtils showError:error:self:@"parseResponse"];
            
        }
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponse code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponse Code");
    }
    
}

- (void) parseResponsePassword:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
        // NSLog(@"get validate user %@",userid);
        
        
        
        NSString *myData = [[NSString alloc] initWithData:data
                                                 encoding:NSUTF8StringEncoding];
        NSLog(@"JSON data = %@", myData);
        NSError *error = nil;
        
        //parsing the JSON response
        id jsonObject = [NSJSONSerialization
                         JSONObjectWithData:data
                         options:NSJSONReadingAllowFragments
                         error:&error];
        if (jsonObject != nil && error == nil){
            NSLog(@"Successfully deserialized...");
            
            //check if the customer code was valid
            //userid = [jsonObject objectForKey:@"userid"];
            //sessionid = [jsonObject objectForKey:@"sessionid"];
            
            
            
            NSNumber *success = [jsonObject objectForKey:@"success"];
            if([success boolValue] == YES){
                
                
                
                //set the customer object of the second view controller
                dataDictionary =[jsonObject objectForKey:methodAction];
                
                NSLog(@"Dictionary: %@", [dataDictionary description]);
                
                
                for(NSString *key in [dataDictionary allKeys]) {
                    NSLog(@"key code: %@",key);
                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
                    
                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                    
                }
                
                // Create a new array to hold the locations
                userArray = [[NSMutableArray alloc] init];
                
                
                // Get an array of dictionaries with the key "locations"
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    
                    
                    
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    
                    
                    userData = [[UsersData alloc] initWithJSONDictionary:dict];
                    
                    //NSLog(@" users validuser %@",password.validUser);
                    
                    // Add the Location object to the array
                    [userArray addObject:userData];
                    
                    
                    
                }
                
                
                NSLog(@"data count %lu",(unsigned long)userArray.count);
                
                
                
                
                
                
                
            }
            else {
                NSLog(@"Success is invalid...");
                
                [CommonUtils showMessage:@"Invalid userid or password":self];
                
                
            }
            
        }
        else{
            
            [CommonUtils showError:error:self:@"parseResponse"];
            
        }
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponse code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponse Code");
    }
    
}



-(void) loadData {
    
    NSDictionary *jsonDictionary;
    //NSData * newData;
    
   
   
    
    @try{
       
    
        
        jsonDictionary= @{
                          @"recordStatus":@"passwordpolicy"
                          };
        
        //newData=[CommonUtils connectHost :@"fetchPasswordPolicy" :jsonDictionary :self];
        //[self parseResponse:newData:@"fetchPasswordPolicy":@"passwordWrapper"];
        
        
        
        
        
        NSLog(@"data loaded ");
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in Load Data code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in Load Data Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
    
    
}


-(void)loadView {
    [super loadView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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





//- (void)btnLogin:(id)sender {
//
//    NSLog(@"button clicked");
//
//    [self.txtUserid resignFirstResponder];
//    [self.txtPassword resignFirstResponder];
//
//    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
//
//
//    self.userid=txtUserid.text;
//    self.sessionid=@"";
//
//    //trim spaces
//    //userid = [userid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//
//    userid = [CommonUtils removeSpaces:userid];
//
//    //if ([userid length] <= 0 || userid == nil || [userid  isEqual:@""] == TRUE)
//    if([CommonUtils checkEmptyString:userid]==YES)
//    {
//
//        [CommonUtils showMessage:@"Invalid userid or password":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//
//        return;
//
//    }
//    else{
//
//
//        deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"deviceToken"];
//
//        NSLog(@"Device Token in login %@",deviceToken);
//
//
//        if([self validateUser]==YES)
//        {
//            NSLog(@"validateuser success");
//
//
////            DashboardViewController *dashboardViewController = [[DashboardViewController alloc]initWithNibName:nil bundle:nil];
////            dashboardViewController.userid=self.userid;
////            dashboardViewController.sessionid=self.sessionid;
////            dashboardViewController.lastLoginDate=lastLoginDate;
////            [self.navigationController pushViewController:dashboardViewController animated:YES];
//
//
//            SearchViewController *searchViewController = [[SearchViewController alloc]initWithNibName:nil bundle:nil];
//            searchViewController.userid=self.userid;
//            searchViewController.sessionid=self.sessionid;
//            searchViewController.lastLoginDate=lastLoginDate;
//            [self.navigationController pushViewController:searchViewController animated:YES];
//
//
//            //MainViewController *mainViewController = [[MainViewController alloc]initWithNibName:nil bundle:nil];
//            //mainViewController.lastLoginDate=lastLoginDate;
//            //[self.navigationController pushViewController:mainViewController animated:YES];
//
//
//
//
//
//        }
//        //else{
//
//        //[self showMessage:@"Invalid userid or password"];
//        //[NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//
//        //}
//
//    }
//
//
//    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//
//
//
//
//}


// to deal with self-signed certificates
- (BOOL)connection:(NSURLConnection *)connection
canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    return [protectionSpace.authenticationMethod
            isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection
didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    if ([challenge.protectionSpace.authenticationMethod
         isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
        //        // we only trust our own domain
        //        if ([challenge.protectionSpace.host isEqualToString:@"192.168.2.8"])
        //        {
        //            NSURLCredential *credential =
        //            [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
        //            [challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
        //        }
    }
    
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

-(NSString*)ReadSingleTonInstanceVariable:(NSString*)InstVar
{
    SigletonClass *sObj=[SigletonClass sharedSingletonClass];
    return [sObj valueForKey:InstVar];
}





- (NSString *)passwordEncrypt:(NSString *)decryptedString
{
    NSLog(@"decryptedString : %@",decryptedString);
    
    //    NSData *data = [self dataFromHexString:hexString];
    //    NSLog(@"Encrypted data : %@",data);
    //    NSData *encryptedData =  [NSData dataWithBytes:[data bytes] length:[data length]];
    //     NSLog(@"Encrypted encryptedData : %@",encryptedData);
    //
    //    NSData *decryptedData = [encryptedData AES128Decrypt];
    //    NSLog(@"Encrypted decryptedData : %@",decryptedData);
    //
    //
    //    NSString *decryptedString = [NSString stringWithUTF8String:[decryptedData bytes]];
    //     NSLog(@"Decrypted String : %@",decryptedString);
    
    //NSString *decryptedString = @"saikiran";
    
    //NSString *plainString = @"saikiran";
    NSString *key = @"AbcDefGhILmnoPQr"; // should be provided by a user
    NSLog( @"Original: %@\n", decryptedString );
    NSString *encryptedString = [decryptedString AES128EncryptWithKey:key];
    NSLog( @"Encrypted: %@\n", encryptedString );
    NSString *decryptedString1 = [encryptedString AES128DecryptWithKey:key];
    NSLog( @"Decrypted : %@\n", decryptedString1 );
    
    //    decryptedString = [self addPaddingToString:decryptedString];
    //    NSData *decryptedData = [NSData dataWithBytes:[decryptedString UTF8String] length:[[decryptedString dataUsingEncoding:NSUTF8StringEncoding] length]];
    //    NSData *encryptedData = [decryptedData AES128Encrypt];
    //    NSString *encryptedHexString ;
    //    if (encryptedData!=nil)
    //    {
    //        encryptedHexString = [self hexStringFromData:encryptedData];
    //        NSLog(@"Encrypted HexString : %@",encryptedHexString);
    //
    //        //        NSData *data1 = [self dataFromHexString:encryptedHexString];
    //        //        NSData *encryptedData1 =  [NSData dataWithBytes:[data1 bytes] length:[data1 length]];
    //        //        NSData *decryptedData1 = [encryptedData1 AES128Decrypt];
    //        //        NSString *decryptedString1 = [NSString stringWithUTF8String:[decryptedData1 bytes]];
    //        //        NSLog(@"Decrypted String Testing 123: %@",[decryptedString1 stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" "]]);
    //    }
    //return encryptedHexString;
    
    return encryptedString;
}


// For Converting incoming HexString into NSData
- (NSData *)dataFromHexString:(NSString *)string
{
    //NSMutableData *stringData = [[[NSMutableData alloc] init] autorelease];
    NSMutableData *stringData = [[NSMutableData alloc] init];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < [string length] / 2; i++) {
        byte_chars[0] = [string characterAtIndex:i*2];
        byte_chars[1] = [string characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [stringData appendBytes:&whole_byte length:1];
        NSLog(@"dataFromHexString 2 : %@",stringData);
    }
    return stringData;
    
}


// For converting Encrypted Data into NSString after the encryption
- (NSString*)hexStringFromData:(NSData *)data
{
    unichar* hexChars = (unichar*)malloc(sizeof(unichar) * (data.length*2));
    unsigned char* bytes = (unsigned char*)data.bytes;
    for (NSUInteger i = 0; i < data.length; i++) {
        unichar c = bytes[i] / 16;
        if (c < 10) c += '0';
        else c += 'a' - 10;
        hexChars[i*2] = c;
        c = bytes[i] % 16;
        if (c < 10) c += '0';
        else c += 'a' - 10;
        hexChars[i*2+1] = c;
    }
    NSString* retVal = [[NSString alloc] initWithCharactersNoCopy:hexChars
                                                           length:data.length*2
                                                     freeWhenDone:YES];
    //return [retVal autorelease];
    return retVal;
}
// For padding into a string for required string length
-(NSString *)addPaddingToString:(NSString *)string
{
    NSInteger size = 16;
    NSInteger x = [string length]%size;
    NSInteger padLength = size - x;
    for (int i=0; i<padLength; i++)
    {
        string = [string stringByAppendingString:@" "];
    }
    return string;
}


-(void)startActivityIndicator
{
    //    lblLoading.text = @"Loading...";
    //    activityIndicator.hidden=NO;
    //    [activityIndicator startAnimating];
    
    [CommonUtils startActivityIndicator:self];
    
    
}

-(void)stopActivityIndicator
{
    //    lblLoading.text = @"";
    //    [activityIndicator stopAnimating];
    //    activityIndicator.hidden=YES;
    
    [CommonUtils stopActivityIndicator:self];
    
}
static inline NSString* emptyStringIfNil(NSString *value) {
    return value? value : @"";
}
//- (BOOL)isValidPassword:(NSString*)password
//{
//    NSRegularExpression* regex = [[NSRegularExpression alloc] initWithPattern:@"^.*(?=.{6,})(?=.*[a-z])(?=.*[A-Z]).*$" options:0 error:nil];
//    return [regex numberOfMatchesInString:password options:0 range:NSMakeRange(0, [password length])] > 0;
//}
//
//if(![self isValidPassword:[password stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]]) {
//    UIAlertView *pwAlrt = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Password Must Be Of Six Characters And One Of The Letters Should Be Caps" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
//    [pwAlrt show];
//    [self.btnLogin setEnabled:YES];
//}

@end