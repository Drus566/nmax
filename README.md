[![Build Status](https://travis-ci.com/Drus566/nmax.svg?branch=master)](https://travis-ci.com/Drus566/nmax.svg?branch=master)
# nmax
nmax - gem which gets text data and prints n maximum numbers from text
  
### Install:
*   `bundle install` — install libraries used by the project to debug and test runs;
*   `make test` — run tests.
*   `make build` — build gem file, example `nmax-<VERSION>.gem`
*   `gem install nmax-<VERSION>.gem` — install gem

### Use 
`<input stream> | nmax <which count of numbers return>`
example:
```
cat data.txt | nmax
echo '12jh2hg1ge 90 12 0 1243278' | nmax 25
```


