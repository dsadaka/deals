# Deals
Display Deal Progress Chart - react-rails exercise

This exercise displays a chart of deal total dollar amounts broken down by stage, where the
stages are:
```
0% Lost
10% Qualified
25% Request for Info
50% Presentation
75% Negotiation
100% Won
```

### Techie info
- Rails Version: 6.0.0
- Ruby Version: 2.5.5
- React Version: 16.9.0"
## Setup
```
git clone git@github.com:dsadaka/deals.git
cd deals
bundle install
yarn install
```
## Run tests
There are two tests.  One ensures we are reading 100 deals (from stub file). The other compares calculations with expected results.
```
rails test
```
## Start server
```
rails s
```
Now load your favorite browser and navigate to http://localhost:3000
