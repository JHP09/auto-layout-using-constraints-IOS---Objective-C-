//
//  ViewController.h
//  MessageAppJHP
//
//  Created by Jorge Honorat on 1/9/15.
//  Copyright (c) 2015 Jorge Honorat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) IBOutlet UITextField *text;
@property (nonatomic, retain) IBOutlet UICollectionView *collectionView;
@property (nonatomic, retain) IBOutlet UIView *headerView;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UIButton *button;

@end

@interface UIView (Autolayout)
+(id)autolayoutView;
@end

@implementation UIView (Autolayout)
+(id)autolayoutView
{
    UIView *view = [self new];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}
@end

