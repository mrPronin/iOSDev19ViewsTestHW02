//
//  RITViewController.m
//  19ViewsTestHW02
//
//  Created by Pronin Alexander on 23.02.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import "RITViewController.h"

@interface RITViewController ()

@property (strong, nonatomic) UIView* chessboard;

@end

@implementation RITViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self drawChessboard];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    
    NSLog(@"\n");
    NSLog(@"From: %@", [self NSStringFromUIInterfaceOrientation:fromInterfaceOrientation]);
    NSLog(@"To: %@", [self NSStringFromUIInterfaceOrientation:self.interfaceOrientation]);
    NSLog(@"Frame: width = %f, height = %f", CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    NSLog(@"Bounds: width = %f, height = %f", CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));

}

- (void) drawChessboard {
    CGRect rect;
    UIView *view =  nil;
    UIView *whiteBox =  nil;
    NSUInteger cellCount        = 8;
    NSUInteger borderOffset     = 2;
    NSUInteger minimumSize      = MIN(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    NSUInteger maximumSize      = MAX(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    
    // calculate cell size and field size
    NSUInteger cellSize         = (minimumSize - borderOffset * 2) / cellCount;
    NSUInteger fieldSize        = cellSize * cellCount + borderOffset * 2;
    
    // set initial coordinates
    NSUInteger x = 0;
    NSUInteger y = 0;
    if (CGRectGetWidth(self.view.bounds) < CGRectGetHeight(self.view.bounds)) {
        // portrait or upside down
        x = (minimumSize - fieldSize) / 2;
        y = (maximumSize - minimumSize) / 2;
    } else {
        // landscape (left or right)
        x = (maximumSize - minimumSize) / 2;
        y = (minimumSize - fieldSize) / 2;
    }
    
    // set border
    rect                        = CGRectMake(x, y, fieldSize, fieldSize);
    self.chessboard             = [[UIView alloc] initWithFrame:rect];
    self.chessboard.backgroundColor    = [UIColor blackColor];
    [self.view addSubview:self.chessboard];
    
    rect                        = CGRectMake(
                                             borderOffset / 2,
                                             borderOffset / 2,
                                             CGRectGetWidth(rect) - borderOffset,
                                             CGRectGetHeight(rect) - borderOffset
                                             );
    
    whiteBox                    = [[UIView alloc] initWithFrame:rect];
    whiteBox.backgroundColor  = [UIColor whiteColor];
    [self.chessboard addSubview:whiteBox];
    
    // draw cells
    y       = 1;
    for (int i = 0; i < cellCount; i++) {
        
        x = cellSize * (i % 2) + 1;
        
        for (int j = 0; j < cellCount / 2; j++) {
            
            rect                    = CGRectMake(x, y, cellSize, cellSize);
            view                    = [[UIView alloc] initWithFrame:rect];
            view.backgroundColor    = [UIColor blackColor];
            [whiteBox addSubview:view];
            
            x+= cellSize * 2;
        }
        
        y+= cellSize;
    }
}

- (NSString*) NSStringFromUIInterfaceOrientation:(UIInterfaceOrientation) orientation {
    
    NSString* result;
    
    switch (orientation) {
        
        case UIInterfaceOrientationPortrait:
            result = @"Portrait";
            break;
            
        case UIInterfaceOrientationPortraitUpsideDown:
            result = @"PortraitUpsideDown";
            break;
            
        case UIInterfaceOrientationLandscapeLeft:
            result = @"LandscapeLeft";
            break;
            
        case UIInterfaceOrientationLandscapeRight:
            result = @"LandscapeRight";
            break;
    }
    return result;
}

@end
