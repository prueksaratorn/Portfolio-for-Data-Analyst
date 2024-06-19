# function
hands <- c("Hammer", "Rock", "Scissor")

bot_hands <- function() sample(hands, 1)

player_score <- 0
bot_score <- 0

result <- function(player_hands, bot_hands) {
  if (player_hands == bot_hands) {
    print("Draw")
  } else if ((player_hands == "Hammer" & bot_hands == "Scissor") |
             (player_hands == "Rock" & bot_hands == "Hammer") |
             (player_hands == "Scissor" & bot_hands == "Rock")) {
    player_score <<- player_score + 1
    print("You Win!")
  } else if ((player_hands == "Hammer" & bot_hands == "Rock") |
             (player_hands == "Rock" & bot_hands == "Scissor") |
             (player_hands == "Scissor" & bot_hands == "Hammer")) {
    bot_score <<- bot_score + 1
    print("You Lose :(")
  }
  print(paste("Your Score: ", player_score))
  print(paste("Bot Score: ", bot_score))
}

game <- function() {
  print("Welcome to Hammer Rock Scissor Game!")
  question <- readline("Do you want to play the game now? yes or no: ")
  if (question == "yes") {
    print("Choose your hand Hammer, Rock, Paper")

    play_again <- "yes"
    while (play_again == "yes") {
      player_hands <- readline("Your Hands: ")
      bot_hands <- sample(hands, 1)

      print(paste("Your Hands: ", player_hands))
      print(paste("Bot Hands: ", bot_hands))
      result(player_hands, bot_hands)

      play_again <- readline("Continue? yes or no : ")

      if (play_again == "no") {
        print(paste("Your Score: ", player_score))
        print(paste("Bot Score: ", bot_score))
        if (player_score > bot_score) {
          print("You Win!")
        } else if (player_score == bot_score) {
          print("Draw")
        } else {
          print("You Lose :(")
        }
        cat("Thank you for playing!\n")
        break
      }
    }
  }
  player_score <<- 0
  bot_score <<- 0
}

# Start the game
game()
