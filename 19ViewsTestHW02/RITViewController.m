//
//  RITViewController.m
//  19ViewsTestHW02
//
//  Created by Pronin Alexander on 23.02.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import "RITViewController.h"

@interface RITViewController ()

@end

@implementation RITViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect rect;
    UIView *view, *chessboard;
    NSUInteger cellCount        = 8;
    NSUInteger borderOffset     = 2;
    NSUInteger minimumSize      = MIN(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    NSUInteger maximumSize      = MAX(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    NSUInteger y                = (maximumSize - minimumSize) / 2;
    
    // calculate cell size and field size
    minimumSize-= borderOffset * 2;
    NSUInteger cellSize         = minimumSize / cellCount;
    NSUInteger fieldSize        = cellSize * cellCount + borderOffset * 2;
    
    // set border
    rect                        = CGRectMake(1, y, fieldSize, fieldSize);
    chessboard                  = [[UIView alloc] initWithFrame:rect];
    chessboard.backgroundColor  = [UIColor blackColor];
    [self.view addSubview:chessboard];
    
    rect                        = CGRectMake(
                                             borderOffset / 2,
                                             borderOffset / 2,
                                             CGRectGetWidth(rect) - borderOffset,
                                             CGRectGetHeight(rect) - borderOffset
                                             );
    
    view                        = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor        = [UIColor whiteColor];
    [chessboard addSubview:view];
    
    y= borderOffset;
    
    // draw cells
    for (int i = 0; i < cellCount; i++) {
        
        NSUInteger x            = cellSize * (i % 2) + borderOffset;
        
        for (int j = 0; j < cellCount / 2; j++) {
            
            rect                    = CGRectMake(x, y, cellSize, cellSize);
            view                    = [[UIView alloc] initWithFrame:rect];
            view.backgroundColor    = [UIColor blackColor];
            [chessboard addSubview:view];
            
            x+= cellSize * 2;
        }
        
        y+= cellSize;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
