function sum() {
    result = 0;
    for(let i=0; i<arguments.length; i++) {
        result += arguments[i];
    }
    return result;
}

// console.log(sum(2,4,5));

function sum2(...nums) {
    return nums.reduce((acc, ele) => acc + ele);
}

// console.log(sum2(20, 40, 50));

Function.prototype.myBind = function(ctx) {
    // console.log(arguments);
    bindTimeArgs = Object.values(arguments).slice(1);
    let that = this;
    
    return function () {

        // console.log(Object.values(arguments));
        that.apply(ctx, bindTimeArgs.concat(Object.values(arguments)));
    };
};

Function.prototype.myBind2 = function(ctx, ...bindTimeArgs) {
    return (...callTimeArgs) => {
        this.apply(ctx, bindTimeArgs.concat(callTimeArgs));
    };
 };

class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

markov.says.myBind2(pavlov, "meow")("Markov");

function curriedSum(numArgs) {
    let numbers = [];
    function _curriedSum(num) {
        numbers.push(num);
        if(numbers.length === numArgs) {
           return numbers.reduce((acc, ele) => acc+ele);
        }
        return _curriedSum;
    }
    return _curriedSum;
}

const cur = curriedSum(3);
// console.log(cur);
// console.log(cur(2));
console.log(cur(3)(4)(5));

Function.prototype.curry = function(numArgs) {
    // let all_args = Object.values(arguments).slice(1);
    let numbers = [];
    let that = this;
    function _curriedSum(num) {
        numbers.push(num);
        if (numbers.length === numArgs) {
            // return that.apply(null, numbers);
            return that(...numbers);
        }
        return _curriedSum;
    }
    return _curriedSum;
};
function multiply(){
    return Object.values(arguments).reduce((acc, ele) => acc * ele);
}

console.log(multiply.curry(3)(1)(2)(2));