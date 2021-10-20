# Coding skills assessment - videogames_list_mobile
As part of our technical evaluation, the team has designed a take-home assignment for you that can be reasonably completed in a 1 to 3 day period.

If you have any questions, feel free to email your HR correspondent and we will be happy to get back to you as soon as possible.

## Getting Started
- Create a fork of this repository
- Complete the requirements based on the evaluation criteria on your fork of the repository
- Once you're done, make sure to push your commits onto your fork and inform your recruiter. The engineering team will then review your assignment.

# Take-Home Assignment
Do you like video games? You almost certainly do if you’re a software engineer :) And hopefully you’re a **Playstation** fan ✌️ like us.

The assignment is to build a mobile application to browse the **latest released** Playstation 5 games, and view **more details** about said games.

## **Summary/Requirements:**
1. The app should be built using any mobile technology from this order of preference:
    1. Flutter (Preferable)
    2. Any other declarative framework - React Native, Jetpack Compose, Swift UI
    3. Any other Android, iOS framework (your choice)
2. List of the latest released Playstation 5 games are displayed in a ListView, GridView or whatever that is deemed useful by the candidate. The following info must be shown:
    1. Name
    2. Release Date
    3. Background Image
    4. Metacritic Score
3. The user is able to view more details (including previous details) of a video game by tapping on a video game:
    1. Description
    2. Genres
    3. (Optional) Any other details you think are useful or interesting for the user such as Screenshots, Other Platforms, Developers, Publishers.
4. Use Git for managing your source code. Your project must be checked into GitHub and be shared with the team when submitting your assignment.
5. Update the project’s README to include instructions/steps to compile and debug the project as necessary
6. The data is fetched from the given API below

## **API**
Fetch the data from RAWG Video Games Database API [https://api.rawg.io/docs/](https://api.rawg.io/docs/). RAWG is an OpenAPI-compliant free API, you can download the specification from the same link.

**Fetch page 1 of released Playstation 5 games from 2020-10-03 to 2021-10-03:**
[https://api.rawg.io/api/games?page=1&page_size=20&platforms=187&dates=2020-10-03,2021-10-03&ordering=released&key=02ef6ba5d13444ee86bad607e8bce3f4](https://api.rawg.io/api/games?page=1&page_size=20&platforms=187&dates=2020-10-03,2021-10-03&ordering=released&key=02ef6ba5d13444ee86bad607e8bce3f4)

**Fetch the details of a game (In this case, FIFA 21):**
[https://api.rawg.io/api/games/437049?key=02ef6ba5d13444ee86bad607e8bce3f4](https://api.rawg.io/api/games/437049?key=02ef6ba5d13444ee86bad607e8bce3f4)

Highly suggested that the candidate gets an API key themselves as it is free, just follow the link above, but you can also use ours provided it has not run out of requests or expired: 02ef6ba5d13444ee86bad607e8bce3f4

## **Evaluation Criteria**
1. Feel free to be as creative as you can be in terms of UI/UX or code design, this should be a fun assignment!
2. The solution should be designed and architected to the utmost of your engineering ability. The code should be clean, readable, extensible, testable, performant and maintainable.
3. The project should be compilable and debuggable
4. Consider using a state-management framework such as Bloc, Provider, Redux or MobX.
5. Having tests (e.g unit tests, widget tests etc) are greatly appreciated
6. If shortlisted, the candidate is expected to present their solution at the end of the assignment in a subsequent video call.
7. The candidate will be asked to explain their design decisions. Think about why you chose a certain pattern/framework/structure carefully.
   - If needed, you can have any supporting documentation that can help present your design.
9. In a nutshell, build the solution for longevity, as though it will be worked on and maintained by a team. And most importantly, have fun :)
