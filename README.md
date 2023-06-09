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

```bash
bin/rails db:create db:migrate
```

## Usage

```bash
bin/rails server
```

### Fizzbuzz
```bash
curl http://127.0.0.1:3000/fizzbuzz?limit=16&int1=3&int2=5&str1=fizz&str2=buzz
[1,2,"fizz",4,"buzz","fizz",7,8,"fizz","buzz",11,"fizz",13,14,"fizzbuzz",16]
```

### Stats

```bash
curl http://127.0.0.1:3000/request_statistics
{"method":"GET","path":"/fizzbuzz","params":{"limit":"300","int1":"3","int2":"5","str1":"fizz","str2":"buzz"},"hits":4}
```

## Specs
```bash
bin/rspec spec/
................

Finished in 0.13695 seconds (files took 1.52 seconds to load)
16 examples, 0 failures

Coverage report generated for RSpec to /Users/hugues/Developer/lbc/coverage. 252 / 253 LOC (99.6%) covered.
```

## Linter

```bash
standardrb --fix
```

## TODOs

- [x] fizzbuzz API feature
  - [x] feature
  - [x] specs
  - [x] docs
- [x] statistics API
    - [x] feature
      - [x] metric collection
    - [x] specs
    - [x] docs
- [x] standardrb / rubocop
  - [ ] Pre-commit
