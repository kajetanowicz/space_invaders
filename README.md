# Space Invaders

This is the solution to the Space Invaders problem.

## Approach

The algorithm for identifying Invaders on the radar sample is a brute force approach. For
each invader we scan each possible rectangle area that fits in the radar and has
the exactly same size as the invader (represented by the `SpaceInvaders::Area` objects).
Then for each Invader/Area pair we check if the invader is present by using 2 currently available matching techniques:
* basic - each pixel set on the invader has to also be set at the same coordinate within the area
* partial - it's similar to basic but instead of requiring that all invader's
  pixels match, it also accepts the threshold of what percentage has to match
  in order to consider invader present in that area.

## Assumptions

There are few assumptions about how the detection should work:
* two or more invaders can occupy the same coordinates (overlap)
* invaders that don't fully fit within the boundaries of the radar sample aren't detected
* the solution focuses more on the structure of the code rather than performance

## Results
Results are returned as a list of `SpaceInvaders::Match` objects. Each of those
objects hold a reference to the invader and area on the radar sample where the
invader was detected.


## How to run it

1. Check out the code from the repository
2. Run bundle command (the solution doesn't use any gems, it's only for Rspec)
3. Run specs with `bundle exec rspec` or in the console:

```shell
 ./bin/console
```

```ruby
# load aliens from files
aliens = [ SpaceInvaders::Alien.from_file("#{__dir__}/data/aliens/cross.txt") ]

# or load aliens from string
alien = SpaceInvaders::Alien.from_string(<<~ASCII)
  --o---
  --o---
  oooooo
ASCII

aliens = [ alien ]

# load radar from file (loading from string is also available)
radar = SpaceInvaders::RadarSample.from_file("#{__dir__}/data/radar_samples/large.txt")

# To use basic matching strategy
matches = SpaceInvaders::Scanner.new(radar, aliens).detect
# or
matches = SpaceInvaders::Scanner.new(radar, aliens).detect(SpaceInvaders::Detectors::Basic.new)

# To use partial matching strategy with 75% threshold
matches = SpaceInvaders::Scanner.new(radar, aliens).detect(SpaceInvaders::Detectors::Partial.new(75))

match = matches.first
match.alien
area = match.area
area.top_left
area.bottom_right
area.map

```
