/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n    constructor(htmlElements) {\n        this.htmlElements = htmlElements;\n    }\n\n    each(callback) {\n        this.htmlElements.forEach(callback);\n    }\n\n    html(string) {\n        if (typeof(string) !== undefined) {\n            this.each( (htmlElement) => {\n                htmlElement.innerHTML += string;\n            });\n            return this.htmlElements;\n        } else {\n            return this.htmlElements[0].innerHTML();\n        }\n    }\n\n    empty() {\n        this.html(\"\");\n    }\n\n    append(arg) {\n        if( arg instanceof DOMNodeCollection) {\n            arg.each(htmlEle => {\n                this.html(htmlEle.outerHTML);\n            });\n        } else if (arg instanceof HTMLElement) {\n            this.html(arg.outerHTML);\n        } else if(typeof(arg) === \"string\") {\n            this.html(arg);\n        }\n    }\n\n    attr(name, value) {\n        if(value === undefined) {\n            return this.htmlElements[0].getAttribute(name);\n        } else if (typeof(name) === \"object\") {\n            this.each(element => {\n                Object.keys(name).forEach(attrName => {\n                    element.setAttribute(attrName, name.attrName);\n                });\n        });\n        } else {\n            this.each(element => {\n                element.setAttribute(name, value);\n            }); \n        }\n    }\n\n    addClass(classNames) {\n        this.each(element => {\n            const attrVal = [element.getAttribute(\"class\"), classNames].join(\" \");\n            element.setAttribute(\"class\", attrVal);\n        });\n    }\n\n    removeClass(classNames) {\n        this.each(element => {\n            const attrVal = element.getAttribute(\"class\").split(\" \");\n            const toRemove = classNames.split(\" \");\n            const newVals = attrVal.filter((className => {\n                !toRemove.includes(className);\n            }));\n            element.setAttribute(\"class\", newVals);\n        });\n    }\n\n    children() {\n        let childrenArr = [];\n        this.each(element => {\n            const elementChildren = Array.from(element.children);\n            childrenArr = childrenArr.concat(elementChildren);\n        });\n        const newCollection = new DOMNodeCollection(childrenArr);\n        return newCollection;\n    }\n\n    parent() {\n        let parentArr = [];\n        this.each(element => {\n            parentArr.push(element.parentNode);\n        });\n        const newCollection = new DOMNodeCollection(parentArr);\n        return newCollection;\n    }\n\n    find(selector) {\n        let foundElements = [];\n        this.each(element => {\n            const found = Array.from(element.querySelectorAll(selector));\n            foundElements = foundElements.concat(found);\n        });\n        return new DOMNodeCollection(foundElements);\n    }\n    \n    remove() {\n        this.each(element => {\n            element.innerHTML = \"\";\n        });\n    }\n\n    on(type, callback) {\n        this.each(element => {\n            element.addEventListener(type, callback);\n            if (element[type] instanceof Array) {\n                element[type].push(callback);\n            } else {\n                element[type] = [callback];\n            }\n        });\n    }\n\n    off(type) {\n        this.each(element => {\n            element[type].forEach(listener => {\n                element.removeEventListener(type, listener);\n            });\n        });\n    }\n}\n\nmodule.exports = DOMNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("window.DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection.js */ \"./src/dom_node_collection.js\");\n\nwindow.functionQueue = [];\n\nwindow.$l = function(arg) {\n\n    let newCollection;\n\n    if (arg instanceof HTMLElement) {\n        newCollection = [arg];\n    } else if (typeof(arg) === \"function\") {\n        window.functionQueue.push(arg);\n        if (document.readyState !== \"complete\") {\n        document.addEventListener('DOMContentLoaded', e => {\n            runQueue();\n        });\n        } else {\n            runQueue();\n        }\n    } else {\n        const nodeList = document.querySelectorAll(arg);\n        const htmlElements = Array.from(nodeList);\n        newCollection = new DOMNodeCollection(htmlElements);\n    }\n    return newCollection;\n};\n\nwindow.$l.extend = function(...args) {\n    // const newObj =  args.reduce((acc, ele) => {\n    //    Object.assign(acc, ele); \n    // });\n    const bigObj = args[0];\n    args.slice(1).forEach(obj => {\n        Object.assign(bigObj, obj);\n    });\n    return bigObj;\n};\n\nwindow.$l.ajax = function(options) {\n    defaults = {\n        'success': function() {},\n        'error': function() {},\n        'url': \"\",\n        'method': \"GET\",\n        'data': {},\n        'dataType': 'json',\n        'contentType': 'application/x-www-form-urlencoded; charset=UTF-8'\n        };\n    const settings = window.$l.extend(defaults, options);\n\n    const xhr = new XMLHttpRequest();\n    xhr.open(settings.method, settings.url);\n    xhr.onload = function() {\n        console.log(xhr);\n        // debugger;\n        if(xhr.status === 200) {\n            settings.success(xhr.response);\n        } else {\n            settings.error(xhr.response);\n        }\n    };\n    xhr.send(settings.data);\n    // xhr.onerror = function() {\n    //     console.log(xhr);\n    //     debugger;\n    //     settings.error(xhr, xhr.status, exception);\n    // };\n    // debugger;\n};\n\nconst runQueue = function() {\n    while (window.functionQueue.length > 0) {\n        window.functionQueue[0]();\n        window.functionQueue.shift();\n    }\n};\n\n\n\n\n// window.$l();\nwindow.$l.ajax({\n    url: 'https://api.giphy.com/v1/gifs/random?tag=queryStringgghugigyiygi&api_key=9IfxO6R6fpEZMAdqdw66QUgQdPejVIAW&rating=G',\n    success: function() {\n        console.log('success!!!');\n    }\n});\n\n\nfunction test() {\n    window.$l('img').on('click', ev => {\n        \n        \n    });\n}\n\n// function test2() {\n//     window.$l('img').on('click', ev => {\n//         alert(\"img clicked\");\n//     });\n// }\nwindow.$l(test);\n// window.$l(test2);\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });