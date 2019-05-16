class DOMNodeCollection {
    constructor(htmlElements) {
        this.htmlElements = htmlElements;
    }

    each(callback) {
        this.htmlElements.forEach(callback);
    }

    html(string) {
        if (typeof(string) !== undefined) {
            this.each( (htmlElement) => {
                htmlElement.innerHTML += string;
            });
            return this.htmlElements;
        } else {
            return this.htmlElements[0].innerHTML();
        }
    }

    empty() {
        this.html("");
    }

    append(arg) {
        if( arg instanceof DOMNodeCollection) {
            arg.each(htmlEle => {
                this.html(htmlEle.outerHTML);
            });
        } else if (arg instanceof HTMLElement) {
            this.html(arg.outerHTML);
        } else if(typeof(arg) === "string") {
            this.html(arg);
        }
    }

    attr(name, value) {
        if(value === undefined) {
            return this.htmlElements[0].getAttribute(name);
        } else if (typeof(name) === "object") {
            this.each(element => {
                Object.keys(name).forEach(attrName => {
                    element.setAttribute(attrName, name.attrName);
                });
        });
        } else {
            this.each(element => {
                element.setAttribute(name, value);
            }); 
        }
    }

    addClass(classNames) {
        this.each(element => {
            const attrVal = [element.getAttribute("class"), classNames].join(" ");
            element.setAttribute("class", attrVal);
        });
    }

    removeClass(classNames) {
        this.each(element => {
            const attrVal = element.getAttribute("class").split(" ");
            const toRemove = classNames.split(" ");
            const newVals = attrVal.filter((className => {
                !toRemove.includes(className);
            }));
            element.setAttribute("class", newVals);
        });
    }

    children() {
        let childrenArr = [];
        this.each(element => {
            const elementChildren = Array.from(element.children);
            childrenArr = childrenArr.concat(elementChildren);
        });
        const newCollection = new DOMNodeCollection(childrenArr);
        return newCollection;
    }

    parent() {
        let parentArr = [];
        this.each(element => {
            parentArr.push(element.parentNode);
        });
        const newCollection = new DOMNodeCollection(parentArr);
        return newCollection;
    }

    find(selector) {
        let foundElements = [];
        this.each(element => {
            const found = Array.from(element.querySelectorAll(selector));
            foundElements = foundElements.concat(found);
        });
        return new DOMNodeCollection(foundElements);
    }
    
    remove() {
        this.each(element => {
            element.innerHTML = "";
        });
    }

    on(type, callback) {
        this.each(element => {
            element.addEventListener(type, callback);
            if (element[type] instanceof Array) {
                element[type].push(callback);
            } else {
                element[type] = [callback];
            }
        });
    }

    off(type) {
        this.each(element => {
            element[type].forEach(listener => {
                element.removeEventListener(type, listener);
            });
        });
    }
}

module.exports = DOMNodeCollection;