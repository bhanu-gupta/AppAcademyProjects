function range(start, end) {
    if (start === end) {
        return [start];
    }
    return [start].concat(range(start+1, end));
}

function sumRec(arr) {
    if (arr.length === 1) {
        return arr[0];
    }
    return arr[0] + sumRec(arr.slice(1));
}

// version 1
function exponent1(base, exp) {
    if (exp === 0) {
        return 1;
    }
    return base * exponent1(base, exp-1);
}

// version 2
function exponent2(base, exp) {
    if (exp === 0) {
        return 1;
    }
    if (exp === 1) {
        return base;
    }
    if (exp % 2 === 0) {
        let sqrt = exponent2(base, exp / 2)
        return sqrt * sqrt;
    } else {
        let odd_sqrt = exponent2(base, (exp - 1) / 2)
        return base * odd_sqrt * odd_sqrt;
    }
}

function fibonacci(n) {
     if (n === 1) {
        return [0];
     }
    if (n === 2) {
        return [0, 1];
    }
    let prev_result = fibonacci(n-1);
    let last_two_fibs = prev_result[prev_result.length-1] + prev_result[prev_result.length-2];
    prev_result.push(last_two_fibs);
    return prev_result;
}

function deepDup(arr) {
    let new_arr = [];
    if (!arr.some(Array.isArray)) {
        return [...arr];
    }
    arr.forEach(element => {
        if (Array.isArray(element)) {
            new_arr.push(deepDup(element));
        } else {
            new_arr.push(element);
        }
    });
    return new_arr;
}

function bsearch(arr, target) {
    if (arr.length === 0 || (arr.length === 1 && arr[0] != target)) {
        return -1;
    }
    let mid = Math.floor(arr.length/2);
    if (target === arr[mid]) {
        return mid;
    } else if (target < arr[mid]) {
        return bsearch(arr.slice(0, mid), target);
    } else {
        let prev = bsearch(arr.slice(mid+1), target);
        if (prev === -1) {
            return -1;
        } else {
            return prev + mid + 1;
        }
    }
}

function mergesort(arr) {
    if (arr.length <= 1) {
        return arr;
    }
    let mid = Math.floor(arr.length / 2);
    let left_arr = mergesort(arr.slice(0,mid));
    let right_arr = mergesort(arr.slice(mid));
    merge(left_arr, right_arr);
}

function merge(left_arr, right_arr) {
    let new_arr = [];
    while (left_arr.length > 0 && right_arr.length > 0) {
        if (left_arr[0] < right_arr[0]) {
            new_arr.push(left_arr[0]);
            left_arr.shift();
        } else {
            new_arr.push(right_arr[0]);
            right_arr.shift();
        }
    }
    return new_arr.concat(left_arr).concat(right_arr);
}