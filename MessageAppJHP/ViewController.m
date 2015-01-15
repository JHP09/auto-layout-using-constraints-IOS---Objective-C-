//
//  ViewController.m
//  MessageAppJHP
//
//  Created by Jorge Honorat on 1/9/15.
//  Copyright (c) 2015 Jorge Honorat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

@synthesize text=_text;
@synthesize collectionView = _collectionView;
@synthesize titleLabel = _titleLabel;
@synthesize button = _button;
@synthesize headerView = _headerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _headerView = [UIView autolayoutView];
    _headerView.backgroundColor = [UIColor lightTextColor];
    
    [self.view addSubview:_headerView];
    [self setTextField];
    [_headerView addSubview:_text];
    [self setButton];
    [_headerView addSubview:_button];
    [self setConfigiration];
    [self setCollectionview];
    [self.view  addSubview:_collectionView];

}

- (void) setConfigiration {

    NSDictionary *views = NSDictionaryOfVariableBindings(_headerView,_button,_text);
    NSDictionary *metrics = @{@"textEdge":@10.0,@"padding":@300.0};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_headerView]|" options:0 metrics:metrics views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_headerView]" options:0 metrics:metrics views:views]];
    
    [_headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-padding-[_text]-[_button]|" options:NSLayoutFormatAlignAllLeft metrics:metrics views:views]];
    
    _headerView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    CGRect newFrame = _headerView.frame;
    
    newFrame.size.width = 100;
    newFrame.size.height = 100;
    [_headerView setFrame:newFrame];
    
}

- (void)setTextField {
    
    _text = [[UITextField  alloc] initWithFrame:
             CGRectMake(20, 20, 100, 5)];
    _text.borderStyle = UITextBorderStyleRoundedRect;
    _text.contentVerticalAlignment =
    UIControlContentVerticalAlignmentCenter;
    [_text setFont:[UIFont boldSystemFontOfSize:12]];
    _text.placeholder = @"Type a message...";
    _text.translatesAutoresizingMaskIntoConstraints = NO;
    
}

- (void) setButton {
    
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button.translatesAutoresizingMaskIntoConstraints = NO;
    [_button setTitle:@"Send" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void) setCollectionview {

    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    _collectionView=[[UICollectionView alloc] initWithFrame:_headerView.frame collectionViewLayout:layout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_collectionView setBackgroundColor:[UIColor lightTextColor]];
    [_collectionView setHidden:YES];
    _titleLabel.text = @"";
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 1;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
  
    cell.backgroundColor=[UIColor whiteColor];
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 30, 100, 60)];
    _titleLabel.tag = 200;
    [cell.contentView addSubview:_titleLabel];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(150, 20);
}


-(void)btnClicked {

    if(_text.text == (NSString*) [NSNull null] || _text.text.length == 0 || _text.text.length > 14) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test Message"
                                                        message:@"Text is too long, try again."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    } else {
        _titleLabel.text = _text.text;
        _text.text = @"";
        [_collectionView setHidden:NO];
    }
}

@end
