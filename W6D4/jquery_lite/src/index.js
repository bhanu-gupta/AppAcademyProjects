window.DOMNodeCollection = require('./dom_node_collection.js');

window.functionQueue = [];

window.$l = function(arg) {

    let newCollection;

    if (arg instanceof HTMLElement) {
        newCollection = [arg];
    } else if (typeof(arg) === "function") {
        window.functionQueue.push(arg);
        if (document.readyState !== "complete") {
        document.addEventListener('DOMContentLoaded', e => {
            runQueue();
        });
        } else {
            runQueue();
        }
    } else {
        const nodeList = document.querySelectorAll(arg);
        const htmlElements = Array.from(nodeList);
        newCollection = new DOMNodeCollection(htmlElements);
    }
    return newCollection;
};

window.$l.extend = function(...args) {
    // const newObj =  args.reduce((acc, ele) => {
    //    Object.assign(acc, ele); 
    // });
    const bigObj = args[0];
    args.slice(1).forEach(obj => {
        Object.assign(bigObj, obj);
    });
    return bigObj;
};

window.$l.ajax = function(options) {
    defaults = {
        'success': function() {},
        'error': function() {},
        'url': "",
        'method': "GET",
        'data': {},
        'dataType': 'json',
        'contentType': 'application/x-www-form-urlencoded; charset=UTF-8'
        };
    const settings = window.$l.extend(defaults, options);

    const xhr = new XMLHttpRequest();
    xhr.open(settings.method, settings.url);
    xhr.onload = function() {
        console.log(xhr);
        // debugger;
        if(xhr.status === 200) {
            settings.success(xhr.response);
        } else {
            settings.error(xhr.response);
        }
    };
    xhr.send(settings.data);
    // xhr.onerror = function() {
    //     console.log(xhr);
    //     debugger;
    //     settings.error(xhr, xhr.status, exception);
    // };
    // debugger;
};

const runQueue = function() {
    while (window.functionQueue.length > 0) {
        window.functionQueue[0]();
        window.functionQueue.shift();
    }
};




// window.$l();
window.$l.ajax({
    url: 'https://api.giphy.com/v1/gifs/random?tag=queryStringgghugigyiygi&api_key=9IfxO6R6fpEZMAdqdw66QUgQdPejVIAW&rating=G',
    success: function() {
        console.log('success!!!');
    }
});


function test() {
    window.$l('img').on('click', ev => {
        
        
    });
}

// function test2() {
//     window.$l('img').on('click', ev => {
//         alert("img clicked");
//     });
// }
window.$l(test);
// window.$l(test2);

