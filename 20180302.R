#one time
one = function() {
  deck <- c(rep("h", 13), rep("d", 13), rep("c", 13), rep("s", 13))
  hand <- sample(x = deck, size = 5)
  names(hand) <-paste("h", 1:length(hand), sep = "")
  diamonds <- sum(hand == "d")
  hearts <- sum(hand == "h")
  success <- diamonds == hearts
  data.frame(t(hand), diamonds, hearts, success)
}

#many times
many <- function(NNN) {
  replicate(NNN, one()$success)
}

#check results(show the details of 10 experiments to make sure one is behaving correctly.)
do.call(rbind, lapply(1:10, function(nnn) {
  one()
}))

#calculate the probability
table(many(10000))

###########################
# theoretical calculation #
###########################
num <- choose(26, 5) + choose(13, 1)*choose(13, 1)*choose(26, 3) + choose(13, 2)*choose(13, 2)*choose(26, 1)
denom <- choose(52, 5)
num/denom