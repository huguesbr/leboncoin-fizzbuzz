# FIZZBUZZ

Exercise: Write a simple fizz-buzz REST server.

"The original fizz-buzz consists in writing all numbers from 1 to 100, and just replacing all multiples of 3 by ""fizz"", all multiples of 5 by ""buzz"", and all multiples of 15 by ""fizzbuzz"".

The output would look like this: ""1,2,fizz,4,buzz,fizz,7,8,fizz,buzz,11,fizz,13,14,fizzbuzz,16,...""."

Your goal is to implement a web server that will expose a REST API endpoint that:

Accepts five parameters: three integers int1, int2 and limit, and two strings str1 and str2.
Returns a list of strings with numbers from 1 to limit, where: all multiples of int1 are replaced by str1, all multiples of int2 are replaced by str2, all multiples of int1 and int2 are replaced by str1str2.
The server needs to be:

Ready for production
Easy to maintain by other developers
Bonus: add a statistics endpoint allowing users to know what the most frequent request has been. This endpoint should:

Accept no parameter
Return the parameters corresponding to the most used request, as well as the number of hits for this request

## Versionning
- Ruby version: 2.7.6
- Rails 7.0.4.3

## Setup
`bin/rails db:create db:migrate`

## Specs
```bash
bin/rspec spec/
...........

Finished in 0.12536 seconds (files took 1.77 seconds to load)
11 examples, 0 failures

Coverage report generated for RSpec to /Users/hugues/Developer/lbc/coverage. 196 / 197 LOC (99.49%) covered.
```

## TODO:

- [x] fizzbuzz API feature
  - [x] feature
  - [x] specs
  - [ ] docs
- [ ] statistics API
    - [x] feature
      - [x] metric collection
    - [x] specs
    - [ ] docs
- [ ] standardrb / rubocop
