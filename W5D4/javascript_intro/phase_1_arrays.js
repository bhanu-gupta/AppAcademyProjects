Array.prototype.uniq = function() {
    const new_arr = [];
    for (let i = 0; i < this.length; i++) {
        if (!new_arr.includes(this[i])) {
            new_arr.push(this[i]);
        }
    }
    return new_arr;
};

Array.prototype.twoSum = function() {
    const new_arr = [];
    for (let i = 0; i < this.length; i++) {
        for (let j = i+1; j < this.length; j++) {
            if (this[i] + this[j] === 0) {
                new_arr.push([i, j]);
            }
        }
    }
    return new_arr;
};

Array.prototype.transpose = function() {
    const new_arr = [];
    for (let i = 0; i < this.length; i++) {
        let row_arr = []
        for (let j = 0; j < this.length; j++) {
            row_arr.push(this[j][i]);
        }
        new_arr.push(row_arr);
    }
    return new_arr;
};

// Array.prototype = {
//     uniq: function () {
//         const new_arr = [];
//         for (let i = 0; i < this.length; i++) {
//             if (!new_arr.includes(this[i])) {
//                 new_arr.push(this[i]);
//             }
//         }
//         return new_arr;
//     },

//     twoSum: function () {
//         const new_arr = [];
//         for (let i = 0; i < this.length; i++) {
//             for (let j = i + 1; j < this.length; j++) {
//                 if (this[i] + this[j] === 0) {
//                     new_arr.push([i, j]);
//                 }
//             }
//         }
//         return new_arr;
//     }
// };