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
3. Pagination: When the user reached the bottom of the list, it should load the second page if available.
4. The user is able to view more details (including previous details) of a video game by tapping on a video game:
    1. Description
    2. Genres
    3. (Optional) Any other details you think are useful or interesting for the user such as Screenshots, Other Platforms, Developers, Publishers.
5. Use Git for managing your source code. Your project must be checked into GitHub and be shared with the team when submitting your assignment.
6. Update the project’s README to include instructions/steps to compile and debug the project as necessary
7. The data is fetched from the given API below

## **Evaluation Criteria**
1. The solution should be designed and architected to the utmost of your engineering ability. The code should be clean, readable, extensible, testable, performant and maintainable.
2. The project should be compilable and debuggable.
3. Try to breakdown your solution into multiple commits and use readable commit message.
4. Consider using a state-management framework such as Bloc, Provider, Redux or MobX.
5. Having tests (e.g unit tests, widget tests etc) are greatly appreciated.
   - For seniors candidates we **strongly** recommend writing tests
7. If shortlisted, the candidate is expected to discuss their assignment in a subsequent video call. The candidate will be asked to explain their design decisions. Think about why you chose a certain pattern/framework/structure carefully.
   - If needed, you can have any supporting documentation that can help present your design.
8. In a nutshell, build the solution for longevity, as though it will be worked on and maintained by a team. And most importantly, have fun :) Feel free to be as creative as you'd like for UI/UX and design.


## **API**
Fetch the data from RAWG Video Games Database API [https://api.rawg.io/docs/](https://api.rawg.io/docs/). RAWG is an **OpenAPI-compliant free API**, you can download the OpenAPI/Swagger specification from the same link.


### **Fetch latest Playstation 5 games:**
[https://api.rawg.io/api/games?page=1&page_size=20&platforms=187&dates=2020-12-21,2021-12-21&ordering=-released&key=02ef6ba5d13444ee86bad607e8bce3f4](https://api.rawg.io/api/games?page=1&page_size=20&platforms=187&dates=2020-12-21,2021-12-21&ordering=-released&key=02ef6ba5d13444ee86bad607e8bce3f4)

Query Explanation:
- `https://api.rawg.io/api/games`: Games endpoint
- `page=1`: Page 1 of results
- `page_size=20`: Limit the resuts to 20 at a time
- `platforms=187`: Playstation 5 platform
- `dates=2020-12-21,2021-12-21`: Start date, end date. Limits the results to 1 year timeframe. Replace end date with the current date, replace start date minus 1 year from current date.
- `ordering=-released`: Sort by released descending
- `key=02ef6ba5d13444ee86bad607e8bce3f4`: Replace the key with yours (if any)

### **Fetch details of a game (In this case, FIFA 21):**
[https://api.rawg.io/api/games/437049?key=02ef6ba5d13444ee86bad607e8bce3f4](https://api.rawg.io/api/games/437049?key=02ef6ba5d13444ee86bad607e8bce3f4)

Query Explanation:
- `https://api.rawg.io/api/games/`: Games endpoint
- `437049`: Game ID for 'FIFA 21'
- `key=02ef6ba5d13444ee86bad607e8bce3f4`: Replace the key with yours (if any)

> Highly suggest the candidate get an API key as it is free, just follow the link above. But you can also use ours provided it has not run out of requests or expired: 02ef6ba5d13444ee86bad607e8bce3f4
