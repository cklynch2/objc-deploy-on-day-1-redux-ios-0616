//
//  FISTicTacToeGame.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToeGame.h"

@interface FISTicTacToeGame ()


@end


@implementation FISTicTacToeGame

-(instancetype)init
{
    self = [super init];
    if(self) {
        [self resetBoard];
    }
    NSLog(@"This is an empty board: %@", self.board);
    return self;
}

-(void)resetBoard
{
    self.board = [@[[@[@"", @"", @""] mutableCopy],
                    [@[@"", @"", @""] mutableCopy],
                    [@[@"", @"", @""] mutableCopy]] mutableCopy];
}

-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    NSString *playerAtColumnRow = self.board[row][column];
    return playerAtColumnRow;
}

-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    BOOL canPlayAtColumnRow = YES;
    if ([[self playerAtColumn:column row:row] isEqualToString:@""]) {
        canPlayAtColumnRow = YES;
    } else {
        canPlayAtColumnRow = NO;
    }
    
    return canPlayAtColumnRow;
}

-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    NSMutableArray *playXAtRow = self.board[row];
    [playXAtRow replaceObjectAtIndex:column withObject:@"X"];
}

-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    NSMutableArray *playOAtRow = self.board[row];
    [playOAtRow replaceObjectAtIndex:column withObject:@"O"];
}


-(NSString *)winningPlayer
{
    NSString *winningPlayer = @"";
    NSArray *players = @[@"X", @"O"];
    
    for (NSString *player in players) {
        // Check to see if X or O wins by getting three in a row:
        for (NSMutableArray *row in self.board) {
            if ([row isEqualToArray:@[player, player, player]]) {
                winningPlayer = player;
            }
        }
        
        // Check to see if X or O wins by getting three in a column:
        for (NSUInteger i = 0; i < 3; i++) {
            if ([self.board[0][i] isEqualToString: player] &&
                [self.board[1][i] isEqualToString: player] &&
                [self.board[2][i] isEqualToString: player]) {
                winningPlayer = player;
            }
        }
        
        // Check to see if X or O wins by getting three diagonally:
        if ([self.board[1][1] isEqualToString:player] &&
            (([self.board[0][0] isEqualToString:player] && [self.board[2][2] isEqualToString:player]) ||
             ([self.board[0][2] isEqualToString:player] && [self.board[2][0] isEqualToString:player]))) {
                winningPlayer = player;
            }
    }
    return winningPlayer;
}

-(BOOL)isADraw
// If there is one empty space, it is a draw. Write the loop to return "NO" is not a draw as soon as you encounter an empty space. This rather than reassigning a BOOL to NO every time you encounter an empty space. Remember! You can have multiple return statements. Code stops executing with the first return statement that is executed.
{
    for (NSMutableArray *row in self.board) {
        if ([row containsObject:@""]) {
            return NO;
        }
    }
    return YES;
}

@end
