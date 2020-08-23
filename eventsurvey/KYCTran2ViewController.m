//
//  KYCTran2ViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 23/10/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "KYCTran2ViewController.h"
#import "KycData.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "PopoverViewController.h"
#import "KYCEDDViewController.h"
#import "QueueViewController.h"





@interface KYCTran2ViewController ()



@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

CGFloat lblconstraintKyc2TranX2=0.52f;
CGFloat lblconstraintKyc2TranY2=1.0f;
CGFloat lblconstraintKyc2TranWidth2=0.5f;
CGFloat lblconstraintKyc2TranHeight2=0.8f;

CGFloat constraintKyc2TranX2=1.19f;
CGFloat constraintKyc2TranY2=1.0f;
CGFloat constraintKyc2TranWidth2=0.80f;
CGFloat constraintKyc2TranHeight2=0.8f;

CGFloat constraintKyc2Tran1X2=0.69f;
CGFloat constraintKyc2Tran1Y2=1.0f;
CGFloat constraintKyc2Tran1Width2=0.3f;
CGFloat constraintKyc2Tran1Height2=0.8f;

//CGFloat lblconstraintKyc2Tran2X2=1.52f;
CGFloat lblconstraintKyc2Tran2X2=1.13f;
CGFloat lblconstraintKyc2Tran2Y2=1.0f;
//CGFloat lblconstraintKyc2Tran2Width2=0.5f;
CGFloat lblconstraintKyc2Tran2Width2=0.22f;
CGFloat lblconstraintKyc2Tran2Height2=0.8f;

CGFloat constraintKyc2Tran2X2=1.69f;
CGFloat constraintKyc2Tran2Y2=1.0f;
CGFloat constraintKyc2Tran2Width2=0.3f;
CGFloat constraintKyc2Tran2Height2=0.8f;




@implementation KYCTran2ViewController




@synthesize menuName;
//@synthesize sessionid;
@synthesize actionMode;
@synthesize popoverCodeValue;

@synthesize dataDictionary;
@synthesize existingCustomerFlag;
@synthesize existingRefNo;

@synthesize popoverData;
@synthesize popoverArray;
@synthesize refNo;

@synthesize kycArray;
@synthesize kycData;

@synthesize dateToolBar;
@synthesize datePicker;


@synthesize txtOutNoOfTransInaMonthInternat;
@synthesize txtOutNoOfTransInaMonthLocal;
@synthesize txtOutTotAmntOfTransAEDInternat;
@synthesize txtOutTotAmntOfTransAEDLocal;
@synthesize txtOutPurpsOfTransInternat;
@synthesize txtOutPurpsOfTransLocal;
@synthesize txtInNoOfTransInaMonthInternat;
@synthesize txtInNoOfTransInaMonthLocal;
@synthesize txtInTotAmntOfTransAEDInternat;
@synthesize txtInTotAmntOfTransAEDLocal;
@synthesize txtInPurpsOfTransInternat;
@synthesize txtInPurpsOfTransLocal;

@synthesize txtInMaxsingAmtInwardremetns;
@synthesize txtInMaxsingAmtOutwardremetns;
@synthesize txtInIntrnlRemitInwardremetns;
@synthesize txtInIntrnlRemiOutwardremetns;

@synthesize recordStatus;
@synthesize webView;
//@synthesize activityIndicator;
//@synthesize lblLoading;

@synthesize timerView;


int hours, minutes, seconds,secondsLeft;


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
    
//     self.navigationItem.title=[NSString stringWithFormat:@"%@ - %@",self.menuName,@"KYC Transaction"];
    self.navigationItem.title=@"KYC Transaction";
    
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
   
    
    //--International and Local Remittance
    if (textField.tag == 1 || textField.tag == 2 || textField.tag == 3 || textField.tag == 4 || textField.tag == 5 || textField.tag == 6 || textField.tag == 7 || textField.tag == 8 || textField.tag == 9 || textField.tag == 10 || textField.tag == 11 || textField.tag == 12 || textField.tag == 13 || textField.tag == 14) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        //        return newLength <= 20;
        
        
        NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
        
        // allow backspace
        if (range.length > 0 && [string length] == 0) {
            return YES;
        }
        //        // do not allow . at the beggining
        //        if (range.location == 0 && [string isEqualToString:@"."]) {
        //            return NO;
        //        }
        // set the text field value manually
        NSString *newValue = [[textField text] stringByReplacingCharactersInRange:range withString:string];
        newValue = [[newValue componentsSeparatedByCharactersInSet:nonNumberSet] componentsJoinedByString:@""];
        
        if(newLength > 4)
        {
            return NO;
        }
        textField.text = newValue;
        // return NO because we're manually setting the value
        return NO;
        
    }

    return YES;
    
}


-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"] || [actionMode isEqualToString:@"ENQUIRY"])
    {
        return NO;
    }
    
    if(textField.tag==15)
    {
        [self popoverData:textField:@"NATIONALITY"];
        return NO; //to disable keyboard
    }
    else if(textField.tag==16)
    {
        [self popoverData:textField:@"NATIONALITY"];
        return NO; //to disable keyboard
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
        
        
        return @" Transaction Profile";
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
            
            CommonLabel *lblOutWardRem   =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOutWardRem.text=@"Outward Remittances";
            lblOutWardRem.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOutWardRem];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutWardRem attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2TranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutWardRem attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2TranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutWardRem attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2TranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutWardRem attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2TranHeight2 constant:0]];
            
            
            
            
            CommonLabel *lblInterntnal   =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblInterntnal.text=@"International";
            lblInterntnal.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblInterntnal];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInterntnal attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInterntnal attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2Tran2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInterntnal attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInterntnal attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2Tran2Height2 constant:0]];
            
            
            
            
            CommonLabel *lblLocal   =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblLocal.text=@"Local";
            lblLocal.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblLocal];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLocal attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLocal attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Tran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLocal attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLocal attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Tran2Height2 constant:0]];
            
            
            
            
            
            
        }
        
        
        else if(indexPath.section==1){
            
            CommonLabel *lblOutNoOfTransInaMonth   =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOutNoOfTransInaMonth.text=@" No. Of Transactions In A Month";
            lblOutNoOfTransInaMonth.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOutNoOfTransInaMonth];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutNoOfTransInaMonth attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2TranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutNoOfTransInaMonth attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2TranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutNoOfTransInaMonth attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2TranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutNoOfTransInaMonth attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2TranHeight2 constant:0]];
            
            
            
            
            txtOutNoOfTransInaMonthInternat = [[CommonTextField alloc] init];
            txtOutNoOfTransInaMonthInternat.tag=1;
            txtOutNoOfTransInaMonthInternat.delegate=self;
            txtOutNoOfTransInaMonthInternat.placeholder=@"   International       ";
            txtOutNoOfTransInaMonthInternat.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtOutNoOfTransInaMonthInternat];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutNoOfTransInaMonthInternat attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutNoOfTransInaMonthInternat attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2Tran2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutNoOfTransInaMonthInternat attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutNoOfTransInaMonthInternat attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2Tran2Height2 constant:0]];
            
            
            txtOutNoOfTransInaMonthLocal = [[CommonTextField alloc] init];
            txtOutNoOfTransInaMonthLocal.tag=2;
            txtOutNoOfTransInaMonthLocal.delegate=self;
            txtOutNoOfTransInaMonthLocal.placeholder=@"   Local  ";
            txtOutNoOfTransInaMonthLocal.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtOutNoOfTransInaMonthLocal];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutNoOfTransInaMonthLocal attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutNoOfTransInaMonthLocal attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Tran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutNoOfTransInaMonthLocal attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutNoOfTransInaMonthLocal attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Tran2Height2 constant:0]];
            
            
        }
        
        
        else if(indexPath.section==2){
            
            CommonLabel *lblOutTotAmntOfTransAED   =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOutTotAmntOfTransAED.text=@" Total Amount Of Transactions In AED";
            lblOutTotAmntOfTransAED.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOutTotAmntOfTransAED];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutTotAmntOfTransAED attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2TranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutTotAmntOfTransAED attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2TranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutTotAmntOfTransAED attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2TranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutTotAmntOfTransAED attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2TranHeight2 constant:0]];
            
            
            txtOutTotAmntOfTransAEDInternat = [[CommonTextField alloc] init];
            txtOutTotAmntOfTransAEDInternat.tag=3;
            txtOutTotAmntOfTransAEDInternat.delegate=self;
            txtOutTotAmntOfTransAEDInternat.placeholder=@"   International       ";
            txtOutTotAmntOfTransAEDInternat.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtOutTotAmntOfTransAEDInternat];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutTotAmntOfTransAEDInternat attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutTotAmntOfTransAEDInternat attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2Tran2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutTotAmntOfTransAEDInternat attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutTotAmntOfTransAEDInternat attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2Tran2Height2 constant:0]];
            
            
            txtOutTotAmntOfTransAEDLocal = [[CommonTextField alloc] init];
            txtOutTotAmntOfTransAEDLocal.tag=4;
            txtOutTotAmntOfTransAEDLocal.delegate=self;
            txtOutTotAmntOfTransAEDLocal.placeholder=@"  Local  ";
            txtOutTotAmntOfTransAEDLocal.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtOutTotAmntOfTransAEDLocal];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutTotAmntOfTransAEDLocal attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutTotAmntOfTransAEDLocal attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Tran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutTotAmntOfTransAEDLocal attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutTotAmntOfTransAEDLocal attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Tran2Height2 constant:0]];
            
            
        }
        
        
        else if(indexPath.section==3){
            
            CommonLabel *lblOutPurpsOfTrans   =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOutPurpsOfTrans.text=@" Purpose Of Transations";
            lblOutPurpsOfTrans.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOutPurpsOfTrans];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutPurpsOfTrans attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2TranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutPurpsOfTrans attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2TranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutPurpsOfTrans attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2TranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutPurpsOfTrans attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2TranHeight2 constant:0]];
            
            
            txtOutPurpsOfTransInternat = [[CommonTextField alloc] init];
            txtOutPurpsOfTransInternat.tag=5;
            txtOutPurpsOfTransInternat.delegate=self;
            txtOutPurpsOfTransInternat.placeholder=@"   International       ";
            txtOutPurpsOfTransInternat.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtOutPurpsOfTransInternat];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutPurpsOfTransInternat attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutPurpsOfTransInternat attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2Tran2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutPurpsOfTransInternat attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutPurpsOfTransInternat attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2Tran2Height2 constant:0]];
            
            
            txtOutPurpsOfTransLocal = [[CommonTextField alloc] init];
            txtOutPurpsOfTransLocal.tag=6;
            txtOutPurpsOfTransLocal.delegate=self;
            txtOutPurpsOfTransLocal.placeholder=@"   Local  ";
            txtOutPurpsOfTransLocal.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtOutPurpsOfTransLocal];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutPurpsOfTransLocal attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutPurpsOfTransLocal attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Tran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutPurpsOfTransLocal attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOutPurpsOfTransLocal attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Tran2Height2 constant:0]];
            
            
        }
        
        
        
        else if(indexPath.section==4){
            
            CommonLabel *lblInWardRemittans   =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblInWardRemittans.text=@" Inward Remittances";
            lblInWardRemittans.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblInWardRemittans];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInWardRemittans attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2TranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInWardRemittans attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2TranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInWardRemittans attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2TranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInWardRemittans attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2TranHeight2 constant:0]];
            
        }
        
        
        else if(indexPath.section==5){
            
            CommonLabel *lblInNoOfTransInaMonth   =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblInNoOfTransInaMonth.text=@" No. Of Transactions In A Month";
            lblInNoOfTransInaMonth.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblInNoOfTransInaMonth];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInNoOfTransInaMonth attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2TranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInNoOfTransInaMonth attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2TranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInNoOfTransInaMonth attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2TranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInNoOfTransInaMonth attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2TranHeight2 constant:0]];
            
            
            txtInNoOfTransInaMonthInternat = [[CommonTextField alloc] init];
            txtInNoOfTransInaMonthInternat.tag=7;
            txtInNoOfTransInaMonthInternat.delegate=self;
            txtInNoOfTransInaMonthInternat.placeholder=@"   International       ";
            txtInNoOfTransInaMonthInternat.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtInNoOfTransInaMonthInternat];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInNoOfTransInaMonthInternat attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInNoOfTransInaMonthInternat attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2Tran2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInNoOfTransInaMonthInternat attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInNoOfTransInaMonthInternat attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2Tran2Height2 constant:0]];
            
            
            txtInNoOfTransInaMonthLocal = [[CommonTextField alloc] init];
            txtInNoOfTransInaMonthLocal.tag=8;
            txtInNoOfTransInaMonthLocal.delegate=self;
            txtInNoOfTransInaMonthLocal.placeholder=@"  Local  ";
            txtInNoOfTransInaMonthLocal.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtInNoOfTransInaMonthLocal];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInNoOfTransInaMonthLocal attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInNoOfTransInaMonthLocal attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Tran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInNoOfTransInaMonthLocal attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInNoOfTransInaMonthLocal attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Tran2Height2 constant:0]];
            
            
        }
        
        
        else if(indexPath.section==6){
            
            CommonLabel *lblInTotAmntOfTransAED   =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblInTotAmntOfTransAED.text=@" Total Amount Of Transactions In AED";
            lblInTotAmntOfTransAED.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblInTotAmntOfTransAED];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInTotAmntOfTransAED attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2TranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInTotAmntOfTransAED attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2TranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInTotAmntOfTransAED attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2TranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInTotAmntOfTransAED attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2TranHeight2 constant:0]];
            
            
            
            txtInTotAmntOfTransAEDInternat = [[CommonTextField alloc] init];
            txtInTotAmntOfTransAEDInternat.tag=9;
            txtInTotAmntOfTransAEDInternat.delegate=self;
            txtInTotAmntOfTransAEDInternat.placeholder=@"   International       ";
            txtInTotAmntOfTransAEDInternat.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtInTotAmntOfTransAEDInternat];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInTotAmntOfTransAEDInternat attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInTotAmntOfTransAEDInternat attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2Tran2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInTotAmntOfTransAEDInternat attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInTotAmntOfTransAEDInternat attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2Tran2Height2 constant:0]];
            
            
            txtInTotAmntOfTransAEDLocal = [[CommonTextField alloc] init];
            txtInTotAmntOfTransAEDLocal.tag=10;
            txtInTotAmntOfTransAEDLocal.delegate=self;
            txtInTotAmntOfTransAEDLocal.placeholder=@"  Local  ";
            txtInTotAmntOfTransAEDLocal.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtInTotAmntOfTransAEDLocal];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInTotAmntOfTransAEDLocal attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInTotAmntOfTransAEDLocal attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Tran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInTotAmntOfTransAEDLocal attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInTotAmntOfTransAEDLocal attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Tran2Height2 constant:0]];
            
            
        }
        
        
        else if(indexPath.section==7){
            
            CommonLabel *lblInPurpsOfTrans   =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblInPurpsOfTrans.text=@" Purpose Of Transactions";
            lblInPurpsOfTrans.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblInPurpsOfTrans];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInPurpsOfTrans attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2TranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInPurpsOfTrans attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2TranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInPurpsOfTrans attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2TranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInPurpsOfTrans attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2TranHeight2 constant:0]];
            
            
            txtInPurpsOfTransInternat = [[CommonTextField alloc] init];
            txtInPurpsOfTransInternat.tag=11;
            txtInPurpsOfTransInternat.delegate=self;
            txtInPurpsOfTransInternat.placeholder=@"   International       ";
            txtInPurpsOfTransInternat.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtInPurpsOfTransInternat];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInPurpsOfTransInternat attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInPurpsOfTransInternat attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2Tran2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInPurpsOfTransInternat attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInPurpsOfTransInternat attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2Tran2Height2 constant:0]];
            
            
            txtInPurpsOfTransLocal = [[CommonTextField alloc] init];
            txtInPurpsOfTransLocal.tag=12;
            txtInPurpsOfTransLocal.delegate=self;
            txtInPurpsOfTransLocal.placeholder=@"   Local  ";
            txtInPurpsOfTransLocal.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtInPurpsOfTransLocal];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInPurpsOfTransLocal attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInPurpsOfTransLocal attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Tran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInPurpsOfTransLocal attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInPurpsOfTransLocal attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Tran2Height2 constant:0]];
            
            
        }
        
        
        
        else if(indexPath.section==8){
            
            CommonLabel *lblInwardRemtns   =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblInwardRemtns.text=@"Inward Remittances";
            lblInwardRemtns.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblInwardRemtns];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInwardRemtns attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInwardRemtns attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2Tran2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInwardRemtns attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInwardRemtns attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2Tran2Height2 constant:0]];
            
            
            
            
            CommonLabel *lblOutWardRemtns   =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOutWardRemtns.text=@"Outward Remittances";
            lblOutWardRemtns.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOutWardRemtns];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutWardRemtns attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutWardRemtns attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Tran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutWardRemtns attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOutWardRemtns attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Tran2Height2 constant:0]];
            
            
        }
        
        
        else if(indexPath.section==9){
            
            CommonLabel *lblInMaxsingAmt   =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblInMaxsingAmt.text=@" Maximum Single Amount Of Inward/Outward";
            lblInMaxsingAmt.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblInMaxsingAmt];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInMaxsingAmt attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2TranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInMaxsingAmt attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2TranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInMaxsingAmt attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2TranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInMaxsingAmt attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2TranHeight2 constant:0]];
            
            
            txtInMaxsingAmtInwardremetns = [[CommonTextField alloc] init];
            txtInMaxsingAmtInwardremetns.tag=13;
            txtInMaxsingAmtInwardremetns.delegate=self;
            txtInMaxsingAmtInwardremetns.placeholder=@"   Inward Remittances       ";
            txtInMaxsingAmtInwardremetns.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtInMaxsingAmtInwardremetns];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInMaxsingAmtInwardremetns attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInMaxsingAmtInwardremetns attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2Tran2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInMaxsingAmtInwardremetns attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInMaxsingAmtInwardremetns attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2Tran2Height2 constant:0]];
            
            
            txtInMaxsingAmtOutwardremetns = [[CommonTextField alloc] init];
            txtInMaxsingAmtOutwardremetns.tag=14;
            txtInMaxsingAmtOutwardremetns.delegate=self;
            txtInMaxsingAmtOutwardremetns.placeholder=@"   Outward Remittances  ";
            txtInMaxsingAmtOutwardremetns.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtInMaxsingAmtOutwardremetns];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInMaxsingAmtOutwardremetns attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInMaxsingAmtOutwardremetns attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Tran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInMaxsingAmtOutwardremetns attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInMaxsingAmtOutwardremetns attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Tran2Height2 constant:0]];
            
            
        }
        
        else if(indexPath.section==10){
            
            CommonLabel *lblInIntrnlRemit   =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblInIntrnlRemit.text=@" International Remittances 3 Major Countries";
            lblInIntrnlRemit.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblInIntrnlRemit];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInIntrnlRemit attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2TranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInIntrnlRemit attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2TranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInIntrnlRemit attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2TranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInIntrnlRemit attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2TranHeight2 constant:0]];
            
            
            txtInIntrnlRemitInwardremetns = [[CommonTextField alloc] init];
            txtInIntrnlRemitInwardremetns.tag=15;
            txtInIntrnlRemitInwardremetns.delegate=self;
            txtInIntrnlRemitInwardremetns.placeholder=@"   Inward Remittances       ";
            txtInIntrnlRemitInwardremetns.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtInIntrnlRemitInwardremetns];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInIntrnlRemitInwardremetns attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInIntrnlRemitInwardremetns attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKyc2Tran2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInIntrnlRemitInwardremetns attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInIntrnlRemitInwardremetns attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKyc2Tran2Height2 constant:0]];
            
            
            txtInIntrnlRemiOutwardremetns = [[CommonTextField alloc] init];
            txtInIntrnlRemiOutwardremetns.tag=16;
            txtInIntrnlRemiOutwardremetns.delegate=self;
            txtInIntrnlRemiOutwardremetns.placeholder=@"   Outward Remittances   ";
            txtInIntrnlRemiOutwardremetns.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtInIntrnlRemiOutwardremetns];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInIntrnlRemiOutwardremetns attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2Tran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInIntrnlRemiOutwardremetns attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Tran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInIntrnlRemiOutwardremetns attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Tran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInIntrnlRemiOutwardremetns attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Tran2Height2 constant:0]];
            
            
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
//    
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
    
    
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
    
}

- (void) doValidate {
    
    
    
    //------validation starts---------
    
    if([CommonUtils checkEmptyString:txtOutNoOfTransInaMonthInternat.text]==YES)
    {
        [CommonUtils showMessage:@"Outward No Of Transactions In A Month International can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtOutNoOfTransInaMonthLocal.text]==YES)
    {
        [CommonUtils showMessage:@"Outward No Of Transactions In A Month Local can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtOutTotAmntOfTransAEDInternat.text]==YES)
    {
        [CommonUtils showMessage:@"Outward Total Amount Of Transactions In AED International can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtOutTotAmntOfTransAEDLocal.text]==YES)
    {
        [CommonUtils showMessage:@"Outward Total Amount Of Transactions In AED Local can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtOutPurpsOfTransInternat.text]==YES)
    {
        [CommonUtils showMessage:@"Outward Purpose Of Transactions International can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtOutPurpsOfTransLocal.text]==YES)
    {
        [CommonUtils showMessage:@"Outward Purpose Of Transactions Local can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    
    if([CommonUtils checkEmptyString:txtInNoOfTransInaMonthInternat.text]==YES)
    {
        [CommonUtils showMessage:@"Inward No Of Transactions In A Month International can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtInNoOfTransInaMonthLocal.text]==YES)
    {
        [CommonUtils showMessage:@"Inward No Of Transactions In A Month Local can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtInTotAmntOfTransAEDInternat.text]==YES)
    {
        [CommonUtils showMessage:@"Inward Total Amount Of Transactions In AED International can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtInTotAmntOfTransAEDLocal.text]==YES)
    {
        [CommonUtils showMessage:@"Inward Total Amount Of Transactions In AED Local can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtInPurpsOfTransInternat.text]==YES)
    {
        [CommonUtils showMessage:@"Inward Purpose Of Transactions International can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtInPurpsOfTransLocal.text]==YES)
    {
        [CommonUtils showMessage:@"Inward Purpose Of Transactions Local can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtInMaxsingAmtInwardremetns.text]==YES)
    {
        [CommonUtils showMessage:@"Maximum Single Amount Of Inward Remittances can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtInMaxsingAmtOutwardremetns.text]==YES)
    {
        [CommonUtils showMessage:@"Maximum Single Amount Of OutWard Remittances can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtInIntrnlRemitInwardremetns.text]==YES)
    {
        [CommonUtils showMessage:@"International Remittances 3 Major Countries Inward can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtInIntrnlRemiOutwardremetns.text]==YES)
    {
        [CommonUtils showMessage:@"International Remittances 3 Major Countries Outward can't be blank":self];
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
    
    
    
    
    NSLog(@"action mode in KYC Transaction 2 %@",actionMode);
    
    
    @try{
        
        
        //            if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
        //            {
        //                jsonDictionary= @{@"refNo":self.refNo};
        //            }
        //            else
        //            {
        
        
        NSLog(@"RefNo %@",self.refNo);
        
        
        
        //-------
        
        jsonDictionary= @{
                          @"refNo":emptyStringIfNil(self.refNo),
                          @"outNoOfTransMonthInternational":emptyStringIfNil(self.txtOutNoOfTransInaMonthInternat.text),
                          @"outNoOfTransInMntLocal":emptyStringIfNil(self.txtOutNoOfTransInaMonthLocal.text),
                          @"outTotalAmtTransAEDInternational":emptyStringIfNil(self.txtOutTotAmntOfTransAEDInternat.text),
                          @"outTotalAmtTransAEDLocal":emptyStringIfNil(self.txtOutTotAmntOfTransAEDLocal.text),
                          @"outPurposeTransInternational":emptyStringIfNil(self.txtOutPurpsOfTransInternat.text),
                          @"outPurposeTransLocal":emptyStringIfNil(self.txtOutPurpsOfTransLocal.text),
                          @"inNoOfTransMonthInternational":emptyStringIfNil(self.txtInNoOfTransInaMonthInternat.text),
                          @"inNoOfTransMonthLocal":emptyStringIfNil(self.txtInNoOfTransInaMonthLocal.text),
                          @"inTotalAmtTransAEDInternational":emptyStringIfNil(self.txtInTotAmntOfTransAEDInternat.text),
                          @"inTotlAmtTransAEDLocal":emptyStringIfNil(self.txtInTotAmntOfTransAEDLocal.text),
                          @"inPurposeTransInternational":emptyStringIfNil(self.txtInPurpsOfTransInternat.text),
                          @"inPurposeTransLocal":emptyStringIfNil(self.txtInPurpsOfTransLocal.text),
                          @"maxSingleAmtInward":emptyStringIfNil(self.txtInMaxsingAmtInwardremetns.text),
                          @"maxSingleAmtOutward":emptyStringIfNil(self.txtInMaxsingAmtOutwardremetns.text),
                          @"internationalRem3MjrContriesIn":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtInIntrnlRemitInwardremetns.tag]]),
                          @"internationalRem3MjrContriesOut":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtInIntrnlRemiOutwardremetns.tag]]),
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
        //            }
   
//        if([actionMode isEqualToString:@"UPDATE"])// && [viewMode isEqualToString:@"N"])
//        {
        
            newData=[CommonUtils connectHost :@"updateKYCTransaction2" :jsonDictionary:self];
            [self parseResponse:newData:@"updateKYCTransaction2":@"kycDetailsWrapper"];
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
        
        
       

        
        KYCEDDViewController *kycEDDViewController = [[KYCEDDViewController alloc]initWithNibName:nil bundle:nil];
        //kycEDDViewController.userid=self.userid;
        //kycEDDViewController.sessionid=self.sessionid;
        kycEDDViewController.actionMode=self.actionMode;
        kycEDDViewController.recordStatus=self.recordStatus;
        //identificationViewController.viewMode=self.viewMode;
        kycEDDViewController.refNo=self.refNo;
        kycEDDViewController.existingCustomerFlag=self.existingCustomerFlag;
        kycEDDViewController.menuName=self.menuName;
        
        [self.navigationController pushViewController:kycEDDViewController animated:YES];
        
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
        
        NSData *newData=[CommonUtils connectHost :@"fetchKYCTransaction2" :jsonDictionary:self];
        [self parseResponse:newData:@"fetchKYCTransaction2":@"kycDetailsWrapper"];
        
        
        
        jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo)};
        newData=[CommonUtils connectHost :@"fetchPathStatus" :jsonDictionary:self];
        [self parseResponsePath:newData:@"fetchPathStatus":@"pathStatusWrapper"];

        
        //}
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in KYC Transaction2 viewData code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in KYC Transaction2 viewData Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
}

-(void) loadData {
    
    
    @try{
        
        
        kycData = [kycArray objectAtIndex:0];
        
        
        txtOutNoOfTransInaMonthInternat.text=emptyStringIfNil(kycData.outNoOfTransMonthInternational);
        txtOutNoOfTransInaMonthLocal.text=emptyStringIfNil(kycData.outNoOfTransInMntLocal);
        txtOutTotAmntOfTransAEDInternat.text=emptyStringIfNil(kycData.outTotalAmtTransAEDInternational);
        txtOutTotAmntOfTransAEDLocal.text=emptyStringIfNil(kycData.outTotalAmtTransAEDLocal);
        txtOutPurpsOfTransInternat.text=emptyStringIfNil(kycData.outPurposeTransInternational);
        txtOutPurpsOfTransLocal.text=emptyStringIfNil(kycData.outPurposeTransLocal);
        txtInNoOfTransInaMonthInternat.text=emptyStringIfNil(kycData.inNoOfTransMonthInternational);
        txtInNoOfTransInaMonthLocal.text=emptyStringIfNil(kycData.inNoOfTransMonthLocal);
        txtInTotAmntOfTransAEDInternat.text=emptyStringIfNil(kycData.inTotalAmtTransAEDInternational);
        txtInTotAmntOfTransAEDLocal.text=emptyStringIfNil(kycData.inTotlAmtTransAEDLocal);
        txtInPurpsOfTransInternat.text=emptyStringIfNil(kycData.inPurposeTransInternational);
        txtInPurpsOfTransLocal.text=emptyStringIfNil(kycData.inPurposeTransLocal);
        txtInMaxsingAmtInwardremetns.text=emptyStringIfNil(kycData.maxSingleAmtInward);
        txtInMaxsingAmtOutwardremetns.text=emptyStringIfNil(kycData.maxSingleAmtOutward);
        txtInIntrnlRemitInwardremetns.text=emptyStringIfNil(kycData.internationalRem3MjrContriesInValue);
        txtInIntrnlRemiOutwardremetns.text=emptyStringIfNil(kycData.internationalRem3MjrContriesOutValue);
        
        
        [popoverCodeValue setObject:emptyStringIfNil(self.kycData.internationalRem3MjrContriesIn) forKey:[NSString stringWithFormat:@"%d", self.txtInIntrnlRemitInwardremetns.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.kycData.internationalRem3MjrContriesOut) forKey:[NSString stringWithFormat:@"%d", self.txtInIntrnlRemiOutwardremetns.tag]];
        
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

