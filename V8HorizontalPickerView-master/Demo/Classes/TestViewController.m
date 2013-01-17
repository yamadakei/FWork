    //
//  TestViewController.m
//  fStats
//
//  Created by Shawn Veader on 9/18/10.
//  Copyright 2010 V8 Labs, LLC. All rights reserved.
//

#import "TestViewController.h"


@implementation TestViewController

@synthesize pickerView;
@synthesize nextButton, reloadButton;

#pragma mark - iVars
NSMutableArray *titleArray;
int indexCount;

#pragma mark - Init/Dealloc
- (id)init {
	self = [super init];
	if (self) {
		titleArray = [[NSMutableArray arrayWithObjects:@"1.JPG", @"2.JPG", @"3.JPG", @"4.JPG", @"5.JPG", @"6.JPG", @"7.JPG", @"8.JPG", @"9.JPG", @"10.JPG", @"11.JPG", @"12.JPG", @"13.JPG", @"14.JPG", @"15.JPG", nil] retain];
		indexCount = 0;
	}
	return self;
}

- (void)dealloc {
	[pickerView   release];
	[titleArray   release];
	[nextButton   release];
	[reloadButton release];
	[super dealloc];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View Management Methods
- (void)viewDidLoad {
	[super viewDidLoad];

	self.view.backgroundColor = [UIColor blackColor];
	CGFloat margin = 0.0f;
	CGFloat width = (self.view.bounds.size.width - (margin * 2.0f));
	CGFloat pickerHeight = 240.0f;
	CGFloat x = margin;
	CGFloat y = 0.0f;
	CGFloat spacing = 50.0f;
	CGRect tmpFrame = CGRectMake(x, y, width, pickerHeight);

	pickerView = [[V8HorizontalPickerView alloc] initWithFrame:tmpFrame];
	pickerView.backgroundColor   = [UIColor clearColor];
	pickerView.delegate    = self;
	pickerView.dataSource  = self;
	pickerView.selectionPoint = CGPointMake(self.view.frame.size.width/2, 0);
    [self.view addSubview:pickerView];

	self.nextButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	y = y + tmpFrame.size.height + spacing;
	tmpFrame = CGRectMake(x, y, width, 50.0f);
	nextButton.frame = tmpFrame;
	[nextButton addTarget:self action:@selector(nextButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
	[nextButton	setTitle:@"Center Element 0" forState:UIControlStateNormal];
	nextButton.titleLabel.textColor = [UIColor blackColor];
	[self.view addSubview:nextButton];

	self.reloadButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	y = y + tmpFrame.size.height + spacing;
	tmpFrame = CGRectMake(x, y, width, 50.0f);
	reloadButton.frame = tmpFrame;
	[reloadButton addTarget:self action:@selector(reloadButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
	[reloadButton setTitle:@"Reload Data" forState:UIControlStateNormal];
	[self.view addSubview:reloadButton];
}

- (void)viewDidUnload {
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	self.pickerView = nil;
	self.nextButton = nil;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[pickerView scrollToElement:0 animated:NO];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
	CGFloat margin = 40.0f;
	CGFloat width = (self.view.bounds.size.width - (margin * 2.0f));
	CGFloat x = margin;
	CGFloat y = 0.0f;
	CGFloat height = 40.0f;
	CGFloat spacing = 25.0f;
	CGRect tmpFrame;
	if (fromInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
		fromInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		y = 150.0f;
		spacing = 25.0f;
		tmpFrame = CGRectMake(x, y, width, height);
	} else {
		y = 50.0f;
		spacing = 10.0f;
		tmpFrame = CGRectMake(x, y, width, height);
	}
	pickerView.frame = tmpFrame;
	
	y = y + tmpFrame.size.height + spacing;
	tmpFrame = nextButton.frame;
	tmpFrame.origin.y = y;
	nextButton.frame = tmpFrame;
	
	y = y + tmpFrame.size.height + spacing;
	tmpFrame = reloadButton.frame;
	tmpFrame.origin.y = y;
	reloadButton.frame = tmpFrame;

}

#pragma mark - Button Tap Handlers
- (void)nextButtonTapped:(id)sender {
	[pickerView scrollToElement:indexCount animated:YES];
	indexCount += 3;
	if ([titleArray count] <= indexCount) {
		indexCount = 0;
	}
	[nextButton	setTitle:[NSString stringWithFormat:@"Center Element %d", indexCount]
				forState:UIControlStateNormal];
}

- (void)reloadButtonTapped:(id)sender {
	// change our title array so we can see a change
	if ([titleArray count] > 1) {
		[titleArray removeLastObject];
	}

	[pickerView reloadData];
}

#pragma mark - HorizontalPickerView DataSource Methods
- (NSInteger)numberOfElementsInHorizontalPickerView:(V8HorizontalPickerView *)picker {
	return [titleArray count];
}

#pragma mark - HorizontalPickerView Delegate Methods
- (UIImage *)horizontalPickerView:(V8HorizontalPickerView *)picker imageForElementAtIndex:(NSInteger)index {
    return [titleArray objectAtIndex:index];
}

- (NSInteger) horizontalPickerView:(V8HorizontalPickerView *)picker widthForElementAtIndex:(NSInteger)index {
    UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[titleArray objectAtIndex:index]]];
	return img.size.width;
}

@end
