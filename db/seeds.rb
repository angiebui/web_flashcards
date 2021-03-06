Deck.create(:category => "RARA")
Card.create(:question => "What is Robby's favorite baseball team?", :answer => "Yankees", :deck_id => 1)
Card.create(:question => "What is Amy's favorite ice cream?", :answer => "Strawberry", :deck_id => 1)
Card.create(:question => "What is Robert's favorite food?", :answer => "Korean", :deck_id => 1)
Card.create(:question => "What is Angie's favorite basketball team?", :answer => "Spurs", :deck_id => 1)
Card.create(:question => "What does 'RARA' stand for?", :answer => "Robby, Angie, Robert, and Amy", :deck_id => 1)

User.create(:name => 'Robby', :email => 'robby.fairclough@gmail.com', :password => 'robby')
User.create(:name => 'Angie', :email => 'angie.bui@gmail.com', :password => 'angie')
User.create(:name => 'Amy', :email => 'amy.lukima@gmail.com', :password => 'amy')

Round.create(:score => 100, :user_id => 1, :deck_id => 1)
Round.create(:score => 80, :user_id => 2, :deck_id => 1)
Round.create(:score => 80, :user_id => 2, :deck_id => 1)
Round.create(:score => 40, :user_id => 3, :deck_id => 1)
Round.create(:score => 0, :user_id => 3, :deck_id => 1)

# Deck.create(:category => "San Francisco Trivia")
# Card.create(:question => "What shade of orange is the Golden Gate Bridge?", :answer => "International Orange", :deck_id => 2)
# Card.create(:question => "What San Francisco stree is known as the crookedest street in the world?", :answer => "Lombard", :deck_id => 2)
# Card.create(:question => "The Beatles' final live concert took place on 29 August 1966 at what San Francisco Stadium?", :answer => "Candlestick Park", :deck_id => 2)
# Card.create(:question => "What popular clothing item was invented in San Francisco for Gold Rush miners across California?", :answer => "Jeans", :deck_id => 2)
# Card.create(:question => "In what year was San Francisco obliterated by an earthquake, along with a massive fire", :answer => "1906", :deck_id => 2 )

# Deck.create(:category => "Video Game Trivia")
# Card.create(:question => "Super Mario Brothers 2 was deemed too hard for American gamers, what modified game was released in its place?", :answer => "Doki Doki Panic", :deck_id => 3)
# Card.create(:question => "What was the first console to implement online play over a phone line?", :answer => "Dreamcast", :deck_id => 3)
# Card.create(:question => "What video game console was the No. 1 selling item for the holiday season in 1975?", :answer => "Atari Pong", :deck_id => 3)
# Card.create(:question => "In the 1980s, what service allowed users to download games to the Atari 2600 over regular phone lines.?", :answer => "Gameline", :deck_id => 3)
# Card.create(:question => "What console was originally intended as a CD add-on to the Super Nintendo?", :answer => "Playstation", :deck_id => 3)