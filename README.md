# Setup

## Versions:

  - ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-darwin18]
  - Rails 6.0.2.1
  
## Launch the app

- Pay special attention to your versions of Ruby and Rails
- After cloning the repository, go inside app and run `bundle install`
- Runing migration with `rake db:migrate` and seed some data with `rails db:seed`
- Start server with `rails s` and go at your `http://localhost:3000` 

## Guidelines
- Fork this repository
- You can add any framework, library or plugin you'd like
- In short: Do whatever you want to get the job done
- Make sure the application works out-of-the box once you're done
- Push changes to your git fork
- Add a short description on how to run your program in the Setup section above. (A person ariving new to the project should be able to follow your instructions and run it)
- Check the finished features in the Assignment and Bonus section by putting an 'X' ([X]) in between the brackets
- Quality over quantity, better half of the features 100% done, than 100% of the features half-done
- Assignment :
  - You are asked to build a simple Quizz App

## User
 [X] A user can log in with a valid username and password through a login screen

 [X] A user can see a collection of quizzes

 [X] A user can start a quizz

 [X] A user can answer 3 questions on a quizz

 [X] A user can see the scores of his quizzes


## Quizz
 [X] A quizz has a Title

 [X] A quizz has a maximum of 3 questions

 [X] A quizz is considered passed if +60% of questions are answered correctly

## Question
 [X] A question has a maximum of 4 answers

 [X] A question has only 1 possible correct answer


## Bonus
- Some nice to haves, when there is time to spare.

 [X] A quizz can have a dificulty level

 [X] There is a leaderboard that shows users with most points