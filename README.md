Conway's Game of Life
===

Contains multiple implementations of [GoL][Game of Life Wiki], in various languages and algorithms.

TODO
---
- [ ] Feed custom rules sets to game
- [ ] Feed custom neighbor set patterns to game
- [ ] Switch between __borderless__, __bordered__, and __looped__ edges
- [ ] Track cells that have lived
- [ ] Clean up Shoes UI
- [ ] Change algorithm to use hashes
- [ ] Keep history during game
- [ ] Game stops when board becomes static
- [ ] Make board capable of dimensions being entirely in positive quadrant (for Ruby implementation 3)


Running instructions
---
Note: all listed commands executed with
the working directory being the root folder of the sub-project.
###JavaScript
####Test
* load
 ```spec/spec-runner.html```
 in browser

###Ruby
####1
#####Test
* ```$ rspec```

#####CLI
* ```$ ruby conway.rb```

####2
#####Test
* ```$ rspec```

####3
#####Test
* ```$ rspec```

#####CLI
* ```$ ruby game_of_life.rb```

#####Shoes GUI
* Open ```shoes_practice.rb``` in [Shoes.app][Shoes GitHub]

####4
#####Test
* ```$ rspec```

#####CLI
* ```$ ruby game_of_life.rb```

#####Shoes GUI
* Open ```shoes_practice.rb``` in Shoes.app

####5
#####Test
* ```$ rspec```

[Game of Life Wiki]: http://en.wikipedia.org/wiki/Conway%27s_Game_of_Life
[Shoes GitHub]: https://github.com/shoes/shoes
