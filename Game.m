//
//  Game.m
//  Flappy Bird
//
//  Created by Stefan Fodor on 17/04/14.
//  Copyright (c) 2014 Stefan Fodor. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

//Logic for starting the game
-(IBAction)StartGame:(id)sender{
    
    //hide the starting button
    StartGame.hidden = YES;
    
    //REPEAT BIRD MOVING EVERY 0.05 SECONDS
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    
}

//Logic for moving bird
-(void)BirdMoving {
    
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - BirdFlight);
    
    //make the flight path decrease
    BirdFlight = BirdFlight - 5;
    
    //limit the decendent rate
    if(BirdFlight < -15) {
        BirdFlight = -15;
    }
    
    if( BirdFlight > 0 ) {
        Bird.image = [UIImage imageNamed:@"bird_up.png"];
    } else {
        Bird.image = [UIImage imageNamed:@"bird_down.png"];
    }
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    BirdFlight = 30;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
