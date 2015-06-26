# Algorithm 1.14 Fibonacci

# compute the nth fibonacci number
Fibonacci = (n) ->
  if n <= 1
    console.log n
  else
    fnm2 = 0; fnm1 = 1
    for i in [2..n]
      fn = fnm1 + fnm2
      fnm2 = fnm1; fnm1 = fn
    console.log fn

module.exports = Fibonacci