# Algorithm 1.4 Recursive Permutation generator

# a: the array
# k: first index
# n: last index
Perm = (a, k, n) ->
  if k is n
    console.log a
  else
    for i in [k..n]
      t = a[k]; a[k] = a[i]; a[i] = t
      Perm(a, k + 1, n)
      t = a[k]; a[k] = a[i]; a[i] = t

module.exports = Perm
###
Note: this would have a really cool implementation
in Golang where we could use channels instead of
console.log(a) for every permutation.
###
