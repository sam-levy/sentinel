# Sentinel

![Sentinel](sentinel.png)

Sentinel is a top-secret ultra-sophisticated CIA tool for counter-espionage missions. In the hands of a highly skilled agent, Sentinel can be used to collect and analyze valuable information about intelligence activities of enemy nations inside borders.
## Installation
### Elixir

To install Elixir on your local environment you can use the [ASDF manager](https://asdf-vm.com/#/core-manage-asdf).
To install the version being used by this project you can use the `asdf install` command.

### Application

To install the dependencies of this project run `mix deps.get`.

To start Sentinel just run `mix run --no-halt` in the command line of your cutting-edge spionage device (a.k.a computer).

Run `mix test` to check if this wonderful piece of equipment is well calibrated and ready to action.
## Functionalities

For the first time it runs, Sentinel will fetch information about its target and parse it. Sentinel will also cache the parsed information in memory in order to avoid showing itself too much and raising suspicion about its activities. The information will be refreshed every two hours in order to keep track of the latest super suspicious reviews. In the case of the counter-counter-intelligence (yep, two times) of the target identifies and puts Sentinel down, the information acquired will be available on disk. As soon as Sentinel resurrects from its ashes, the information will be ready to be analyzed even if there is no internet. By the time internet connection is available again, Sentinel will fetch new information about the target suspicious activities of selling cars and having good reviews from its customers.

### Overly positive endorsements sorting algorithm

Sentinel will sort the reviews by its suspiciousness based on the rating, length of the review and number of employees referred to in each review. Followed by the rate, the more time a customer spends writing an endorsement, the more suspicious it is. Last but not least, a big number of employees referred in a review will also rise suspicious.

### Spy identification algorithm

Sentinel is also capable of identifying and sorting offenders by its dangerousness. the greater the number of times possible spies appear in good reviews the more dangerous they are labeled.