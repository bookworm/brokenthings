# Time

Figure: [122.3]               [122.4]
while user 1's move then his time is God.           

we store a range on the server and keep track of the time. the range should be based one a rounding of the users ping time up by 100s. the times should not differ from the servers time by more than the range. we still accept this but log it as a serious inconsistency. When the server gets the time it compares them to its time if its way off log its, if not sets it as the new time and sends it along with the move to the opponent. Opponents client updates.

# How do spectators work? 

Get time and moves. But have encapsulated move functionality disabled. Server needs to verify session as being an actual player session.
God users should be able to peek at the inconsistencies of a player and adjudicate the game.   
Each move should be stored ina special format with timestamps. Both players should have a copy of their view of the timestamps and the seevre should have one.