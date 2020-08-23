//
//  KYCEDDViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 23/10/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
//#import "KYCTran2ViewController.h"
#import "KycData.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "PopoverViewController.h"
#import "QueueViewController.h"
#import "KYCEDDViewController.h"
#import "QueueViewController.h"





@interface KYCEDDViewController ()



@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

CGFloat lblConstraintKYCEDDX2=0.52f;
CGFloat lblConstraintKYCEDDY2=1.0f;
CGFloat lblConstraintKYCEDDWidth2=0.5f;
CGFloat lblConstraintKYCEDDHeight2=0.8f;

CGFloat ConstraintKYCEDDX2=1.19f;
CGFloat ConstraintKYCEDDY2=1.0f;
CGFloat ConstraintKYCEDDWidth2=0.80f;
CGFloat ConstraintKYCEDDHeight2=0.8f;

CGFloat ConstraintKYCEDD1X2=0.69f;
CGFloat ConstraintKYCEDD1Y2=1.0f;
CGFloat ConstraintKYCEDD1Width2=0.3f;
CGFloat ConstraintKYCEDD1Height2=0.8f;

CGFloat lblConstraintKYCEDD2X2=1.52f;
CGFloat lblConstraintKYCEDD2Y2=1.0f;
CGFloat lblConstraintKYCEDD2Width2=0.5f;
CGFloat lblConstraintKYCEDD2Height2=0.8f;

CGFloat ConstraintKYCEDD2X2=1.69f;
CGFloat ConstraintKYCEDD2Y2=1.0f;
CGFloat ConstraintKYCEDD2Width2=0.3f;
CGFloat ConstraintKYCEDD2Height2=0.8f;




@implementation KYCEDDViewController




@synthesize menuName;
//@synthesize sessionid;
@synthesize actionMode;
@synthesize popoverCodeValue;

@synthesize dataDictionary;



@synthesize popoverData;
@synthesize popoverArray;
@synthesize refNo;

@synthesize kycArray;
@synthesize kycData;

@synthesize dateToolBar;
@synthesize datePicker;



@synthesize webView;
//@synthesize activityIndicator;
//@synthesize lblLoading;

@synthesize timerView;


int hours, minutes, seconds,secondsLeft;


@synthesize txtEDDDetalsBusines;
@synthesize txtEDDHowwasProspts;
@synthesize txtEDDDescrbClntSrc;
@synthesize txtEDDNonresdnt;
@synthesize txtEDDPrdtUsgTrnsPrf;
@synthesize txtEDDDetlsNonresdnt;
@synthesize txtEDDAruAwreAsptsreltd;

@synthesize txtIConfmmCheckBox;
@synthesize txtPreparedBy;
@synthesize txtPreDate;
@synthesize txtReviewdBy;
@synthesize txtRevByDate;
@synthesize txtApprovedBy;
@synthesize txtAppByDate;

@synthesize recordStatus;
@synthesize existingCustomerFlag;
@synthesize existingRefNo;

@synthesize pathArray;
@synthesize pathData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor=[UIColor controllerBGColor];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor whiteColor];
    
    if([actionMode isEqualToString:@"UPDATE"])
    {
        [self.navigationItem setHidesBackButton:NO animated:YES];
    }
    else
    {
        self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        
    }
    
    //[self.navigationItem setHidesBackButton:NO animated:YES];
    
    //    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    //    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryOverlay;
    //    [self.splitViewController.displayModeButtonItem action];
    //
    
//      self.navigationItem.title=[NSString stringWithFormat:@"%@ - %@",self.menuName,@"KYC Enhanced Due Diligence"];
    
    self.navigationItem.title=@"KYC Enhanced Due Diligence";
    [CommonUtils loadActivityIndicator:self];
    
    
    /*UIImageView *wallet =[[UIImageView alloc] initWithFrame:CGRectMake(50,50,80,80)];
     wallet.image=[UIImage imageNamed:@"money-wallet-icon.png"];
     wallet.contentMode=UIViewContentModeCenter;
     wallet.layer.masksToBounds=YES;
     [wallet.layer setBorderColor:[UIColor grayColor].CGColor];
     [wallet.layer setBorderWidth:2.0f];
     [wallet.layer setCornerRadius:15.0f];
     [wallet.layer setShadowColor:[UIColor grayColor].CGColor];
     [self.view addSubview:wallet];*/
    
    //UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,150,20)];
    //    UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,20,40)];
    //    companyLogo.image=[UIImage imageNamed:@"logo_MobileBanker1.png"];
    //    companyLogo.contentMode = UIViewContentModeScaleAspectFit;
    //    companyLogo.clipsToBounds = NO;
    //    companyLogo.layer.masksToBounds=NO;
    //[self.view addSubview:companyLogo];
    
    ////self.navigationItem.titleView=companyLogo;
    
    //self.navigationItem.title=@"Account Summary";
    
    NSString *buttonLabel=@"Save";
    NSString *buttonLabelRej;
    
    
    if([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"])
    {
        buttonLabelRej=@"Reject";
    }
    
    if([self.actionMode isEqualToString:@"ENQUIRY"] || [[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"])
    {
        buttonLabel=@"Next";
        
        
    }
    
    
    UIBarButtonItem* rightNavButton=[[UIBarButtonItem alloc] initWithTitle:buttonLabel style:UIBarButtonItemStylePlain target:self action:@selector(doValidate)];
    
    UIBarButtonItem *rejrightNavButton = [[UIBarButtonItem alloc]initWithTitle:buttonLabelRej style:UIBarButtonItemStylePlain target:self action:@selector(doReject)];
    
    //self.navigationItem.rightBarButtonItem =rightNavButton ;
    
    // create a spacer
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    space.width = 30;
    
    NSArray *buttons = @[rightNavButton, space, rejrightNavButton ];
    
    self.navigationItem.rightBarButtonItems = buttons;
    
    
    //    UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,50,20)];
    //    companyLogo.image=[UIImage imageNamed:@"Mashreq_logo.png"];
    //    //companyLogo.contentMode=UIViewContentModeCenter;
    //    companyLogo.contentMode = UIViewContentModeScaleToFill;
    //    companyLogo.clipsToBounds = NO;
    //    //[self.view addSubview:companyLogo];
    //
    //    //self.navigationItem.titleView=companyLogo;
    
    
    
    //    CALayer *sublayerHeader = [CALayer layer];
    //    sublayerHeader.backgroundColor = [UIColor whiteColor].CGColor;
    //    sublayerHeader.shadowOffset = CGSizeMake(0, 3);
    //    sublayerHeader.shadowRadius = 10.0;
    //    sublayerHeader.shadowColor = [UIColor blackColor].CGColor;
    //    sublayerHeader.shadowOpacity = 0.8;
    //    sublayerHeader.cornerRadius = 30.0;
    //    //sublayerHeader.frame = CGRectMake(30, 80, 270, 100);
    //    sublayerHeader.bounds=headerView.bounds;
    //    [self.view.layer addSublayer:sublayerHeader];
    
    
    
    
    
    
    
    //UIImageView *card =[[UIImageView alloc] initWithFrame:CGRectMake(200,50,50,50)];
    //card.image=[UIImage imageNamed:@"Finance-Card-In-Use-icon.png"];
    //card.contentMode=UIViewContentModeCenter;
    //[self.view addSubview:card];
    
    //[self fetchonBoardData];
    
    
    UIView *screenView = [[UIView alloc] init];
    screenView.layer.borderWidth=1.0;
    screenView.layer.borderColor=[UIColor whiteColor].CGColor;
    screenView.layer.shadowRadius=10.0;
    screenView.backgroundColor = [UIColor whiteColor];
    screenView.layer.shadowOffset = CGSizeMake(0, 3);
    screenView.layer.shadowRadius = 10.0;
    screenView.layer.shadowColor = [UIColor blackColor].CGColor;
    screenView.layer.shadowOpacity = 0.8;
    screenView.layer.cornerRadius = 15.0;
    screenView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:screenView];
    
    //---timer UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.03 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.75 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.83 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.70 constant:0]];
    
    
    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    //tableView.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    //tableView.frame = CGRectMake(30,200,270,300);
    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];////[UIColor lightGrayColor];
    tableView.layer.borderWidth=1.0f;
    tableView.layer.borderColor=[UIColor whiteColor].CGColor;
    tableView.layer.cornerRadius=15.0f;
    //tableView.allowsSelection = NO;
    tableView.alwaysBounceVertical = NO;
    tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
    
    
    tableView.sectionHeaderHeight = 0.0;
    tableView.sectionFooterHeight = 0.0;
    tableView.rowHeight=UITableViewAutomaticDimension;
    
    
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //    CGRect titleRect = CGRectMake(0, 0, 100, 20);
    //    UILabel *tableTitle = [[UILabel alloc] initWithFrame:titleRect];
    //    tableTitle.textColor = [UIColor captionColor];
    //    tableTitle.backgroundColor = [tableView backgroundColor];
    //    tableTitle.opaque = YES;
    //    tableTitle.font = [UIFont boldSystemFontOfSize:14];
    //    tableTitle.textAlignment=NSTextAlignmentCenter;
    //    tableTitle.text = @"onBoardData";
    //    //tableTitle.translatesAutoresizingMaskIntoConstraints=NO;
    //    tableView.tableHeaderView = tableTitle;
    
    //tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    //[tableView setSeparatorColor:[UIColor whiteColor]];
    tableView.separatorInset=UIEdgeInsetsZero;
    //tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    
    // add to canvas
    tableView.translatesAutoresizingMaskIntoConstraints=NO;
    [screenView addSubview:tableView];
    
    
    
    //[self drawRect:titleRect];
    //
    
    // important! without this line it does not work!
    //[tableView setBackgroundView:[[UIView alloc] init]];
    // set plain background color
    //[tableView setBackgroundColor:[UIColor colorWithRed:0.69 green:0.81 blue:0.79 alpha:1.0]];
    // remove seperator color
    
    
    
    //tableView.contentInset = UIEdgeInsetsMake(-1.0f, 0.0f, 0.0f, 0.0);
    
    //    CGRect frame = tableView.tableHeaderView.frame;
    //    frame.size.height = 1;
    //    UIView *headerView = [[UIView alloc] initWithFrame:frame];
    //    [tableView setTableHeaderView:headerView];
    
    
    
    
    //---header UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:screenView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
    
    
    
    
    timerView = [[UILabel alloc] init];
    timerView.layer.borderWidth=1.0;
    timerView.layer.borderColor=[UIColor whiteColor].CGColor;
    timerView.layer.shadowRadius=10.0;
    timerView.backgroundColor = [UIColor whiteColor];
    timerView.layer.shadowOffset = CGSizeMake(0, 3);
    timerView.layer.shadowRadius = 10.0;
    timerView.layer.shadowColor = [UIColor blackColor].CGColor;
    timerView.layer.shadowOpacity = 0.8;
    timerView.layer.cornerRadius = 15.0;
    timerView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:timerView];
    
    //---timer UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.35 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    secondsLeft = 16925;
    [self countdownTimer];
    
    
    UIButton *enameView = [[UIButton alloc] init];
    enameView.layer.borderWidth=1.0;
    enameView.layer.borderColor=[UIColor whiteColor].CGColor;
    enameView.layer.shadowRadius=10.0;
    enameView.backgroundColor = [UIColor whiteColor];
    enameView.layer.shadowOffset = CGSizeMake(0, 3);
    enameView.layer.shadowRadius = 10.0;
    enameView.layer.shadowColor = [UIColor blackColor].CGColor;
    enameView.layer.shadowOpacity = 0.8;
    enameView.layer.cornerRadius = 15.0;
    enameView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:enameView];
    
    //---timer UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    UIButton *dedupView = [[UIButton alloc] init];
    dedupView.layer.borderWidth=1.0;
    dedupView.layer.borderColor=[UIColor whiteColor].CGColor;
    dedupView.layer.shadowRadius=10.0;
    dedupView.backgroundColor = [UIColor whiteColor];
    dedupView.layer.shadowOffset = CGSizeMake(0, 3);
    dedupView.layer.shadowRadius = 10.0;
    dedupView.layer.shadowColor = [UIColor blackColor].CGColor;
    dedupView.layer.shadowOpacity = 0.8;
    dedupView.layer.cornerRadius = 15.0;
    dedupView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:dedupView];
    
    //---timer UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    [self displayGraph];
    
    
    
    
    //---initialize during load
    popoverCodeValue = [[NSMutableDictionary alloc]init];
    
    
    
    //--when not new
    if([actionMode isEqualToString:@"UPDATE"] ||[actionMode isEqualToString:@"ENQUIRY"] || ([actionMode isEqualToString:@"NEW"] && [existingCustomerFlag isEqualToString:@"Y"] && [[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]))// && [viewMode isEqualToString:@"Y"])
    {
        
        [self viewData];
        
        //viewMode=@"N";
        
        
    }
    
    
    
    //[self displayHeader];
    
    
    
    
    
    //self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", accountName.count];
    
    
    
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    
    
    [textField resignFirstResponder];
    
    if(textField.tag==7)
    {
        return NO;
    }
    else
        
        return YES;
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    
    
    
    // Prevent crashing undo bug – see note below.
    if(range.length + range.location > textField.text.length)
    {
        return NO;
    }
    
    if (textField.tag == 0) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 50;
        
    }
    if (textField.tag == 1) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    if (textField.tag == 2) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    if (textField.tag == 3) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    if (textField.tag == 4) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    } if (textField.tag == 5) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    if (textField.tag == 6) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    if (textField.tag == 7) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    if (textField.tag == 8) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    if (textField.tag == 10) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    if (textField.tag == 12) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    
    //    if (textField == self.self.txtSalary) {
    //
    //        NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];
    //
    //        // allow backspace
    //        if (range.length > 0 && [string length] == 0) {
    //            return YES;
    //        }
    //        // do not allow . at the beggining
    //        if (range.location == 0 && [string isEqualToString:@"."]) {
    //            return NO;
    //        }
    //        // set the text field value manually
    //        NSString *newValue = [[textField text] stringByReplacingCharactersInRange:range withString:string];
    //        newValue = [[newValue componentsSeparatedByCharactersInSet:nonNumberSet] componentsJoinedByString:@""];
    //        textField.text = newValue;
    //        // return NO because we're manually setting the value
    //        return NO;
    //    }
    //    return YES;
    
    return YES;
    
}


-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"] || [actionMode isEqualToString:@"ENQUIRY"])
    {
        return NO;
    }
    
    if (textField.tag ==9)
    {
        [self popoverDate:textField:@"LT":NULL];
        return NO;
        
    }
    else if (textField.tag ==11)
    {
        [self popoverDate:textField:@"LT":NULL];
        return NO;
        
    }
    else if (textField.tag ==13)
    {
        [self popoverDate:textField:@"LT":NULL];
        return NO;
        
    }

    
    return YES;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
    
    
}




-(void) popoverDate: (UITextField *)sender :(NSString *)dateRange :(NSString *)dateFormat
{
    [self popoverData:sender :NULL:@"Y":dateRange:dateFormat];
}

-(void) popoverData: (UITextField *)sender :(NSString *)tableName
{
    [self popoverData:sender :tableName:@"N":NULL:NULL];
}

-(void) popoverData: (UITextField *)sender :(NSString *)tableName :(NSString *)dateField :(NSString *)dateRange :(NSString *)dateFormat
{
    @try
    {
        
        NSLog(@"dateField %@",dateField);
        
        PopoverViewController *popoverViewController = [[PopoverViewController alloc]initWithNibName:nil bundle:nil];
        //popoverViewController.actionCode=actionCode;
        popoverViewController.tableName=tableName;
        popoverViewController.fieldTag=(int)sender.tag;
        popoverViewController.dateField=dateField;
        popoverViewController.dateRange=dateRange;
        popoverViewController.dateFormat=dateFormat;
        popoverViewController.delegate=self;
        
        //        UIPopoverController *popoverController =[[UIPopoverController alloc] initWithContentViewController:popoverViewController];
        //        [popoverController setPopoverContentSize:CGSizeMake(self.view.frame.size.width/4, self.view.frame.size.height/4)];
        
        
        // Present the view controller using the popover style.
        popoverViewController.modalPresentationStyle = UIModalPresentationPopover;
        [self presentViewController:popoverViewController animated: YES completion: nil];
        
        // Get the popover presentation controller and configure it.
        UIPopoverPresentationController *presentationController =[popoverViewController popoverPresentationController];
        presentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
        presentationController.sourceView = self.view;
        NSLog(@"x %f and y %f %@",sender.frame.origin.x,sender.frame.origin.y,sender.class);
        presentationController.sourceRect =  CGRectMake(0, sender.frame.origin.y, 1, 1);
        
        
        
        
        //        if(popoverController.popoverVisible==NO){
        //
        //            //NSLog(@" test %lf",sender.frame.origin.x);
        //            //NSLog(@" test %lf",sender.frame.origin.y);
        //
        //            [popoverController presentPopoverFromRect:CGRectMake(0, sender.frame.origin.y, 1, 1)    inView:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        //        }
        //        else{
        //            [popoverController dismissPopoverAnimated:YES];
        //        }
        //
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in popoverData code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in popoverData  Code");
    }
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    
    [self animateTextField: textField up: NO];
    
    
    
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = textField.frame.origin.y / 2;//80; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 11;//[componentsArray count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    return 50;
//
//}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    
    
    if (section == 0) {


        return @" Enhanced Due Diligence (EDD)";
    }


    if (section == 7) {


        return @" KYC Details Confirmation";
    }

    
    else
        
        return nil;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    if(section ==0)
//    {
//        return 0.00f;
//    }
//    return 10.0f;
//}

-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    return nil;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*if ((indexPath.row % 2) == 1) {
     cell.backgroundColor = [UIColor grayColor];
     //cell.textLabel.backgroundColor = [UIColor blackColor];
     cell.selectionStyle = UITableViewCellSelectionStyleGray;
     }
     else
     {
     cell.backgroundColor = [UIColor whiteColor];
     
     }*/
    
    cell.backgroundColor=[UIColor whiteColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];//[UIColor lightGrayColor];
    //cell.layer.borderWidth=0.5f;
    //cell.layer.cornerRadius=15.0f;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    //cell.layer.borderColor=[UIColor borderColor].CGColor;
    //cell.layer.shadowRadius=3.0f;
    //cell.layer.shadowOffset = CGSizeMake(0, 3);
    //cell.layer.shadowColor = [UIColor blackColor].CGColor;
    //cell.layer.shadowOpacity = 0.8;
    
    
    //NSString *selectedFriend =[NSString initWithFormat @"%@", [[friends objectAtIndex: storyIndex] objectForKey: @"firstname"]];
    
    UIFont *myFont = [UIFont boldSystemFontOfSize:14.0f];//[ UIFont fontWithName: @"Arial-BoldMT" size: 14.0 ];
    cell.textLabel.font  = myFont;
    //cell.textLabel.textColor=[UIColor blueColor];
    UIFont *mySecondFont = [UIFont boldSystemFontOfSize:10.0f]; //[ UIFont fontWithName: @"Arial-BoldMT" size: 12.0 ];
    cell.detailTextLabel.font  = mySecondFont;
    //cell.detailTextLabel.textColor=[UIColor blueColor];
    
    
    //top shadow
    //UIView *topShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 10)];
    //CAGradientLayer *topShadow = [CAGradientLayer layer];
    //topShadow.frame = CGRectMake(0, 0, tableView.bounds.size.width, 10);
    //topShadow.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithWhite:0.0 alpha:0.25f] CGColor], (id)[[UIColor clearColor] CGColor], nil];
    //[topShadowView.layer insertSublayer:topShadow atIndex:0];
    
    //[cell.contentView addSubview:topShadowView];
    
    
    
    //UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(3,2, 20, 25)];
    //imv.image=[UIImage imageNamed:@"money-wallet-icon.png"];
    //    cell.imageView.image=[[UIImage imageNamed:@"account-sum-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    //    CAGradientLayer *gradient = [CAGradientLayer layer];
    //    gradient.frame = cell.bounds;
    //    gradient.layer.cornerRadius=10.0f;
    //    gradient.color=[UIColor whiteColor];
    //    //gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor whiteColor]CGColor], (id)[[UIColor redColor]CGColor], nil];
    //    [cell.layer addSublayer:gradient];
    
    
    //[cell addSubview:imv];
    
    
    //NSLog(@"table view%ldd",(long) indexPath.row);//[custKeyData objectAtIndex:indexPath.row]);
    //NSLog(@"table view%ldd",(long) indexPath.section);
    
    
    //    cell.textLabel.text =[NSString stringWithFormat:@"%@",[self.accountName objectAtIndex:indexPath.row]];
    //    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@         %@   %@",[self.accountNumber objectAtIndex:indexPath.row],[self.accountCurrency objectAtIndex:indexPath.row],[self.accountCurrentBalance objectAtIndex:indexPath.row]];
    
    //onBoardData = [onBoardArray objectAtIndex:indexPath.row];
    //onBoardData = [onBoardArray objectAtIndex:indexPath.section];
    
    //popoverData = [popoverArray objectAtIndex:indexPath.section];
    
    
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];//]WithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        cell.accessoryType = UITableViewCellAccessoryNone;
        //cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
           if(indexPath.section==0){
    
                CommonLabel *lblEDDDetalsBusines   =[[CommonLabel alloc]initWithFrame:CGRectZero];
                lblEDDDetalsBusines.text=@" Details of Line of Business Activity/Employement";
                lblEDDDetalsBusines.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:lblEDDDetalsBusines];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDDetalsBusines attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKYCEDDX2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDDetalsBusines attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKYCEDDY2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDDetalsBusines attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKYCEDDWidth2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDDetalsBusines attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKYCEDDHeight2 constant:0]];
    
    
                txtEDDDetalsBusines = [[CommonTextField alloc] init];
                txtEDDDetalsBusines.tag=1;
                txtEDDDetalsBusines.delegate=self;
                txtEDDDetalsBusines.placeholder=@" Details Of Activity/Employement";
                txtEDDDetalsBusines.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:txtEDDDetalsBusines];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDDetalsBusines attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:ConstraintKYCEDD2X2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDDetalsBusines attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:ConstraintKYCEDD2Y2 constant:0]];
    
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDDetalsBusines attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:ConstraintKYCEDD2Width2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDDetalsBusines attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:ConstraintKYCEDD2Height2 constant:0]];
    
    
            }
    
    
            else if(indexPath.section==1){
    
                CommonLabel *lblEDDHowwasProspts   =[[CommonLabel alloc]initWithFrame:CGRectZero];
                lblEDDHowwasProspts.text=@" How Was The Prospect Introduced?";
                lblEDDHowwasProspts.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:lblEDDHowwasProspts];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDHowwasProspts attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKYCEDDX2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDHowwasProspts attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKYCEDDY2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDHowwasProspts attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKYCEDDWidth2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDHowwasProspts attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKYCEDDHeight2 constant:0]];
    
    
                txtEDDHowwasProspts = [[CommonTextField alloc] init];
                txtEDDHowwasProspts.tag=2;
                txtEDDHowwasProspts.delegate=self;
                txtEDDHowwasProspts.placeholder=@" How Was The Prospect Introduced?";
                txtEDDHowwasProspts.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:txtEDDHowwasProspts];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDHowwasProspts attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:ConstraintKYCEDD2X2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDHowwasProspts attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:ConstraintKYCEDD2Y2 constant:0]];
    
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDHowwasProspts attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:ConstraintKYCEDD2Width2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDHowwasProspts attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:ConstraintKYCEDD2Height2 constant:0]];
    
    
            }
    
            else if(indexPath.section==2){
    
                CommonLabel *lblEDDDescrbClntSrc   =[[CommonLabel alloc]initWithFrame:CGRectZero];
                lblEDDDescrbClntSrc.text=@"Describe the client's Source of Wealth and Background";
                                lblEDDDescrbClntSrc.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:lblEDDDescrbClntSrc];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDDescrbClntSrc attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKYCEDDX2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDDescrbClntSrc attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKYCEDDY2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDDescrbClntSrc attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKYCEDDWidth2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDDescrbClntSrc attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKYCEDDHeight2 constant:0]];
    
    
                txtEDDDescrbClntSrc = [[CommonTextField alloc] init];
                txtEDDDescrbClntSrc.tag=3;
                txtEDDDescrbClntSrc.delegate=self;
                txtEDDDescrbClntSrc.placeholder=@" Describe the client's Source of Wealth and Background";
                txtEDDDescrbClntSrc.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:txtEDDDescrbClntSrc];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDDescrbClntSrc attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:ConstraintKYCEDD2X2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDDescrbClntSrc attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:ConstraintKYCEDD2Y2 constant:0]];
    
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDDescrbClntSrc attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:ConstraintKYCEDD2Width2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDDescrbClntSrc attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:ConstraintKYCEDD2Height2 constant:0]];
    
    
            }
    
    
            else if(indexPath.section==3){
    
                CommonLabel *lblEDDPrdtUsgTrnsPrf   =[[CommonLabel alloc]initWithFrame:CGRectZero];
                lblEDDPrdtUsgTrnsPrf.text=@" Product Usage/Transaction Profile";
//                
//                lblEDDPrdtUsgTrnsPrf.text=@" Product Usage/Transaction Profile: To best Of Your Knowlage, Are You Satisfied With Clients Intended Usage Of Financial Products And Whwthwr This Is Consistent With Clint's Profile?";
                lblEDDPrdtUsgTrnsPrf.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:lblEDDPrdtUsgTrnsPrf];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDPrdtUsgTrnsPrf attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKYCEDDX2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDPrdtUsgTrnsPrf attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKYCEDDY2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDPrdtUsgTrnsPrf attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKYCEDDWidth2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDPrdtUsgTrnsPrf attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKYCEDDHeight2 constant:0]];
    
    
                txtEDDPrdtUsgTrnsPrf = [[CommonTextField alloc] init];
                txtEDDPrdtUsgTrnsPrf.tag=4;
                txtEDDPrdtUsgTrnsPrf.delegate=self;
                txtEDDPrdtUsgTrnsPrf.placeholder=@" Product Usage/Transaction Profile";
                
//                txtEDDPrdtUsgTrnsPrf.placeholder=@" Product Usage/Transaction Profile: To best Of Your Knowlage, Are You Satisfied With Clients Intended Usage Of Financial Products And Whwthwr This Is Consistent With Clint's Profile?";
                txtEDDPrdtUsgTrnsPrf.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:txtEDDPrdtUsgTrnsPrf];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDPrdtUsgTrnsPrf attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:ConstraintKYCEDD2X2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDPrdtUsgTrnsPrf attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:ConstraintKYCEDD2Y2 constant:0]];
    
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDPrdtUsgTrnsPrf attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:ConstraintKYCEDD2Width2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDPrdtUsgTrnsPrf attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:ConstraintKYCEDD2Height2 constant:0]];
    
    
            }
    
            else if(indexPath.section==4){
    
                CommonLabel *lblEDDNonresdnt   =[[CommonLabel alloc]initWithFrame:CGRectZero];
                lblEDDNonresdnt.text=@" Non Resident Customer";
                lblEDDNonresdnt.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:lblEDDNonresdnt];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDNonresdnt attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKYCEDDX2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDNonresdnt attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKYCEDDY2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDNonresdnt attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKYCEDDWidth2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDNonresdnt attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKYCEDDHeight2 constant:0]];
    
    
                txtEDDNonresdnt = [[CommonTextField alloc] init];
                txtEDDNonresdnt.tag=5;
                txtEDDNonresdnt.delegate=self;
                txtEDDNonresdnt.placeholder=@" Non Resident Customer";
                txtEDDNonresdnt.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:txtEDDNonresdnt];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDNonresdnt attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:ConstraintKYCEDD2X2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDNonresdnt attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:ConstraintKYCEDD2Y2 constant:0]];
    
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDNonresdnt attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:ConstraintKYCEDD2Width2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDNonresdnt attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:ConstraintKYCEDD2Height2 constant:0]];
    
    
            }
    
            else if(indexPath.section==5){
    
                CommonLabel *lblEDDOpenAccount   =[[CommonLabel alloc]initWithFrame:CGRectZero];
                lblEDDOpenAccount.text=@" Details For Opening The Account (If Non Resident)";
                lblEDDOpenAccount.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:lblEDDOpenAccount];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDOpenAccount attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKYCEDDX2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDOpenAccount attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKYCEDDY2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDOpenAccount attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKYCEDDWidth2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDOpenAccount attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKYCEDDHeight2 constant:0]];
    
    
                txtEDDDetlsNonresdnt = [[CommonTextField alloc] init];
                txtEDDDetlsNonresdnt.tag=6;
                txtEDDDetlsNonresdnt.delegate=self;
                txtEDDDetlsNonresdnt.placeholder=@" Details For Opening The Account";
                txtEDDDetlsNonresdnt.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:txtEDDDetlsNonresdnt];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDDetlsNonresdnt attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:ConstraintKYCEDD2X2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDDetlsNonresdnt attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:ConstraintKYCEDD2Y2 constant:0]];
    
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDDetlsNonresdnt attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:ConstraintKYCEDD2Width2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDDetlsNonresdnt attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:ConstraintKYCEDD2Height2 constant:0]];
    
    
            }
    
    
            else if(indexPath.section==6){
    
                CommonLabel *lblEDDAruAwreAsptsreltd   =[[CommonLabel alloc]initWithFrame:CGRectZero];
                lblEDDAruAwreAsptsreltd.text=@" Are You Aware Of Any Aspect Related To Customer Or Its Related Parties, That Could Makes The Customer Risk Profile Unacceptable For The Bank In Terms Of Reputation/AML";
                lblEDDAruAwreAsptsreltd.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:lblEDDAruAwreAsptsreltd];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDAruAwreAsptsreltd attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKYCEDDX2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDAruAwreAsptsreltd attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKYCEDDY2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDAruAwreAsptsreltd attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKYCEDDWidth2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEDDAruAwreAsptsreltd attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKYCEDDHeight2 constant:0]];
    
    
                txtEDDAruAwreAsptsreltd = [[CommonTextField alloc] init];
                txtEDDAruAwreAsptsreltd.tag=7;
                txtEDDAruAwreAsptsreltd.delegate=self;
                txtEDDAruAwreAsptsreltd.placeholder=@" Are You Aware Of Any Aspect Related To Customer Or Its Related Parties, That Could Makes The Customer Risk Profile Unacceptable For The Bank In Terms Of Reputation/AML";
                txtEDDAruAwreAsptsreltd.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:txtEDDAruAwreAsptsreltd];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDAruAwreAsptsreltd attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:ConstraintKYCEDD2X2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDAruAwreAsptsreltd attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:ConstraintKYCEDD2Y2 constant:0]];
    
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDAruAwreAsptsreltd attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:ConstraintKYCEDD2Width2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEDDAruAwreAsptsreltd attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:ConstraintKYCEDD2Height2 constant:0]];
    
    
            }

    
            else if(indexPath.section==7){
                //
                //        txtIConfmmCheckBox = [[CommonTextField alloc] init];
                //        txtIConfmmCheckBox.tag=62;
                //        txtIConfmmCheckBox.delegate=self;
                //        txtIConfmmCheckBox.placeholder=@" ";
                //        txtEDDAruAwreAsptsreltd.translatesAutoresizingMaskIntoConstraints=NO;
                //        [cell.contentView addSubview:txtIConfmmCheckBox];
                //
                //
                //       [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtIConfmmCheckBox attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKYCEDDX2 constant:0]];
                //
                //       [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtIConfmmCheckBox attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKYCEDDY2 constant:0]];
                //
                //       [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtIConfmmCheckBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKYCEDDWidth2 constant:0]];
                //
                //       [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtIConfmmCheckBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKYCEDDHeight2 constant:0]];
    
    
    
    
                CommonLabel *lblIConfmmCheckBox   =[[CommonLabel alloc]initWithFrame:CGRectZero];
                lblIConfmmCheckBox.text=@" I Confim that, based on information provided by the customer & after reasonable inquiry nothing has come tomy attenction which causes me to believe that the aforesaid profile is incomplete/inaccurate/outdated or indicates that client is not reputable or its income is derived from illegal/questionable sources. I further confirm that the requirements of Bank's AML/KYC policy and procedures have been met.";
                lblIConfmmCheckBox.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:lblIConfmmCheckBox];
    
    
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblIConfmmCheckBox attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:ConstraintKYCEDD1X2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblIConfmmCheckBox attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:ConstraintKYCEDD1Y2 constant:0]];
    
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblIConfmmCheckBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:ConstraintKYCEDD1Width2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblIConfmmCheckBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:ConstraintKYCEDD1Height2 constant:0]];
    
    
    
    
            }
    
    
    
            if(indexPath.section==8)
            {
    
                CommonLabel *lblPreparedBy =[[CommonLabel alloc]initWithFrame:CGRectZero];
                lblPreparedBy.text=@" Prepared By";
                lblPreparedBy.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:lblPreparedBy];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPreparedBy attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKYCEDDX2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPreparedBy attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKYCEDDY2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPreparedBy attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKYCEDDWidth2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPreparedBy attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKYCEDDHeight2 constant:0]];
    
    
                txtPreparedBy=[[CommonTextField alloc] initWithFrame:CGRectZero];
                txtPreparedBy.tag=8;
                txtPreparedBy.delegate=self;
                txtPreparedBy.placeholder=@" Prepared By";
                txtPreparedBy.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:txtPreparedBy];
    
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPreparedBy attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:ConstraintKYCEDD1X2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPreparedBy attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:ConstraintKYCEDD1Y2 constant:0]];
    
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPreparedBy attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:ConstraintKYCEDD1Width2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPreparedBy attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:ConstraintKYCEDD1Height2 constant:0]];
    
    
                CommonLabel *lblPreDate =[[CommonLabel alloc]initWithFrame:CGRectZero];
                lblPreDate.text=@" Prepared Date";
                lblPreDate.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:lblPreDate];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPreDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKYCEDD2X2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPreDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKYCEDD2Y2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPreDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKYCEDD2Width2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPreDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKYCEDD2Height2 constant:0]];
    
    
                txtPreDate = [[CommonTextField alloc] init];
                txtPreDate.tag=9;
                txtPreDate.delegate=self;
                txtPreDate.placeholder=@"Date";
                txtPreDate.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:txtPreDate];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPreDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:ConstraintKYCEDD2X2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPreDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:ConstraintKYCEDD2Y2 constant:0]];
    
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPreDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:ConstraintKYCEDD2Width2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPreDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:ConstraintKYCEDD2Height2 constant:0]];
    
    
    
    
            }
    
    
            if(indexPath.section==9)
            {
    
                CommonLabel *lblReviewdBy =[[CommonLabel alloc]initWithFrame:CGRectZero];
                lblReviewdBy.text=@" Reviewed By";
                lblReviewdBy.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:lblReviewdBy];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblReviewdBy attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKYCEDDX2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblReviewdBy attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKYCEDDY2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblReviewdBy attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKYCEDDWidth2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblReviewdBy attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKYCEDDHeight2 constant:0]];
    
    
                txtReviewdBy=[[CommonTextField alloc] initWithFrame:CGRectZero];
                txtReviewdBy.tag=10;
                txtReviewdBy.delegate=self;
                txtReviewdBy.placeholder=@" Reviewed By";
                txtReviewdBy.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:txtReviewdBy];
    
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtReviewdBy attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:ConstraintKYCEDD1X2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtReviewdBy attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:ConstraintKYCEDD1Y2 constant:0]];
    
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtReviewdBy attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:ConstraintKYCEDD1Width2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtReviewdBy attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:ConstraintKYCEDD1Height2 constant:0]];
    
    
                CommonLabel *lblRevByDate =[[CommonLabel alloc]initWithFrame:CGRectZero];
                lblRevByDate.text=@" Reviewed Date";
                lblRevByDate.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:lblRevByDate];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRevByDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKYCEDD2X2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRevByDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKYCEDD2Y2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRevByDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKYCEDD2Width2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRevByDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKYCEDD2Height2 constant:0]];
    
    
                txtRevByDate = [[CommonTextField alloc] init];
                txtRevByDate.tag=11;
                txtRevByDate.delegate=self;
                txtRevByDate.placeholder=@"Date";
                txtRevByDate.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:txtRevByDate];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRevByDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:ConstraintKYCEDD2X2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRevByDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:ConstraintKYCEDD2Y2 constant:0]];
    
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRevByDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:ConstraintKYCEDD2Width2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRevByDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:ConstraintKYCEDD2Height2 constant:0]];
    
    
    
    
            }
    
    
    
            if(indexPath.section==10)
            {
    
                CommonLabel *lblApprovedBy =[[CommonLabel alloc]initWithFrame:CGRectZero];
                lblApprovedBy.text=@" Approved By";
                lblApprovedBy.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:lblApprovedBy];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblApprovedBy attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKYCEDDX2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblApprovedBy attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKYCEDDY2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblApprovedBy attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKYCEDDWidth2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblApprovedBy attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKYCEDDHeight2 constant:0]];
    
    
                txtApprovedBy=[[CommonTextField alloc] initWithFrame:CGRectZero];
                txtApprovedBy.tag=12;
                txtApprovedBy.delegate=self;
                txtApprovedBy.placeholder=@" Approved By";
                txtApprovedBy.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:txtApprovedBy];
    
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtApprovedBy attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:ConstraintKYCEDD1X2 constant:0]];
    
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtApprovedBy attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:ConstraintKYCEDD1Y2 constant:0]];
                
                
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtApprovedBy attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:ConstraintKYCEDD1Width2 constant:0]];
                
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtApprovedBy attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:ConstraintKYCEDD1Height2 constant:0]];
                
                
                CommonLabel *lblAppByDate =[[CommonLabel alloc]initWithFrame:CGRectZero];
                lblAppByDate.text=@" Approved Date";
                lblAppByDate.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:lblAppByDate];
                
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAppByDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKYCEDD2X2 constant:0]];
                
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAppByDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKYCEDD2Y2 constant:0]];
                
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAppByDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKYCEDD2Width2 constant:0]];
                
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAppByDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKYCEDD2Height2 constant:0]];
                
                
                txtAppByDate = [[CommonTextField alloc] init];
                txtAppByDate.tag=13;
                txtAppByDate.delegate=self;
                txtAppByDate.placeholder=@"Date";
                txtAppByDate.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:txtAppByDate];
                
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAppByDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:ConstraintKYCEDD2X2 constant:0]];
                
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAppByDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:ConstraintKYCEDD2Y2 constant:0]];
                
                
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAppByDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:ConstraintKYCEDD2Width2 constant:0]];
                
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAppByDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:ConstraintKYCEDD2Height2 constant:0]];
                
                
                
                
            }
        

        
        
        
    }
    else{
        
        
        
        [cell.contentView viewWithTag:100+indexPath.section];
        [cell.contentView viewWithTag:indexPath.section];
        
        [cell.contentView viewWithTag:500+indexPath.section];
        [cell.contentView viewWithTag:600+indexPath.section];
        
    }
    
    
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    if(([actionMode isEqualToString:@"UPDATE"] || [actionMode isEqualToString:@"ENQUIRY"]) && [kycArray count]>0)
    {
        [self loadData];
    }
    
    
    
    return cell;
}


// Implement something like this in your UITableViewController subclass
// or in the delegate object you use to manage your table.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    // Create a view controller with the title as its
    //    // navigation title and push it.
    //    NSUInteger row = indexPath.row;
    //    if (row != NSNotFound)
    //    {
    //        // Create the view controller and initialize it with the
    //        // next level of data.
    //        MyViewController *viewController = [[MyViewController alloc]
    //                                            initWithTable:tableView andDataAtIndexPath:indexPath];
    //        [[self navigationController] pushViewController:viewController
    //                                               animated:YES];
    //    }
    
//    NSUInteger row = indexPath.section;//row;
//    
//    
//    
//    if (row != NSNotFound)
//    {
//        //onBoardData = [onBoardArray objectAtIndex:indexPath.section];
//        //popoverData =[popoverArray objectAtIndex:indexPath.section];
//        
//        kycData = [kycArray objectAtIndex:0];
//        
//        // NSLog(@"selected account %@",onBoardData.accountNumber);
//        
//        if([actionMode isEqualToString:@"TRNHISTORY"])
//        {
//            
//            
//            //            AccountTrnViewController *accountTrnViewController = [[AccountTrnViewController alloc]initWithNibName:nil bundle:nil];
//            //
//            //            //NSLog(@"selected account %@",[self.onBoardDataValueData objectAtIndex:indexPath.row]);
//            //
//            //            accountTrnViewController.cifNumber=onBoardData.cifNumber;
//            //            accountTrnViewController.accountNumber=onBoardData.accountNumber;
//            //            accountTrnViewController.sessionid=self.sessionid;
//            //            accountTrnViewController.userid=self.userid;
//            //
//            //            [self.navigationController pushViewController:accountTrnViewController animated:YES];
//            
//        }
//        
//        
//        
//    }
//    
//    
    
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
    
}

- (void) doValidate {
    
    
    
    //------validation starts---------
    
        if([actionMode isEqualToString:@"ENQUIRY"])
        {
            QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
            queueViewController.actionMode=@"ENQUIRY";
            queueViewController.menuId=@"QUEUEMAKER";
            queueViewController.recordStatus=@"INPROGRESS";
            [self.navigationController pushViewController:queueViewController animated:YES];
            return;
        
        }
    
        if([CommonUtils checkEmptyString:txtEDDDetalsBusines.text]==YES)
        {
            [CommonUtils showMessage:@"Details Of Line Of Business Activity/Employement..... can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
    
        if([CommonUtils checkEmptyString:txtEDDHowwasProspts.text]==YES)
        {
            [CommonUtils showMessage:@"How Was The Prospect Introduced? can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtEDDDescrbClntSrc.text]==YES)
        {
            [CommonUtils showMessage:@"Describe The Client Source can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        
    
        if([CommonUtils checkEmptyString:txtEDDPrdtUsgTrnsPrf.text]==YES)
        {
            [CommonUtils showMessage:@"Product Usage/Transaction Profile..... can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
    
        if([CommonUtils checkEmptyString:txtEDDNonresdnt.text]==YES)
        {
            [CommonUtils showMessage:@"Non Resident Customer can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtEDDDetlsNonresdnt.text]==YES)
        {
            [CommonUtils showMessage:@"Details for Opening can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
    
        if([CommonUtils checkEmptyString:txtEDDAruAwreAsptsreltd.text]==YES)
        {
            [CommonUtils showMessage:@"Are You Aware Of Any Aspect Related..... can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
    
    
        if([CommonUtils checkEmptyString:txtPreparedBy.text]==YES)
        {
            [CommonUtils showMessage:@"Prepared By can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
    
    
        if([CommonUtils checkEmptyString:txtPreDate.text]==YES)
        {
            [CommonUtils showMessage:@"Prepared Date can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
    
        if([CommonUtils checkEmptyString:txtReviewdBy.text]==YES)
        {
            [CommonUtils showMessage:@"Reviewed By can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
    
        if([CommonUtils checkEmptyString:txtRevByDate.text]==YES)
        {
            [CommonUtils showMessage:@"Reviewed Date can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
    
        if([CommonUtils checkEmptyString:txtApprovedBy.text]==YES)
        {
            [CommonUtils showMessage:@"Approved By can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
            
        }
        
        
        if([CommonUtils checkEmptyString:txtAppByDate.text]==YES)
        {
            [CommonUtils showMessage:@"Approved Date can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
    
    //actionMode=@"INSERT";
    
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    [self buildJSON];
    
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
}

- (void) buildJSON {
    
    
    NSDictionary *jsonDictionary;
    NSData *newData;
    recordStatus=@"INPROGRESS";
    
    //actionMode=@"UPDATE";
    //refNo=@"SA21OCT2015156";
    
    
    NSLog(@"action mode in KYC EDD %@",actionMode);
    
    
    @try{
        
        
        //            if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
        //            {
        //                jsonDictionary= @{@"refNo":self.refNo};
        //            }
        //            else
        //            {
        
        
        NSLog(@"RefNo %@",self.refNo);
        
        
        
//        //-------
        
        jsonDictionary= @{
                          @"refNo":emptyStringIfNil(self.refNo),
                          @"eddDetailsLnsBusiness":emptyStringIfNil(self.txtEDDDetalsBusines.text),
                          @"eddHowProspectIntroduced":emptyStringIfNil(self.txtEDDHowwasProspts.text),
                          @"eddDescClientsSourceWealth":emptyStringIfNil(self.txtEDDDescrbClntSrc.text),
                          @"eddProdUsgTransProfile":emptyStringIfNil(self.txtEDDPrdtUsgTrnsPrf.text),
                          @"eddNonResident":emptyStringIfNil(self.txtEDDNonresdnt.text),
                          @"eddDetailsOpenAcc":emptyStringIfNil(self.txtEDDDetlsNonresdnt.text),
                          @"eddAreYouAwereOfAnyAspect":emptyStringIfNil(self.txtEDDAruAwreAsptsreltd.text),
                          @"iConfirmCheckbox":emptyStringIfNil(self.txtIConfmmCheckBox.text),
                          @"preparedBy":emptyStringIfNil(self.txtPreparedBy.text),
                          @"preparedDate":emptyStringIfNil(self.txtPreDate.text),
                          @"reviewedBy":emptyStringIfNil(self.txtReviewdBy.text),
                          @"reviewedDate":emptyStringIfNil(self.txtRevByDate.text),
                          @"approvedBy":emptyStringIfNil(self.txtApprovedBy.text),
                          @"approvedDate":emptyStringIfNil(self.txtAppByDate.text),
                          @"recordStatus":emptyStringIfNil(self.recordStatus)
                          };
        
        
        
        
        
        
        //}
        
        
        //        for (int i=0; i<=[componentsArray count]-1; i++) {
        //
        //            if([[componentsArray objectAtIndex:i] isKindOfClass:[UITextField class]])
        //            {
        //
        //                [jsonDictionary initWithObjects:<#(NSArray *)#> forKeys:<#(NSArray *)#>
        //
        //
        //            }
        //        }
        
        
        
        
        //NSString *jsonString = [container JSONRepresentation];
        NSLog(@"jsonDictionary: %@", [jsonDictionary description]);
        
        //            if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
        //            {
        //
        //                newData=[CommonUtils connectHost :@"fetchPersonalDetails" :jsonDictionary:self];
        //                [self parseResponse:newData:@"fetchPersonalDetails":@"personalDetailsWrapper"];
        //
        //            }@
//        if([actionMode isEqualToString:@"NEW"])// && [viewMode isEqualToString:@"N"])
//        {
//            
//            newData=[CommonUtils connectHost :@"insertKycDetails" :jsonDictionary:self];
//            [self parseResponse:newData:@"insertKycDetails":@"kycDetailsWrapper"];
//            //viewMode=@"N";
//        }
//        if([actionMode isEqualToString:@"UPDATE"])// && [viewMode isEqualToString:@"N"])
//        {
        
            newData=[CommonUtils connectHost :@"updateKYCEDD" :jsonDictionary:self];
            [self parseResponse:newData:@"updateKYCEDD":@"kycDetailsWrapper"];
            //viewMode=@"Y";
        //}
        
        self.refNo=kycData.refNo;
        
        NSLog(@"RefNo %@",self.refNo);
        
        //NSLog(@"ViewMode %@",self.viewMode);
        
        //---invoke next screen---
        //if([viewMode isEqualToString:@"N"])
        //{
        NSLog(@"To invoke next screen");
        
        //                   if([actionMode isEqualToString:@"NEW"])
        //                   {
        //                       viewMode=@"N";
        //                   }
        //                   if([actionMode isEqualToString:@"UPDATE"])
        //                   {
        //                       viewMode=@"Y";
        //                   }
        
        if(([actionMode isEqualToString:@"NEW"] || [actionMode isEqualToString:@"UPDATE"]) && ![actionMode isEqualToString:@"ENQUIRY"])
        {
        
            if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
            {
                
                
              
               
                    
                UIAlertController *alertController=[UIAlertController
                                     alertControllerWithTitle:@"Confirmation"
                                     message:[NSString stringWithFormat:@"Would you like to send Application %@ for Approval?",self.refNo]
                                     preferredStyle:UIAlertControllerStyleAlert];
               
          
                
                UIAlertAction* okAction = [UIAlertAction
                                           actionWithTitle:@"Proceed"
                                           style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * action)
                                           {
                                               
                                               
                                              NSDictionary *jsonDictionary= @{
                                                                 @"refNo":emptyStringIfNil(self.refNo),
                                                                 @"recordStatus":@"CREATE"
                                                                 };
                                               
                                               NSData *newData=[CommonUtils connectHost :@"updateApplicationStatus" :jsonDictionary:self];
                                               [self parseResponse:newData:@"updateApplicationStatus":@"personalDetailsWrapper"];
                                               
                                               //[CommonUtils showMessage:@"Application sent for Approval" :self];
                                               
                                               QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
                                               queueViewController.actionMode=@"UPDATE";
                                               queueViewController.menuId=@"QUEUEMAKER";
                                               queueViewController.recordStatus=@"INPROGRESS";
                                               [self.navigationController pushViewController:queueViewController animated:YES];

                                               
                                               
                                           }];
                
                UIAlertAction* noAction = [UIAlertAction
                                           actionWithTitle:@"No"
                                           style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * action)
                                           {
                                               
                                               
                                               QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
                                               queueViewController.actionMode=@"UPDATE";
                                               queueViewController.menuId=@"QUEUEMAKER";
                                               queueViewController.recordStatus=@"INPROGRESS";
                                               [self.navigationController pushViewController:queueViewController animated:YES];
                                               
                                               
                                               
                                           }];
                
                UIAlertAction* cancelAction = [UIAlertAction
                                               actionWithTitle:@"Cancel"
                                               style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action)
                                               {
                                                   //[alert dismissViewControllerAnimated:YES completion:nil];
                                               }];
                
                [alertController addAction:okAction];
                [alertController addAction:noAction];
                [alertController addAction:cancelAction];
                
                [self presentViewController:alertController animated:YES completion:nil];
                
                
            }
            if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"])
            {
                
                //[CommonUtils showMessage:@"Application approved, Account Created" :self];
                
                UIAlertController *alertController=[UIAlertController
                                                    alertControllerWithTitle:@"Confirmation"
                                                    message:[NSString stringWithFormat:@"Do You Want to Approve? %@",self.refNo]
                                                    preferredStyle:UIAlertControllerStyleAlert];
                
                
                
                UIAlertAction* okAction = [UIAlertAction
                                           actionWithTitle:@"Proceed"
                                           style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * action)
                                           {
                                               
                                               
                                               NSDictionary *jsonDictionary= @{
                                                                               @"refNo":emptyStringIfNil(self.refNo),
                                                                               @"recordStatus":@"APPROVED"
                                                                               };
                                               
                                               NSData *newData=[CommonUtils connectHost :@"approveRecord" :jsonDictionary:self];
                                               [self parseResponse:newData:@"approveRecord":@"personalDetailsWrapper"];
                                               
                                               //[CommonUtils showMessage:@"Approved":self];
                                               
                                               QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
                                               queueViewController.actionMode=@"UPDATE";
                                               queueViewController.menuId=@"QUEUEAPPROVER";
                                               queueViewController.recordStatus=@"CREATE";
                                               [self.navigationController pushViewController:queueViewController animated:YES];
                                               
                                           }];
                
                UIAlertAction* noAction = [UIAlertAction
                                           actionWithTitle:@"No"
                                           style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * action)
                                           {
                                               
                                               
                                               QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
                                               queueViewController.actionMode=@"UPDATE";
                                               queueViewController.menuId=@"QUEUEAPPROVER";
                                               queueViewController.recordStatus=@"CREATE";
                                               [self.navigationController pushViewController:queueViewController animated:YES];
                                               
                                               
                                               
                                           }];
                
                UIAlertAction* cancelAction = [UIAlertAction
                                               actionWithTitle:@"Cancel"
                                               style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action)
                                               {
                                                   //[alert dismissViewControllerAnimated:YES completion:nil];
                                               }];
                
                [alertController addAction:okAction];
                [alertController addAction:noAction];
                [alertController addAction:cancelAction];
                
                [self presentViewController:alertController animated:YES completion:nil];
                

            }
        }
        
        
        
        

        
//        KYC2ViewController *kyc2ViewController = [[KYC2ViewController alloc]initWithNibName:nil bundle:nil];
//        kyc2ViewController.userid=self.userid;
//        kyc2ViewController.sessionid=self.sessionid;
//        kyc2ViewController.actionMode=self.actionMode;
//        //identificationViewController.viewMode=self.viewMode;
//        kyc2ViewController.refNo=self.refNo;
////        
//        [self.navigationController pushViewController:kyc2ViewController animated:YES];
        
        //}
        
        
        
        //----------
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSON code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in buildJSON Code");
        
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
}



- (void) viewData {
    
    @try{
        
        
        //refNo=@"SA21OCT2015156";
        
        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
        
        //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
        //{
        NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo)};
        //}
        
        //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
        //{
        
        NSData *newData=[CommonUtils connectHost :@"fetchKYCEDD" :jsonDictionary:self];
        [self parseResponse:newData:@"fetchKYCEDD":@"kycDetailsWrapper"];
        
        
        jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo)};
        newData=[CommonUtils connectHost :@"fetchPathStatus" :jsonDictionary:self];
        [self parseResponsePath:newData:@"fetchPathStatus":@"pathStatusWrapper"];

        //}
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in KYC EDD viewData code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in KYC EDD viewData Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
}

- (void) doReject {
    
    
    @try{
        
        
        UIAlertController *alertController=[UIAlertController
                                            alertControllerWithTitle:@"Confirmation"
                                            message:[NSString stringWithFormat:@"Do you want to send this Application %@ back to maker?",self.refNo]
                                            preferredStyle:UIAlertControllerStyleAlert];
        
        
        
        UIAlertAction* okAction = [UIAlertAction
                                   actionWithTitle:@"Proceed"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       
                                       
                                       
                                       
                                       [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
                                       
                                       //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
                                       //{
                                       NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo),
                                                                       @"recordStatus":@"INPROGRESS"
                                                                       };
                                       //}
                                       
                                       //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
                                       //{
                                       
                                       NSData *newData=[CommonUtils connectHost :@"updateApplicationStatus" :jsonDictionary:self];
                                       [self parseResponse:newData:@"updateApplicationStatus":@"personalDetailsWrapper"];
                                       
                                       
                                       
                                       
                                       QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
                                       queueViewController.actionMode=@"UPDATE";
                                       queueViewController.menuId=@"QUEUEAPPROVER";
                                       queueViewController.recordStatus=@"CREATE";
                                       [self.navigationController pushViewController:queueViewController animated:YES];
                                       
                                       
                                       //}
                                       [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
                                       
                                       
                                       
                                   }];
        
        
        UIAlertAction* cancelAction = [UIAlertAction
                                       actionWithTitle:@"Cancel"
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action)
                                       {
                                           //[alert dismissViewControllerAnimated:YES completion:nil];
                                       }];
        
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        
        
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in Personal viewData code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in doreject Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
}
-(void) loadData {
    
    
    @try{
        
        
        
        kycData = [kycArray objectAtIndex:0];
        
        
        txtEDDDetalsBusines.text=emptyStringIfNil(kycData.eddDetailsLnsBusiness);
        txtEDDHowwasProspts.text=emptyStringIfNil(kycData.eddHowProspectIntroduced);
        txtEDDDescrbClntSrc.text=emptyStringIfNil(kycData.eddDescClientsSourceWealth);
        txtEDDPrdtUsgTrnsPrf.text=emptyStringIfNil(kycData.eddProdUsgTransProfile);
        txtEDDNonresdnt.text=emptyStringIfNil(kycData.eddNonResident);
        txtEDDDetlsNonresdnt.text=emptyStringIfNil(kycData.eddDetailsOpenAcc);
        txtEDDAruAwreAsptsreltd.text=emptyStringIfNil(kycData.eddAreYouAwereOfAnyAspect);
        txtIConfmmCheckBox.text=emptyStringIfNil(kycData.iConfirmCheckbox);
        txtPreparedBy.text=emptyStringIfNil(kycData.preparedBy);
        txtPreDate.text=emptyStringIfNil(kycData.preparedDate);
        txtReviewdBy.text=emptyStringIfNil(kycData.reviewedBy);
        txtRevByDate.text=emptyStringIfNil(kycData.reviewedDate);
        txtApprovedBy.text=emptyStringIfNil(kycData.approvedBy);
        txtAppByDate.text=emptyStringIfNil(kycData.approvedDate);
        
        
        NSLog(@"cell data loaded ");
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




- (void) parseResponse:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
        //NSLog(@"get customer info enterest %@",userid);
        
        
        
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
            
            //NSLog(@"userid print :%@",userid);
            //NSLog(@"sessionid print :%@",sessionid);
            
            
            NSNumber *success = [jsonObject objectForKey:@"success"];
            if([success boolValue] == YES){
                
                
                
                //set the customer object of the second view controller
                //dataDictionary =[jsonObject objectForKey:@"fetchPersonalDetails"];
                dataDictionary =[jsonObject objectForKey:methodAction];
                
                NSLog(@"Dictionary: %@", [dataDictionary description]);
                
                
                for(NSString *key in [dataDictionary allKeys]) {
                    NSLog(@"key code: %@",key);
                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
                    
                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                    
                }
                
                // Create a new array to hold the locations
                kycArray = [[NSMutableArray alloc] init];
                
                // Get an array of dictionaries with the key "locations"
                //NSArray *array = [dataDictionary objectForKey:@"personalDetailsWrapper"];
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    kycData = [[KycData alloc] initWithJSONDictionary:dict];
                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
                    
                    // Add the Location object to the array
                    [kycArray addObject:kycData];
                }
                
                
                NSLog(@"data count %lu",(unsigned long)kycArray.count);
                
                
                
                //                NSDictionary *customerMasterData = [dataDictionary objectForKey:@"Customer Master Data"];
                //
                //                for(NSString *key in [customerMasterData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerMasterData objectForKey:key]);
                //
                //                    if ([key isEqualToString:@"Customer number"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
                //                    }
                //                    if ([key isEqualToString:@"Customer name"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
                //                    }
                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
                //                    //}
                //
                //                }
                
                //NSDictionary *customerDetailData = [dataDictionary objectForKey:@"onBoardDataWrapper"];
                
                //NSLog(@"customerDetailData: %@", [customerDetailData description]);
                
                
                
                
                //                for(NSString *key in [customerDetailData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
                //                    NSLog(@"value: %@",[customerDetailData valueForKey:key]);
                //
                //                }
                
                
                //                accountName = [customerDetailData objectForKey:@"customerName"];
                //                accountNumber= [customerDetailData objectForKey:@"accountNumber"];
                //                accountCurrency= [customerDetailData objectForKey:@"accountCurrency"];
                //                accountAvlBalance= [customerDetailData objectForKey:@"availableBalance"];
                //                accountCurrentBalance= [customerDetailData objectForKey:@"currentBalance"];
                //                onBoardDatatatus= [customerDetailData objectForKey:@"onBoardDatatatus"];
                
                
                //                for(NSString *key in [customerDetailData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
                //
                //                    if ([key isEqualToString:@"accountNumber"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
                //                    }
                //                    if ([key isEqualToString:@"Customer name"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
                //                    }
                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
                //                    //}
                //
                //                }
                
                //NSMutableArray *custData = [[NSMutableArray alloc] initWithCapacity:0];
                //                onBoardDataKeyData = [[NSArray alloc] initWithArray:[customerDetailData allKeys]];
                //                onBoardDataValueData = [[NSArray alloc] initWithArray:[customerDetailData allValues]];
                
                
                //custKeyData = [custKeyData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                //custValueData = [custValueData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                
                //                for (NSString *string in onBoardDataKeyData) {
                //                    NSLog(@" array key data:%@", string);
                //                }
                //
                //                for (NSString *string in onBoardDataValueData) {
                //                    NSLog(@" array value data:%@", string);
                //                }
                
                //for (NSDictionary *info in [customerInfo allValues])
                //{
                //   [custData addObject:[info valueForKey:@"custName"]];
                //}
                
                //NSArray * values = [dictionary allValues];
                //NSArray *keys = [dictionary allKeys];
                //NSArray *values = [dictionary allValues];
                //NSMutableArray *values = [[NSMutableArray alloc] initWithArray:[dictionary allValues]];
                //NSMutableArray *yourArray = [NSMutableArray arrayWithCapacity:6];
                //[yourDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                //    [yourArray addObject:obj];
                //}];
                
                
            }
            else {
                NSLog(@"Success is invalid...");
                
                [CommonUtils showMessage:@"Invalid userid or sessionid !":self];
                
                
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

- (void) parseResponsePath:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
        //NSLog(@"get customer info enterest %@",userid);
        
        
        
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
            
            //NSLog(@"userid print :%@",userid);
            //NSLog(@"sessionid print :%@",sessionid);
            
            
            NSNumber *success = [jsonObject objectForKey:@"success"];
            if([success boolValue] == YES){
                
                
                
                //set the customer object of the second view controller
                //dataDictionary =[jsonObject objectForKey:@"fetchPersonalDetails"];
                dataDictionary =[jsonObject objectForKey:methodAction];
                
                NSLog(@"Dictionary: %@", [dataDictionary description]);
                
                
                for(NSString *key in [dataDictionary allKeys]) {
                    NSLog(@"key code: %@",key);
                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
                    
                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                    
                }
                
                // Create a new array to hold the locations
                pathArray = [[NSMutableArray alloc] init];
                
                // Get an array of dictionaries with the key "locations"
                //NSArray *array = [dataDictionary objectForKey:@"personalDetailsWrapper"];
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    pathData = [[PathData alloc] initWithJSONDictionary:dict];
                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
                    
                    // Add the Location object to the array
                    [pathArray addObject:pathData];
                }
                
                
                NSLog(@"data count %lu",(unsigned long)pathArray.count);
                
                
                
                //                NSDictionary *customerMasterData = [dataDictionary objectForKey:@"Customer Master Data"];
                //
                //                for(NSString *key in [customerMasterData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerMasterData objectForKey:key]);
                //
                //                    if ([key isEqualToString:@"Customer number"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
                //                    }
                //                    if ([key isEqualToString:@"Customer name"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
                //                    }
                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
                //                    //}
                //
                //                }
                
                //NSDictionary *customerDetailData = [dataDictionary objectForKey:@"onBoardDataWrapper"];
                
                //NSLog(@"customerDetailData: %@", [customerDetailData description]);
                
                
                
                
                //                for(NSString *key in [customerDetailData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
                //                    NSLog(@"value: %@",[customerDetailData valueForKey:key]);
                //
                //                }
                
                
                //                accountName = [customerDetailData objectForKey:@"customerName"];
                //                accountNumber= [customerDetailData objectForKey:@"accountNumber"];
                //                accountCurrency= [customerDetailData objectForKey:@"accountCurrency"];
                //                accountAvlBalance= [customerDetailData objectForKey:@"availableBalance"];
                //                accountCurrentBalance= [customerDetailData objectForKey:@"currentBalance"];
                //                onBoardDatatatus= [customerDetailData objectForKey:@"onBoardDatatatus"];
                
                
                //                for(NSString *key in [customerDetailData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
                //
                //                    if ([key isEqualToString:@"accountNumber"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
                //                    }
                //                    if ([key isEqualToString:@"Customer name"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
                //                    }
                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
                //                    //}
                //
                //                }
                
                //NSMutableArray *custData = [[NSMutableArray alloc] initWithCapacity:0];
                //                onBoardDataKeyData = [[NSArray alloc] initWithArray:[customerDetailData allKeys]];
                //                onBoardDataValueData = [[NSArray alloc] initWithArray:[customerDetailData allValues]];
                
                
                //custKeyData = [custKeyData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                //custValueData = [custValueData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                
                //                for (NSString *string in onBoardDataKeyData) {
                //                    NSLog(@" array key data:%@", string);
                //                }
                //
                //                for (NSString *string in onBoardDataValueData) {
                //                    NSLog(@" array value data:%@", string);
                //                }
                
                //for (NSDictionary *info in [customerInfo allValues])
                //{
                //   [custData addObject:[info valueForKey:@"custName"]];
                //}
                
                //NSArray * values = [dictionary allValues];
                //NSArray *keys = [dictionary allKeys];
                //NSArray *values = [dictionary allValues];
                //NSMutableArray *values = [[NSMutableArray alloc] initWithArray:[dictionary allValues]];
                //NSMutableArray *yourArray = [NSMutableArray arrayWithCapacity:6];
                //[yourDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                //    [yourArray addObject:obj];
                //}];
                
                
            }
            else {
                NSLog(@"Success is invalid...");
                
                [CommonUtils showMessage:@"Invalid userid or sessionid !":self];
                
                
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




- (void)addItemViewController:(PopoverViewController *)controller didFinishEnteringItem:(NSString *)item  didFinishEnteringItem1:(NSString *)code didFinishEnteringItem2:(int)fieldTag
{
    //NSLog(@"This was returned from PopoverViewController %ld", (long)fieldTag);
    // NSArray *components = [item componentsSeparatedByString:@"\n"];
    //NSLog(@" popvalues %@", components[0]);
    
    
    id viewObj = [self.view viewWithTag:(long)fieldTag];
    
    if([viewObj isKindOfClass:[UITextField class]])
    {
        UITextField *textField =(UITextField *)viewObj;
        textField.text=item;
        [popoverCodeValue setObject:code forKey:[NSString stringWithFormat:@"%d", fieldTag]];
        //[dataArray insertObject:code atIndex:fieldTag];
    }
    
    
    
}



-(void)countdownTimer{
    
    secondsLeft = hours = minutes = seconds = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
    
}

- (void)updateCounter:(NSTimer *)theTimer {
    if(secondsLeft > 0 ){
        secondsLeft -- ;
        hours = secondsLeft / 3600;
        minutes = (secondsLeft % 3600) / 60;
        seconds = (secondsLeft %3600) % 60;
        self.timerView.font=[UIFont systemFontOfSize:45.0f];
        self.timerView.textColor=[UIColor brownColor];
        self.timerView.textAlignment=NSTextAlignmentCenter;
        self.timerView.text = [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
    }
    else{
        secondsLeft = 16925;
    }
}

-(void)displayGraph
{
    
    webView = [[UIWebView alloc] init];//]WithFrame:CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height)];
    webView.tag=55;
    webView.delegate = self;
    webView.layer.borderWidth=1.0;
    webView.layer.borderColor=[UIColor whiteColor].CGColor;
    webView.layer.shadowRadius=10.0;
    webView.backgroundColor = [UIColor whiteColor];
    webView.layer.shadowOffset = CGSizeMake(0, 3);
    webView.layer.shadowRadius = 10.0;
    webView.layer.shadowColor = [UIColor blackColor].CGColor;
    webView.layer.shadowOpacity = 0.8;
    webView.layer.cornerRadius = 15.0;
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"pathstatus" ofType:@"html" inDirectory:@"www"]];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    webView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:webView];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.78 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.58 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.23 constant:0]];
    
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    NSString* json;
    
    @try
    {
        
        
        
        NSMutableDictionary *jsonDictionary = [[NSMutableDictionary alloc]init];
        
        
        for (int i=0; i<=pathArray.count-1; i++)
        {
            
            pathData = [pathArray objectAtIndex:i];
            
            NSLog(@"path screen %@",pathData.screen);
            
            [jsonDictionary setObject:pathStringIfNil(pathData.status) forKey:pathData.screen];
            
            
        }
        
        
        NSError *errorOut;
        NSString *jsonString;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&errorOut];
        
        if (! jsonData) {
            NSLog(@"Got an error in json creation chart: %@", errorOut);
        } else {
            jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
        
        NSLog(@"jsondata %@",jsonString);
        
        
        json = [NSString stringWithFormat:@ "loadDashboardChart(%@);",jsonString];
        
        NSLog(@"function json %@",json);
        [self.webView stringByEvaluatingJavaScriptFromString: json];
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in webViewDidFinishLoad code %@ reason %@ " , [exception name], [exception reason]);
        
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in webViewDidFinishLoad  Code");
    }
    
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*)ReadSingleTonInstanceVariable:(NSString*)InstVar
{
    SigletonClass *sObj=[SigletonClass sharedSingletonClass];
    return [sObj valueForKey:InstVar];
}

-(void) logout:(id) sender
{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    return;
}



//
//-(void) loadActivityIndicator
//{
//    //----activity indicator
//    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//
//    self.activityIndicator.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
//    activityIndicator.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
//    activityIndicator.hidden=NO;
//    activityIndicator.color=[UIColor borderBlueColor];
//    [activityIndicator setHidesWhenStopped:YES];
//
//
//
//    //-----label loading----
//    lblLoading = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height+30.0f)];
//    lblLoading.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//    lblLoading.font = [UIFont boldSystemFontOfSize:12.0f];
//    lblLoading.numberOfLines = 1;
//    lblLoading.textAlignment=NSTextAlignmentCenter;
//    lblLoading.backgroundColor = [UIColor clearColor];
//    lblLoading.textColor = [UIColor borderBlueColor];
//
//
//    [self.view addSubview:lblLoading];
//    [self.view bringSubviewToFront:lblLoading];
//    [lblLoading addSubview:activityIndicator];
//
//}


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

static inline NSString* pathStringIfNil(NSString *value) {
    
    return ([value isEqualToString:@"Y"]? @"100" : @"0");
}

@end

