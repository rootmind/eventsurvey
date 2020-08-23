//
//  MasterViewController.m
//  Onboard
//
//  Created by Sai Kiran Gandham on 8/4/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MasterViewController.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "LoginViewController.h"
//#import "PersonalViewController.h"
#import "SideBarViewController.h"
#import "QueueViewController.h"
//#import "SearchViewController.h"
//#import "ImageUploadViewController.h"
//#import "KYCViewController.h"
//#import "ImagePageViewController.h"
//#import "EnquiryViewController.h"
//#import "AutoLoansViewController.h"
//#import "PersonalLoanViewController.h"
//#import "RoDViewController.h"
//#import "CreditCardViewController.h"
#import "DashboardViewController.h"

#import "PasswordViewController.h"
//#import "CalculatorViewController.h"




@interface MasterViewController ()


@end

@implementation MasterViewController


//@synthesize userid;
//@synthesize sessionid;
//@synthesize activityIndicator;

@synthesize menuId;
@synthesize menuName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor=[UIColor controllerBGColor];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor whiteColor];
    
    //self.extendedLayoutIncludesOpaqueBars = YES;
    
    
    
    
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
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    
    tableView.sectionHeaderHeight = 0.0;
    tableView.sectionFooterHeight = 0.0;
    tableView.rowHeight=UITableViewAutomaticDimension;
    
    
    tableView.separatorInset=UIEdgeInsetsZero;
    //tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    
    // add to canvas
    tableView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:tableView];
    
    
    
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
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
    
    
//    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
//    UICollectionView *collectionView=[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
//    [collectionView setDataSource:self];
//    [collectionView setDelegate:self];
//    
//    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
//    [collectionView setBackgroundColor:[UIColor lightGrayColor]];
//    
//    [self.view addSubview:collectionView];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:collectionView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:collectionView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:collectionView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:collectionView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];

    
    
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 20;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    
    
    
        return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //GFloat result;
    //switch ([indexPath row])
    //{
    //    case 0: {
    //        result = kUIRowHeight;
    //        break; }
    //    case 1: {
    //        result = kUIRowLabelHeight;
    //        break; }
    //}
    return 60;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section ==0)
    {
        return 10.00f;
    }
    return 10.0f;
}

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
    
    
    cell.backgroundColor=[UIColor whiteColor];
    cell.layer.borderWidth=0.1f;
    cell.layer.cornerRadius=10.0f;
    //cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.layer.borderColor=[UIColor borderColor].CGColor;
    cell.layer.shadowRadius=3.0f;
    cell.layer.shadowOffset = CGSizeMake(0, 3);
    cell.layer.shadowColor = [UIColor blackColor].CGColor;
    cell.layer.shadowOpacity = 0.8;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];//]WithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        cell.accessoryType = UITableViewCellAccessoryNone;
        //cell.selectionStyle=UITableViewCellSelectionStyleBlue;
        
        UIView *bgColorView = [[UIView alloc] init];
        bgColorView.backgroundColor = [UIColor lightBluishColor];
        bgColorView.layer.masksToBounds = YES;
        cell.selectedBackgroundView = bgColorView;
 
        
    }

    
    
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
//    if(indexPath.section==0)
//    {
//        cell.imageView.image=[[UIImage imageNamed:@"user.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
//        [cell.imageView setTintColor:[UIColor persianblueColor]];
//        cell.textLabel.text=@"Login";
//        cell.textLabel.textColor=[UIColor persianblueColor];
//    }
    
    
    if(indexPath.section==0)
    {
        cell.imageView.image=[[UIImage imageNamed:@"computer-imac.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor moderategambogeColor]];
        cell.textLabel.text=@"Dashboard";
        cell.textLabel.textColor=[UIColor moderategambogeColor];
        
    }
    if(indexPath.section==1)
    {
        cell.imageView.image=[[UIImage imageNamed:@"Search.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor moderategambogeColor]];
        cell.textLabel.text=@"Search";
        cell.textLabel.textColor=[UIColor moderategambogeColor];
      
    }
    if(indexPath.section==2)
    {
        cell.imageView.image=[[UIImage imageNamed:@"briefcase.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor vividpurpleColor]];
        cell.textLabel.text=@"Savings Account";
        cell.textLabel.textColor=[UIColor vividpurpleColor];

    }
    
    if(indexPath.section==3)
    {
        cell.imageView.image=[[UIImage imageNamed:@"write.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor deepseagreenColor]];
        cell.textLabel.text=@"Current Account";
        cell.textLabel.textColor=[UIColor deepseagreenColor];
        
    }
    if(indexPath.section==4)
    {
        cell.imageView.image=[[UIImage imageNamed:@"briefcase.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor orchidColor]];
        cell.textLabel.text=@"Fixed Deposit";
        cell.textLabel.textColor=[UIColor orchidColor];
    }
    if(indexPath.section==5)
    {
        cell.imageView.image=[[UIImage imageNamed:@"fountain-pen.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor deepvermilionColor]];
        cell.textLabel.text=@"Personal Loan";
        cell.textLabel.textColor=[UIColor deepvermilionColor];
    }
    if(indexPath.section==6)
    {
        cell.imageView.image=[[UIImage imageNamed:@"clock.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor darklimegreenColor]];
        cell.textLabel.text=@"Auto Loan";
        cell.textLabel.textColor=[UIColor darklimegreenColor];
    }
    if(indexPath.section==7)
    {
        cell.imageView.image=[[UIImage imageNamed:@"clock.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor darklimegreenColor]];
        cell.textLabel.text=@"Revolving Overdraft";
        cell.textLabel.textColor=[UIColor darklimegreenColor];
    }
    if(indexPath.section==8)
    {
        
        cell.imageView.image=[[UIImage imageNamed:@"fountain-pen.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor vividredColor]];
        cell.textLabel.text=@"Credit Card";
        cell.textLabel.textColor=[UIColor vividredColor];
        
    }
    
 
    if(indexPath.section==9)
    {
        cell.imageView.image=[[UIImage imageNamed:@"script.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor moderateroseColor]];
        cell.textLabel.text=@"Queue";
        cell.textLabel.textColor=[UIColor moderateroseColor];
        
    }
    if(indexPath.section==10)
    {
        cell.imageView.image=[[UIImage imageNamed:@"stamp.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor deeparcticblueColor]];
        cell.textLabel.text=@"Approver";
        cell.textLabel.textColor=[UIColor deeparcticblueColor];
    }
    if(indexPath.section==11)
    {
        cell.imageView.image=[[UIImage imageNamed:@"camera-photo.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor luminousvividtangeloColor]];
        cell.textLabel.text=@"Image Upload";
        cell.textLabel.textColor=[UIColor luminousvividtangeloColor];
    }
    if(indexPath.section==12)
    {
        cell.imageView.image=[[UIImage imageNamed:@"picture-frame.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor darklimegreenColor]];
        cell.textLabel.text=@"Image View";
        cell.textLabel.textColor=[UIColor darklimegreenColor];
    }
    
//    if(indexPath.section==10)
//    {
//        cell.imageView.image=[[UIImage imageNamed:@"write.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        [cell.imageView setTintColor:[UIColor deepvermilionColor]];
//        cell.textLabel.text=@"KYC Details";
//        cell.textLabel.textColor=[UIColor deepvermilionColor];
//    }
    if(indexPath.section==13)
    {
        
        cell.imageView.image=[[UIImage imageNamed:@"Search.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor vividredColor]];
        cell.textLabel.text=@"Enquiry";
        cell.textLabel.textColor=[UIColor vividredColor];
        
    }
 
    if(indexPath.section==14)
    {
        cell.imageView.image=[[UIImage imageNamed:@"clock.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor darklimegreenColor]];
        cell.textLabel.text=@"Signature";
        cell.textLabel.textColor=[UIColor darklimegreenColor];
    }
    
    if(indexPath.section==15)
    {
        cell.imageView.image=[[UIImage imageNamed:@"briefcase.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor darklimegreenColor]];
        cell.textLabel.text=@"OCR";
        cell.textLabel.textColor=[UIColor moderateroseColor];
    }
    if(indexPath.section==16)
    {
        cell.imageView.image=[[UIImage imageNamed:@"script.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor darklimegreenColor]];
        cell.textLabel.text=@"OCR View";
        cell.textLabel.textColor=[UIColor moderategambogeColor];
    }
    if(indexPath.section==17)
    {
        
        cell.imageView.image=[[UIImage imageNamed:@"picture-frame.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor vividredColor]];
        cell.textLabel.text=@"Calculator";
        cell.textLabel.textColor=[UIColor vividredColor];
        
    }

    if(indexPath.section==18)
    {
        
        cell.imageView.image=[[UIImage imageNamed:@"lock-locked.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor vividredColor]];
        cell.textLabel.text=@"Change Password";
        cell.textLabel.textColor=[UIColor vividredColor];
        
    }

    if(indexPath.section==19)
    {

        cell.imageView.image=[[UIImage imageNamed:@"lock-locked.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [cell.imageView setTintColor:[UIColor vividredColor]];
        cell.textLabel.text=@"Logout";
        cell.textLabel.textColor=[UIColor vividredColor];
        
    }
   

    return cell;
}


// Implement something like this in your UITableViewController subclass
// or in the delegate object you use to manage your table.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.splitViewController viewWillDisappear:YES];
    NSMutableArray *viewControllerArray=[[NSMutableArray alloc] initWithArray:[[self.splitViewController.viewControllers objectAtIndex:1] viewControllers]];
    [viewControllerArray removeLastObject];
    
    NSLog(@"session id %@",[[NSUserDefaults standardUserDefaults] stringForKey:@"sessionid"]);
    
    if(indexPath.section==0)
    {
        menuId=@"DASHBOARD";
        
    }
    else if(indexPath.section==1)
    {
         menuId=@"SEARCH";
       
    }
    else if(indexPath.section==2)
    {
        menuId=@"SA";
        menuName=@"Savings Account";
    }
    else if(indexPath.section==3)
    {
        menuId=@"CA";
        menuName=@"Current Account";
    }
    else if(indexPath.section==4)
    {
        menuId=@"FD";
        menuName=@"Fixed Deposit";
    }
    else if(indexPath.section==5)
    {
        menuId=@"PL";
        menuName=@"Personal Loan";
    }
    else if(indexPath.section==6)
    {
        menuId=@"AL";
        menuName=@"Auto Loan";
    }
    else if(indexPath.section==7)
    {
        menuId=@"RO";
        menuName=@"Revolving Overdraft";
    }
    else if(indexPath.section==8)
    {
        menuId=@"CC";
        menuName=@"Credit Card";
    }
    else if(indexPath.section==9)
    {
        menuId=@"QUEUEMAKER";
    }
    else if(indexPath.section==10)
    {
        menuId=@"QUEUEAPPROVER";
    }
    else if(indexPath.section==11)
    {
        menuId=@"IMAGEUPLOAD";
    }
    else if(indexPath.section==12)
    {
        menuId=@"IMAGEVIEW";
    }
//    else if(indexPath.section==10)
//    {
//        menuId=@"KYC";
//    }
    else if(indexPath.section==13)
    {
        menuId=@"ENQUIRY";
    }

    else if(indexPath.section==14)
    {
        menuId=@"SIGN";
    }
    else if(indexPath.section==15)
    {
        menuId=@"OCR";
    }
    else if(indexPath.section==16)
    {
        menuId=@"OCRVIEW";
    }
    else if(indexPath.section==17)
    {
        menuId=@"CALC";
    }
    else if(indexPath.section==18)
    {
        menuId=@"CHGPSWD";
    }
    else if(indexPath.section==19)
    {
        menuId=@"LOGOUT";
    }
    


    UITabBarController *detailTabBar = (UITabBarController *) self.splitViewController.viewControllers[1];
    UINavigationController *detailNavigationController = (UINavigationController *)detailTabBar.selectedViewController;
    
    
    if([[[NSUserDefaults standardUserDefaults] stringForKey:@"sessionid"] isEqualToString:@""])

    {
        


        
        
        //LoginViewController *loginViewController = [[LoginViewController alloc]initWithNibName:nil bundle:nil];
        //loginViewController.menuId=menuId;
        //[detailNavigationController pushViewController:loginViewController animated:YES];
        
        
        
        //[viewControllerArray addObject:loginViewController];
        //self.splitViewController.delegate =loginViewController;
        //[[self.splitViewController.viewControllers objectAtIndex:1] setViewControllers:viewControllerArray animated:NO];
        //[self.splitViewController viewWillAppear:YES];
        
    
    }
    else
    {
    


        
//        if(indexPath.section==0)
//        {
//        
//            LoginViewController *loginViewController = [[LoginViewController alloc]initWithNibName:nil bundle:nil];
//            loginViewController.menuId=menuId;
//            [detailNavigationController pushViewController:loginViewController animated:YES];
////            [viewControllerArray addObject:loginViewController];
////            self.splitViewController.delegate = loginViewController;
////            [[self.splitViewController.viewControllers objectAtIndex:1] setViewControllers:viewControllerArray animated:NO];
////            [self.splitViewController viewWillAppear:YES];
//
//        }
        
        if(indexPath.section==0)
        {
            
            DashboardViewController *dashboardViewController = [[DashboardViewController alloc]initWithNibName:nil bundle:nil];
            [detailNavigationController pushViewController:dashboardViewController animated:YES];

            
        }
        
//        if(indexPath.section==1)
//        {
//          
// //               SearchViewController *searchViewController = [[SearchViewController alloc]initWithNibName:nil bundle:nil];
////                [detailNavigationController pushViewController:searchViewController animated:YES];
////                [viewControllerArray addObject:searchViewController];
////                self.splitViewController.delegate = searchViewController;
////                [[self.splitViewController.viewControllers objectAtIndex:1] setViewControllers:viewControllerArray animated:NO];
////                [self.splitViewController viewWillAppear:YES];
//            
//            
//            
//        }
//        
//        if(indexPath.section==2)
//        {
//            
//            if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
//            {
//
////                PersonalViewController *personalViewController = [[PersonalViewController alloc]initWithNibName:nil bundle:nil];
////                personalViewController.actionMode=@"NEW";
////                //personalViewController.viewMode=@"N";
////                personalViewController.accountType=@"SA"; //Savings Account
////                personalViewController.recordStatus=@"INPROGRESS";
////                personalViewController.menuName=menuName;
////                [detailNavigationController pushViewController:personalViewController animated:YES];
////                [viewControllerArray addObject:personalViewController];
////                self.splitViewController.delegate = personalViewController;
////                [[self.splitViewController.viewControllers objectAtIndex:1] setViewControllers:viewControllerArray animated:NO];
////                [self.splitViewController viewWillAppear:YES];
//                
//                
//            }
//            
//        }
//        if(indexPath.section==3)
//        {
//            if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
//            {
//
//                PersonalViewController *personalViewController = [[PersonalViewController alloc]initWithNibName:nil bundle:nil];
//                personalViewController.actionMode=@"NEW";
//                //personalViewController.viewMode=@"N";
//                personalViewController.accountType=@"CA"; //Current Account
//                personalViewController.recordStatus=@"INPROGRESS";
//                personalViewController.menuName=menuName;
//                [detailNavigationController pushViewController:personalViewController animated:YES];
////                [viewControllerArray addObject:personalViewController];
////                self.splitViewController.delegate = personalViewController;
////                [[self.splitViewController.viewControllers objectAtIndex:1] setViewControllers:viewControllerArray animated:NO];
////                [self.splitViewController viewWillAppear:YES];
//                
//                
//            }
//            
//        }
//        if(indexPath.section==4)
//        {
//            if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
//            {
//                
//                
//                
//                PersonalViewController *personalViewController = [[PersonalViewController alloc]initWithNibName:nil bundle:nil];
//                personalViewController.actionMode=@"NEW";
//                personalViewController.accountType=@"FD"; //Deposit Account
//                personalViewController.recordStatus=@"INPROGRESS";
//                personalViewController.menuName=menuName;
//                [detailNavigationController pushViewController:personalViewController animated:YES];
//            }
//            
//        }
//        if(indexPath.section==5)
//        {
//            if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
//            {
//                
////                PersonalLoanViewController *personalLoanViewController = [[PersonalLoanViewController alloc]initWithNibName:nil bundle:nil];
////                personalLoanViewController.actionMode=@"NEW";
////                personalLoanViewController.accountType=@"PL"; //Personal Loan
////                personalLoanViewController.recordStatus=@"INPROGRESS";
////                [detailNavigationController pushViewController:personalLoanViewController animated:YES];
//                
//                
//                PersonalViewController *personalViewController = [[PersonalViewController alloc]initWithNibName:nil bundle:nil];
//                personalViewController.actionMode=@"NEW";
//                personalViewController.accountType=@"PL"; //Personal Loan Account
//                personalViewController.recordStatus=@"INPROGRESS";
//                personalViewController.menuName=menuName;
//                [detailNavigationController pushViewController:personalViewController animated:YES];
//            }
//            
//        }
//        if(indexPath.section==6)
//        {
//            if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
//            {
//                
////                AutoLoansViewController *autoLoansViewController = [[AutoLoansViewController alloc]initWithNibName:nil bundle:nil];
////                autoLoansViewController.actionMode=@"NEW";
////                autoLoansViewController.accountType=@"AL";
////                autoLoansViewController.recordStatus=@"INPROGRESS";
////                [detailNavigationController pushViewController:autoLoansViewController animated:YES];
//                
//                PersonalViewController *personalViewController = [[PersonalViewController alloc]initWithNibName:nil bundle:nil];
//                personalViewController.actionMode=@"NEW";
//                personalViewController.accountType=@"AL"; //Auto Loan Account
//                personalViewController.recordStatus=@"INPROGRESS";
//                personalViewController.menuName=menuName;
//                [detailNavigationController pushViewController:personalViewController animated:YES];
//            }
//            
//        }
//        
//        if(indexPath.section==7) //Revolving Overdraft
//        {
//            if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
//            {
////                
////                RoDViewController *rodViewController = [[RoDViewController alloc]initWithNibName:nil bundle:nil];
////                rodViewController.actionMode=@"NEW";
////                
////                [detailNavigationController pushViewController:rodViewController animated:YES];
////                //                [viewControllerArray addObject:personalViewController];
////                //                self.splitViewController.delegate = personalViewController;
////                //                [[self.splitViewController.viewControllers objectAtIndex:1] setViewControllers:viewControllerArray animated:NO];
////                //                [self.splitViewController viewWillAppear:YES];
//                
//                PersonalViewController *personalViewController = [[PersonalViewController alloc]initWithNibName:nil bundle:nil];
//                personalViewController.actionMode=@"NEW";
//                personalViewController.accountType=@"RO"; //Revolving Overdraft
//                personalViewController.recordStatus=@"INPROGRESS";
//                personalViewController.menuName=menuName;
//                [detailNavigationController pushViewController:personalViewController animated:YES];
//
//                
//            }
//            
//        }
//        
//        if(indexPath.section==8) //--CreditCard
//        {
//            if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
//            {
////                
////                CreditCardViewController *creditCardViewController = [[CreditCardViewController alloc]initWithNibName:nil bundle:nil];
////                
////                creditCardViewController.actionMode=@"NEW";
////                //creditCardViewController.accountType=@"SA";
////                
////                
////                [detailNavigationController pushViewController:creditCardViewController animated:YES];
//                
//                
//                PersonalViewController *personalViewController = [[PersonalViewController alloc]initWithNibName:nil bundle:nil];
//                personalViewController.actionMode=@"NEW";
//                personalViewController.accountType=@"CC"; //Credit Card
//                personalViewController.recordStatus=@"INPROGRESS";
//                personalViewController.menuName=menuName;
//                [detailNavigationController pushViewController:personalViewController animated:YES];
//                
//                
//            }
//            
//        }
        
        if(indexPath.section==9)
        {
            if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
            {
                QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
               // queueViewController.actionMode=@"UPDATE";
               // queueViewController.menuId=menuId;
                
                //queueViewController.viewMode=@"Y";
               // queueViewController.recordStatus=@"INPROGRESS";
                [detailNavigationController pushViewController:queueViewController animated:YES];
//                [viewControllerArray addObject:queueViewController];
//                self.splitViewController.delegate = queueViewController;
//                [[self.splitViewController.viewControllers objectAtIndex:1] setViewControllers:viewControllerArray animated:NO];
//                [self.splitViewController viewWillAppear:YES];
                
                
            }
            
        }
        if(indexPath.section==10)
        {
            
           if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"]) {
               
        
           
                QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
                //queueViewController.actionMode=@"UPDATE";
                //queueViewController.menuId=menuId;
               
                //queueViewController.viewMode=@"Y";
                //queueViewController.recordStatus=@"CREATE";
                [detailNavigationController pushViewController:queueViewController animated:YES];
               
//                [viewControllerArray addObject:queueViewController];
//                self.splitViewController.delegate = queueViewController;
//                [[self.splitViewController.viewControllers objectAtIndex:1] setViewControllers:viewControllerArray animated:NO];
//                [self.splitViewController viewWillAppear:YES];
               
        
            }
           else{
               [CommonUtils showMessage:@"You are not authorised to access this menu" :self];
           }
            
        }
        if(indexPath.section==11) //Image Upload
        {
            
            if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]) {
                
                
                QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
                //queueViewController.actionMode=@"UPDATE";
                //queueViewController.menuId=menuId;
               
                //queueViewController.recordStatus=@"INPROGRESS";
                [detailNavigationController pushViewController:queueViewController animated:YES];
                

                
            }

         
            
        }
        if(indexPath.section==12) //Image View
        {
            
            if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]) {
                
                
                QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
                //queueViewController.actionMode=@"UPDATE";
                //queueViewController.menuId=menuId;
                
                //queueViewController.recordStatus=@"INPROGRESS";
                [detailNavigationController pushViewController:queueViewController animated:YES];
                
                
            }
            
        }
//        if(indexPath.section==10) //KYC
//        {
//            if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
//            {
//                
//                KYCViewController *kycViewController = [[KYCViewController alloc]initWithNibName:nil bundle:nil];
//                kycViewController.actionMode=@"NEW";
//                
//                [detailNavigationController pushViewController:kycViewController animated:YES];
//                //                [viewControllerArray addObject:personalViewController];
//                //                self.splitViewController.delegate = personalViewController;
//                //                [[self.splitViewController.viewControllers objectAtIndex:1] setViewControllers:viewControllerArray animated:NO];
//                //                [self.splitViewController viewWillAppear:YES];
//                
//                
//            }
//            
//        }
        if(indexPath.section==13) //Enquiry
        {

                QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
//                queueViewController.actionMode=@"ENQUIRY";
//                queueViewController.menuId=menuId;
//                queueViewController.recordStatus=@"";
                [detailNavigationController pushViewController:queueViewController animated:YES];
                
                
//                EnquiryViewController *enquiryViewController = [[EnquiryViewController alloc]initWithNibName:nil bundle:nil];
//                enquiryViewController.actionMode=@"ENQUIRY";
//                enquiryViewController.menuId=menuId;
//                //enquiryViewController.recordStatus=@"";
//                [detailNavigationController pushViewController:enquiryViewController animated:YES];
          
        }
  

        if(indexPath.section==14) //Signature Upload
        {
            
            if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]) {
                
                
                QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
//                queueViewController.actionMode=@"UPDATE";
//                queueViewController.menuId=menuId;
//               
//                queueViewController.recordStatus=@"INPROGRESS";
                [detailNavigationController pushViewController:queueViewController animated:YES];
                
                
                
            }
            
            
            
        }
        if(indexPath.section==15) //OCR
        {
            
            if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]) {
                
                
                QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
//                queueViewController.actionMode=@"UPDATE";
//                queueViewController.menuId=menuId;
//                
//                queueViewController.recordStatus=@"INPROGRESS";
                [detailNavigationController pushViewController:queueViewController animated:YES];
                
                
                
            }
            
            
            
        }
        if(indexPath.section==16) //OCR VIEW
        {
            
            if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]) {
                
                
                QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
//                queueViewController.actionMode=@"UPDATE";
//                queueViewController.menuId=menuId;
//                
//                queueViewController.recordStatus=@"INPROGRESS";
                [detailNavigationController pushViewController:queueViewController animated:YES];
                
                
                
            }
            
            
            
        }
        if(indexPath.section==17)
        {
            
            if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]) {
                
                
//                CalculatorViewController  *calculatorViewController = [[CalculatorViewController alloc]initWithNibName:nil bundle:nil];
//                calculatorViewController.menuId=menuId;
//                
//                //passwordViewController.recordStatus=@"INPROGRESS";
//                [detailNavigationController pushViewController:calculatorViewController animated:YES];
//                
                
                
            }
            
            
            
        }
        
        if(indexPath.section==18) //change password
        {
            
            if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]) {
                
                
                PasswordViewController *passwordViewController = [[PasswordViewController alloc]initWithNibName:nil bundle:nil];
                //passwordViewController.actionMode=@"UPDATE";
                passwordViewController.menuId=menuId;
                
                //passwordViewController.recordStatus=@"INPROGRESS";
                [detailNavigationController pushViewController:passwordViewController animated:YES];
                
                
                
            }
            
            
            
        }
        if(indexPath.section==19)
        {
            
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"userid"];
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"sessionid"];
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"userGroup"];
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"lastLoginDate"];
            LoginViewController *loginViewController = [[LoginViewController alloc]initWithNibName:nil bundle:nil];
            //loginViewController.menuId=menuId;
            [detailNavigationController pushViewController:loginViewController animated:YES];
            [self.navigationItem setHidesBackButton:YES animated:YES];
            self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryHidden;
   
        }
       


        
    }
    
    
    
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    
    if(indexPath.section==0)
    {
    
        UILabel *lblCustomerName = [[UILabel alloc] init];//WithFrame:headerView.frame];
        lblCustomerName.textColor = [UIColor blackColor];
        //set the number of lines to contain a bigger text
        lblCustomerName.numberOfLines = 2;
        lblCustomerName.font = [UIFont italicSystemFontOfSize:12.0f];
        lblCustomerName.font = [UIFont boldSystemFontOfSize:14.0f];
        lblCustomerName.textAlignment =  NSTextAlignmentLeft;
        lblCustomerName.layer.borderColor = [UIColor blackColor].CGColor;
        lblCustomerName.layer.borderWidth = 1.0;
        lblCustomerName.text =[NSString stringWithFormat:@"%@",@"Savings Account"];
        lblCustomerName.translatesAutoresizingMaskIntoConstraints=NO;
        [cell.contentView addSubview:lblCustomerName];
        
        
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:0.9 constant:0]];

        [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeLeft multiplier:1.4 constant:0]];
        
    }
    
    
    cell.backgroundColor=[UIColor whiteColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);
}


-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
