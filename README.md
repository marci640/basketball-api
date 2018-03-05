**March Madness API**
I looked for a March Madness API and it didn't exist, so I made one. 

**Important Note**
The current data is accessing the 2017 NCAA Tournament results - Selection Sunday	takes place on March 11. **Find an updated repo here on March 12.**

**Where is the data coming from?**
There is a csv file (teams.csv) saved to the root of the application - this contains all of the team names, the team's rank, and the corresponding conference id (a conference has many teams). A team has an attribute for each tournament round - a win or lose is represented with a boolean value. The pdf-reader gem was used to parse through the pdf version of the NCAA tournament bracket on CBS Sports. I found CBS to be the most consistent with naming conventions, which was important because I'm counting the occurrence of each team name to determine team standings.

**Getting Started**
Clone the repo and don't forget to run the following command in your terminal:
`rake import:teams` This will import teams.csv into your database
Route: api/v1/conferences

**Author(s)**
Marci Fey 
