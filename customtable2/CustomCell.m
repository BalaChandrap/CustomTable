//
//  CustomCell.m
//  VimeoClient
//
//  Created by Mahendra on 29/08/13.
//  Copyright (c) 2013 Mahendra. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize thumbnail,subview;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        thumbnail = [[UIImageView alloc]init];
        thumbnail = [[UIImageView alloc]init];
        thumbnail.layer.shadowColor = [UIColor colorWithRed:119.0/255.0 green:119.0/255.0 blue:119.0/255.0 alpha:1.0f].CGColor;
        thumbnail.layer.shadowOffset = CGSizeMake(2, 1);
        thumbnail.layer.shadowOpacity = 0.7;
        thumbnail.layer.shadowRadius = 3.0;
        thumbnail.clipsToBounds = NO;
        thumbnail.layer.shouldRasterize = YES;
       
        subview = [[UIView alloc] init];
        
        [self.contentView addSubview:thumbnail];
        [self.contentView addSubview:subview];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGRect frame;
    
    frame= CGRectMake(boundsX+10 ,15, 70, 70);
    thumbnail.frame = frame;
    
    frame = CGRectMake(boundsX+90, 0, 230,100);
    subview.frame = frame;
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
