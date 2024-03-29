/*
Print out the n-th entry in the fibonacci series
The fibonacci series is an ordering of numbers where
each number is the sum of the preceeding two.
for ex.
0,1,1,2,3,5,8,13,21,34
forms the first ten entries of the fibonacci series.
ex.
fib(4) == 3 
 */

/// SOLUTION I ITERATIVE

int fib(int n) {
  final result = [0, 1];

  for (int i = 2; i <= n; i++) {
    int a = result[i - 1];
    int b = result[i - 2];

    result.add(a + b);
  }

  return result.last;
}

/// Solution 2  Recursive
int recursiveFib(int n) {
  if (n < 2) {
    return n;
  }
  return recursiveFib(n - 1) + recursiveFib(n - 2);
}

// Solution 3 Memoization

int fibMemo(int n, {Map<int, int>? cache}) {
  if (n < 2) {
    return n;
  }
  if (cache == null) {
    cache = <int, int>{};
  }
  if (cache.containsKey(n)) {
    return cache[n]!;
  } else {
    int result = fibMemo(n - 1, cache: cache) + fibMemo(n - 2, cache: cache);
    cache[n] = result;
    return result;
  }
}
