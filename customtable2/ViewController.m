//
//  ViewController.m
//  customtable2
//
//  Created by Mahendra on 23/01/14.
//  Copyright (c) 2014 Mahendra. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "SWCellScrollView.h"


@interface ViewController ()
{
    int isok;
    UIViewController *controller;
    UINavigationController *navi;
    UIView *popmenu;
    UITableView *table;
    int selectedcell;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    selectedcell = -1;
	// Do any additional setup after loading the view, typically from a nib.
    popmenu = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 570)];
    popmenu.backgroundColor = [UIColor yellowColor];
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 570)];
    
    table.dataSource = self;
    table.delegate = self;
    [self.view addSubview:table];
    isok = 0;
    controller = [[UIViewController alloc] init];
    [self.view addSubview:popmenu];
    
}
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma  mark - uitableview delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;    //count number of row from counting array hear cataGorry is An Array
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:MyIdentifier];
    }
    
    
    // Here we use the provided setImageWithURL: method to load the web image
    // Ensure you use a placeholder image otherwise cells will be initialized with no image
    SWCellScrollView *cellScrollView = [[SWCellScrollView alloc]initWithFrame:CGRectMake(0, 0, 240, 100)];
    cellScrollView.delegate = self;
    cellScrollView.showsHorizontalScrollIndicator = NO;
    cellScrollView.showsVerticalScrollIndicator = NO;
    cellScrollView.scrollsToTop = NO;
    cellScrollView.scrollEnabled = NO;
    
    [cellScrollView setBounces:NO];
    
    [cellScrollView setContentSize:CGSizeMake(480, 100)];
    
    cellScrollView.backgroundColor = [UIColor whiteColor];
    
    UIView *content = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 480, 100)];
    content.backgroundColor = [UIColor grayColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 15, 200, 30)];
    label.text = @"Furniture- $113.54";
    
    UITextView *desc = [[UITextView alloc] initWithFrame:CGRectMake(5, 45, 200, 40)];
   
    desc.text = @"ACME 00632 Arcadia Recliner, Oakwood Choclate Microfiber";
    desc.editable = NO;
    desc.backgroundColor = [UIColor clearColor];
    
    [content addSubview:label];
    [content addSubview:desc];
    
    UIView *buttonview = [[UIView alloc] initWithFrame:CGRectMake(241, 0, 240, 100)];
    
    buttonview.backgroundColor = [UIColor clearColor];
    
    UIButton *sold = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [sold setTitle:@"sold" forState:UIControlStateNormal];
    sold.frame = CGRectMake(0, 30, 50, 30);
    [buttonview addSubview:sold];
    [content addSubview:buttonview];
    
    
    
    
    [cellScrollView addSubview:content];
    
    
    [cell.subview addSubview:cellScrollView];
    
    cell.thumbnail.image = [UIImage imageNamed:@"img_home.png"];
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UISwipeGestureRecognizer* gestureR;
    gestureR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipFromwithIndex:)];
    gestureR.direction = UISwipeGestureRecognizerDirectionLeft;
    [cell addGestureRecognizer:gestureR];
    return cell;
}
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *button = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    button.backgroundColor = [UIColor blackColor];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(10,0,50 ,30);
    [button1 setTitle:@"Button" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(buttonclicked) forControlEvents:UIControlEventTouchDown];
    
    [button addSubview:button1];
    return button;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cell selected");
    /* if (indexPath.row == selectedcell) {
     CustomCell *cell = (CustomCell*)[table cellForRowAtIndexPath:indexPath];
     UIView *sub = [cell subview];
     
     NSArray *subviews = [sub subviews];
     for (UIView *subview in subviews)
     {
     // NSLog(@"subview is %@",subview);
     
     }
     SWCellScrollView *scroll = [subviews objectAtIndex:0];
     scroll.contentOffset = CGPointMake(0, 0);
     }
     else
     {
     int k = [tableView numberOfRowsInSection:0];
     for (int i =0; i<k; i++) {
     NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:0];
     CustomCell *cell = (CustomCell*)[table cellForRowAtIndexPath:indexPath];
     UIView *sub = [cell subview];
     
     NSArray *subviews = [sub subviews];
     SWCellScrollView *scroll = [subviews objectAtIndex:0];
     scroll.contentOffset = CGPointMake(0, 0);
     }
     }
     
     */
    int k = [tableView numberOfRowsInSection:0];
    for (int i =0; i<k; i++) {
        NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:0];
        CustomCell *cell = (CustomCell*)[table cellForRowAtIndexPath:index];
        UIView *sub = [cell subview];
        
        NSArray *subviews = [sub subviews];
        SWCellScrollView *scroll = [subviews objectAtIndex:0];
        scroll.contentOffset = CGPointMake(0, 0);
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}




-(void)handleSwipFromwithIndex:(id)sender
{
    CGPoint location = [sender locationInView:table];
    NSIndexPath *swipedIndexPath = [table indexPathForRowAtPoint:location];
    selectedcell = swipedIndexPath.row;
    
   // NSIndexPath *index = [NSIndexPath indexPathForRow:selectedcell inSection:0];
    CustomCell *cell = (CustomCell*)[table cellForRowAtIndexPath:swipedIndexPath];
    UIView *sub = [cell subview];
    
    NSArray *subviews = [sub subviews];
    for (UIView *subview in subviews)
    {
       // NSLog(@"subview is %@",subview);
    
    }
    SWCellScrollView *scroll = [subviews objectAtIndex:0];
    [UIView animateWithDuration:1.0 animations:^{
        scroll.contentOffset = CGPointMake(240, 0);
    }];
    
    
    //NSLog(@"sender is%@",sender);
   
   // NSLog(@"the index is %d",swipedIndexPath.row);
    
}

-(void)buttonclicked
{
    if (isok == 0) {
        /*
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
       // [UIView setAnimationCurve:nil];
      popmenu.frame = CGRectMake(0,0,200,570);
        table.frame = CGRectMake(200, 0, 120, 570);
        [UIView commitAnimations];
        
         */
        [UIView animateWithDuration:1.0 animations:^{
            //Move frame or transform view
            popmenu.frame = CGRectMake(0,0,200,570);
            table.frame = CGRectMake(200, 0, 120, 570);
        }];
        isok = 1;
        popmenu.backgroundColor = [UIColor grayColor];
    }
    else
    {
        //[UIView beginAnimations:nil context:NULL];
        //[UIView setAnimationDuration:1.0];
        //[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        
       // [UIView commitAnimations];
        isok = 0;
        [UIView animateWithDuration:1.0 animations:^{
            //Move frame or transform view
            popmenu.frame = CGRectMake(0,0,1,570);
            table.frame = CGRectMake(0, 0, 320, 570);
        }];
    }
    
    
    
}







@end
