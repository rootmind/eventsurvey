//
//  DetailViewController.m
//  Onboard
//
//  Created by Sai Kiran Gandham on 8/4/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DetailViewController.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"




@interface DetailViewController ()


@end

@implementation DetailViewController


#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self configureView];
    
    [self.navigationItem setHidesBackButton:NO animated:YES];
    
//    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryOverlay;
    [self.splitViewController.displayModeButtonItem action];
    
    self.view.backgroundColor=[UIColor controllerBGColor];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor whiteColor];
    
    
    self.navigationItem.title=@"Detail";
    
    
    
    
    UIView *headerView = [[UIView alloc] init];
        headerView.layer.borderWidth=1.0;
        headerView.layer.borderColor=[UIColor borderBlueColor].CGColor;
        headerView.layer.shadowRadius=10.0;
        headerView.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];//[UIColor whiteColor];
        headerView.layer.shadowOffset = CGSizeMake(0, 3);
        headerView.layer.shadowRadius = 10.0;
        headerView.layer.shadowColor = [UIColor blackColor].CGColor;
        headerView.layer.shadowOpacity = 0.8;
        headerView.layer.cornerRadius = 200;
        //headerView.layer.doubleSided=YES;
        headerView.translatesAutoresizingMaskIntoConstraints=NO;
        [self.view addSubview:headerView];

    
        //---header UIView
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.35 constant:0]];
    
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.35 constant:0]];
    
    

        UIImageView *imageView =[[UIImageView alloc] init];
        imageView.image=[[UIImage imageNamed:@"hand.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
//        imageView.contentMode=UIViewContentModeCenter;
//        imageView.layer.masksToBounds=YES;
//        [imageView.layer setBorderColor:[UIColor grayColor].CGColor];
//        [imageView.layer setBorderWidth:2.0f];
//        [imageView.layer setCornerRadius:15.0f];
//        [imageView.layer setShadowColor:[UIColor grayColor].CGColor];
        [imageView setTintColor:[UIColor luminousvividtangeloColor]];
        imageView.translatesAutoresizingMaskIntoConstraints=NO;
        [self.view addSubview:imageView];
    
    
        //---image UIView
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeHeight multiplier:0.45 constant:0]];
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeWidth multiplier:0.45 constant:0]];
        
//
//    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
//    //tableView.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    //tableView.frame = CGRectMake(30,200,270,300);
//    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];////[UIColor lightGrayColor];
//    tableView.layer.borderWidth=1.0f;
//    tableView.layer.borderColor=[UIColor whiteColor].CGColor;
//    tableView.layer.cornerRadius=15.0f;
//    //tableView.allowsSelection = NO;
//    tableView.alwaysBounceVertical = NO;
//    tableView.contentInset = UIEdgeInsetsMake(-70, 0, 0, 0);
//    
//    
//    tableView.sectionHeaderHeight = 0.0;
//    tableView.sectionFooterHeight = 0.0;
//    tableView.rowHeight=UITableViewAutomaticDimension;
//    
//    
//    tableView.separatorInset=UIEdgeInsetsZero;
//    //tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
//    
//    
//    // add to canvas
//    tableView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:tableView];
    
    
    
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
    
    
    
//    
//    //---header UIView
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
//    
    
}

-(void)addImageView{
  
    
    
//    UIImageView *imageView = [[UIImageView alloc]initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
//    imageView.tintColor = [UIColor redColor];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 10;
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    
    
    
    return nil;
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
        
        
        
        
        
    }
    
    //cell.textLabel.text=@"Detail View Controller";
    
    
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    return cell;
}


// Implement something like this in your UITableViewController subclass
// or in the delegate object you use to manage your table.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
    
}


//detailedView delegate methods
- (void)splitViewController:(UISplitViewController*)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem*)barButtonItem
       forPopoverController:(UIPopoverController*)pc
{
    [barButtonItem setTitle:@"your title"];
    
    
    
    self.navigationItem.leftBarButtonItem = barButtonItem;
}


- (void)splitViewController:(UISplitViewController*)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.navigationItem.leftBarButtonItem = nil;
}


-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end