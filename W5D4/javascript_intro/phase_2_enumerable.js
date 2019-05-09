Array.prototype.myEach = function(callback) {
    for(let i=0; i < this.length; i++) {
        callback(this[i]);
    }
};

function multipleby2(num) {
    return num*2;
}

Array.prototype.myMap = function(callback) {
    const new_arr = [...this];
    this.myEach(function(ele){
        new_arr.push(callback(ele));
    });
    return new_arr;
};

Array.prototype.myReduce = function(callback, initialValue) {
    const new_arr = [...this];
    let acc = initialValue;
    if (initialValue === undefined) {
        acc = this[0];
        new_arr.shift();
    }
    new_arr.myEach(function(ele){
        acc = callback(acc, ele)
    });
    return acc;
};

function my_sum(num1, num2) {
    return num1 + num2;
}

