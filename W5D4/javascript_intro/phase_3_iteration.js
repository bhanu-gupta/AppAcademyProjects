Array.prototype.bubbleSort = function() {
    const new_arr = [...this];
    let sorted = false;
    while (!sorted) {
        sorted = true;
        for (let i = 0; i < new_arr.length-1; i++) {
            if (new_arr[i] > new_arr[i+1]) {
                temp = new_arr[i];
                new_arr[i] = new_arr[i+1];
                new_arr[i+1] = temp;
                sorted = false;
            }
        }
    }
    return new_arr;
};

String.prototype.substrings = function() {
    const new_arr = [];
    for (let i = 0; i < this.length; i++) {
        for(let j=i; j< this.length; j++) {
            new_arr.push(this.substring(i,j+1));
        }
    }
    return new_arr;
};