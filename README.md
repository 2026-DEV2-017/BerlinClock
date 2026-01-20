# BerlinClock

## How to run project and tests

### Requirements
- `macOS 26.2`
- `Xcode 26.0.1` or later
(These are the versions I used, and the ones I'm expecting the project to work on)

### Steps to run
1. Clone/download repository
2. Open project in Xcode
3. Select choice of simulator (mine's iPhone 17)
4. Press `command-u` to run tests (tests can also be run individually by going to the test files)
5. Run the application (`command-r` or through Xcode's UI)

## Chosen approach
My main concern was following the spec of the kata while maintaining separation of concerns.
I started by committing every tiny step to showcase the workings of TDD, possibly a bit over the top for the first function that I added.
Where I deemed necessary or beneficial I used dependency injection in order to allow for better testing.
I also decided it was best to create a protocol for the purposes of providing the time, it order to allow mocking for testing.
I wanted to keep things as simple as I could, and only focused on features that would actually be used and would be visible.

## Key trade-offs
There were 2 things described in the description of https://agilekatas.co.uk/katas/BerlinClock-Kata that I decided I would not tackle.

1. Implementing a function for the entire Berlin Clock string (eg. `"YOOOOOOOOOOOOOOOOOOOOOOO"`)
2. Converting Berlin Clock output to digital time

For the first point, I felt it was not necessary. Since the idea was to create an app to display the Berlin clock, I thought it would be better to have each row be calculated separately. This would make it easier to create the UI afterwards, and if really needed the complete output can easily be created from the other outputs. Since I had no immediate need for the complete output in a single string, I decided it could be tackled later when there is need for it.

As for the second point: I believe that a feature to convert Berlin Clock output to digital time is outside the scope of this small project. Perhaps if there was a way to share the output with someone and have some dedicated UI to convert that into digital time (purely for fun). As it stands, with this being an iOS app, you can get the current digital time in much easier ways (you already have it displayed for starters in the status bar)

I also decided to not inject my converter into the view's model because it was stateless. I could have made it static, but keeping it as instanced allows for easier replacement with a protocol later on if multiple converters (and consolidating them via a protocol) is needed later on. Instead the model currently initialises a converter itself, since it is purely functional and doesn't affect testing.

## Future improvements
There are a few things I would consider improving if I could work on this more, or if some more requirements were added.

1. Going back to the key trade-offs, if I had a requirement to also create a screen for converting Berlin Clock to digital time, I would add some better navigation (perhaps tab-based). I would also perhaps add a way to copy the outpur to the clipboard, or maybe a share sheet. As it stands, the app is single view and kept simple for this reason.

2. In case of multiple features being required, I would potentially separate the code of the different features into separate Swift packages. This is soething I have done on some projects and I was fairly happy with it: it enforces even more separation of concerns and makes you think harder about where something belongs.

3. I would also have liked to spend a bit more time on the UI itself and add play around with adding some animations.
