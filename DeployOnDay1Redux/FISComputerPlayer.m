//
//  FISComputerPlayer.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISComputerPlayer.h"

@implementation FISComputerPlayer

+(BOOL)isEnabled
{
    return YES;
}

-(FISTicTacToePosition)nextPlay
{
    NSLog(@"The identity of the computer player is %@.", _symbol);
    
    // If the computer is the first to play, most strategic move is one of the corners: First, check to see if the board is empty. If empty, play one of the corners.
    
    // If the computer is the second to play, most strategic move is one of the corners if human has not played a corner, or the center. If board not empty, check whether 
    
    // Moves for the computer player to win by getting three in row or to block the human player from getting three in a row.
    // Notes on how I arrived at this: Condense by iterating over rows 0-2. Make both offensive and defensive by checking whether playerAtColumnRow returns equal to each other, rather than checking whether both are equal to _symbol. This means that computer will play the position also if opponent occupies both positions, in order to block the opponent.
    for (NSUInteger i = 0; i < 3; i++) {
        // Open space at right.
        if (([self.game playerAtColumn:0 row:i] == [self.game playerAtColumn:1 row:i]) &&
            [self.game canPlayAtColumn:2 row:i]) {
            return FISTicTacToePositionMake(2, i);
        // Open space at left.
        } else if (([self.game playerAtColumn:1 row:i] == [self.game playerAtColumn:2 row:i]) &&
                   [self.game canPlayAtColumn:0 row:i]) {
            return FISTicTacToePositionMake(0, i);
        // Open space at middle.
        } else if (([self.game playerAtColumn:0 row:i] == [self.game playerAtColumn:2 row:i]) &&
                   [self.game canPlayAtColumn:1 row:i]) {
            return FISTicTacToePositionMake(1, i);
        }}
    
    // Moves for the computer player to win by getting three diagonally or to block opponent from getting three diagonally.
    // Diagonal top left to bottom right: Open space at bottom right.
    if (([self.game playerAtColumn:0 row:0] == [self.game playerAtColumn:1 row:1]) &&
        [self.game canPlayAtColumn:2 row:2]) {
        return FISTicTacToePositionMake(2, 2);
        // Diagonal top left to bottom right: Open space at top left.
    } else if (([self.game playerAtColumn:1 row:1] == [self.game playerAtColumn:2 row:2]) &&
               [self.game canPlayAtColumn:0 row:0]) {
        return FISTicTacToePositionMake(0, 0);
        // Diagonal top left to bottom right: Open space at middle.
    } else if (([self.game playerAtColumn:0 row:0] == [self.game playerAtColumn:2 row:2]) &&
               [self.game canPlayAtColumn:1 row:1]) {
        return FISTicTacToePositionMake(1, 1);
        // Diagonal top right to bottom left: Open space at bottom left.
    } else if (([self.game playerAtColumn:2 row:0] == [self.game playerAtColumn:1 row:1]) &&
               [self.game canPlayAtColumn:0 row:2]) {
        return FISTicTacToePositionMake(0, 2);
        // Diagonal top left to bottom right: Open space at top right.
    } else if (([self.game playerAtColumn:1 row:1] == [self.game playerAtColumn:0 row:2]) &&
               [self.game canPlayAtColumn:2 row:0]) {
        return FISTicTacToePositionMake(2, 0);
        // Diagonal top left to bottom right: Open space at middle.
    } else if (([self.game playerAtColumn:2 row:0] == [self.game playerAtColumn:0 row:2]) &&
               [self.game canPlayAtColumn:1 row:1]) {
        return FISTicTacToePositionMake(1, 1);
    }
 
    // Moves for the computer player to win by getting three in a column or to block opponent from getting three in a column.
    for (NSUInteger i = 0; i < 3; i++) {
            // Open space at top.
        if (([self.game playerAtColumn:i row:1] == [self.game playerAtColumn:i row:2]) &&
            [self.game canPlayAtColumn:i row:0]) {
            return FISTicTacToePositionMake(i, 0);
            // Open space at bottom.
        } else if (([self.game playerAtColumn:i row:0] == [self.game playerAtColumn:i row:1]) &&
                   [self.game canPlayAtColumn:i row:2]) {
            return FISTicTacToePositionMake(i, 2);
            // Open space at middle.
        } else if (([self.game playerAtColumn:i row:0] == [self.game playerAtColumn:i row:2]) &&
                   [self.game canPlayAtColumn:i row:1]) {
            return FISTicTacToePositionMake(i, 1);
        }}

    // Computer should play at an empty space. This nested for-loop will cause the computer to play at the lowest row index and the lowest column index available.
    for (NSUInteger j = 0; j < 3; j++) {
        for (NSUInteger i = 0; i < 3; i++) {
            if ([self.game canPlayAtColumn:i row:j]) {
                return FISTicTacToePositionMake(i, j);
            }
        }}
    
    // Another idea to condense further: Put relevant coordinate positions into an array and iterate over that array.
    
    
    return FISTicTacToePositionMake(0, 0);
}

@end


