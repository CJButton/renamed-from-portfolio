// write String.prototype.mySlice. It should take a start index and an
// (optional) end index.

String.prototype.mySlice = function (start, end = this.length) {

  let sliced = ""

  if (start > end) {
    return sliced;
  }

  for (let i = start; i < end; i++) {
    sliced += this[i];
    if (i >= this.length - 1) {
      break;
    }
  }
  return sliced;

};

// write Array.prototype.myReduce (analogous to Ruby's Array#inject).

  // notice in the specs, that it doesn't pass in an accumuluator
  // thus we know that we shouldn't do that either;
Array.prototype.myReduce = function (callback) {
  let accum = this[0]

  for (let i = 1; i < this.length; i++) {
    accum = callback(accum, this[i]);
  }
  return accum;

};


// ERRORS MADE: did not put the correct curly brackets on the comparator
// if statement; BE MORE CAREFUL with them;
Array.prototype.quickSort = function(comparator) {
  if (this.length < 2) {
    return this;
  }

  // we don't need to redifine the comparator if it has already
  // been defined;
  if (comparator === undefined) {
  comparator = function(x, y) {
    if (x === y) {
      return 0;
    } else if (x < y) {
      return -1;
    } else {
      return 1;
      }
    }
  }

  let left = [];
  let right = [];
  let pivot = this[0];

  for (let i = 1; i < this.length; i++) {
    if (comparator(this[i], pivot) === -1) {
      left.push(this[i]);
    } else {
      right.push(this[i]);
    }
  }

  left = left.quickSort(comparator);
  right = right.quickSort(comparator);
  return left.concat([pivot]).concat(right);


};
// write Array.prototype.quickSort(comparator). Here's a quick refresher if
// you've forgotten how quickSort works:
//   - choose a pivot element from the array (usually the first)
//   - for each remaining element of the array:
//     - if the element is less than the pivot, put it in the left half of the
//     array.
//     - otherwise, put it in the right half of the array.
//   - recursively call quickSort on the left and right halves, and return the
//   full sorted array.


// ERRORS MADE: mixed up array and this ERRORS MADE:
// this function takes an array and a block/callback
function myFind(array, callback) {
  // we iterate through each element in the array
  for (let i = 0; i < array.length; i++) {
    // if the block returns true for any of them,
    if (callback(array[i]) === true) {
      // we return that element of the array
      return array[i];
    }
  }
}
// write myFind(array, callback). It should return the first element for which
// callback returns true, or undefined if none is found.

function isPrime(num) {
  for (let i = 2; i < num - 1; i++) {
    if (num % i === 0) {
      return false;
    }
  }
  return true;
}

function sumNPrimes(n) {
  if (n < 1) {
    return n;
  }

  let primes = [];
  for (let i = 2; primes.length < n; i++) {
    if (isPrime(i)) {
      primes.push(i);
    }
  }

  let sum = 0;
  primes.forEach(function(el) {
    sum += el;
  });
  return sum;
}


// write sumNPrimes(n)
// memorize Bind
// the markov)() tells us that it could potentially take in
  // many many more arguments
Function.prototype.myBind = function (context, ...args) {
  return (...otherArgs) => this.apply(context, args.concat(otherArgs))
};
// write Function.prototype.myBind.
Function.prototype.inherits = function(parent) {
  function Surrogate() {};
  // we create a new empty function;
  Surrogate.prototype = parent.prototype;
  // this functions prototype is changed to the parents one
  this.prototype = new Surrogate();
  // the child's prototype is switched the surrogate classes'
};

// write Function.prototype.inherits.
