//
//  CustomCell.h
//  VimeoClient
//
//  Created by Mahendra on 29/08/13.
//  Copyright (c) 2013 Mahendra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
{
    
    UIImageView *thumbnail;
    UIView *subview;
}
@property(nonatomic,retain)UIImageView *thumbnail;
@property(nonatomic,retain)UIView *subview;
@end
