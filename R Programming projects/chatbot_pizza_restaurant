## Pizzaria

order_bot <- function() {
  print("Welcome to Pizzaria!")
  membership = readline("Do you have our membership? (yes/no): ")

  if (tolower(membership) == "yes") {
    username = readline("What is your name: ")
    print(paste("Hello", username))
  }

  print("What would you like to order?")
  print("We have 5 flavours with prices:")
  print("1. Margherita - $10")
  print("2. Pepperoni - $12")
  print("3. BBQ Chicken - $15")
  print("4. Veggie - $11")
  print("5. Hawaiian - $13")

  user_choice = readline("What flavour do you want? (please provide the number): ")
  flavours <- c("Margherita", "Pepperoni", "BBQ Chicken", "Veggie", "Hawaiian")
  prices <- c(10, 12, 15, 11, 13)

  chosen_flavour <- flavours[as.numeric(user_choice)]
  chosen_price <- prices[as.numeric(user_choice)]

  print(paste("You chose", chosen_flavour, "which costs $", chosen_price))

  print("What size do you prefer?")
  print("Available sizes: S, M, L")

  user_size = readline("Please enter the size (S/M/L): ")

  print(paste("You chose", user_size, "size"))

  ship_address = readline("Please enter your delivery address and phone number: ")

  print(paste("Thank you for using our service,", username))
  print("Please come again!")
}

order_bot()
