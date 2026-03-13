from standard_language import *
from javascript_core import *

//////
// BASIC SYNTAX
//////

JS.output = console.log
JS.input = prompt

//////
// VARIABLE DECLARATIONS  
//////

Let: description{"block-scoped, mutable"}{
    scope = BLOCK
    mutable = true
    hoisting = false
    syntax = "let name = value"
}

Var: description{"function-scoped, hoisted"}{
    scope = FUNCTION  
    mutable = true
    hoisting = true
    syntax = "var name = value"
}

Const: description{"block-scoped, immutable"}{
    scope = BLOCK
    mutable = false 
    hoisting = false
    syntax = "const name = value"
}

//////
// DATA TYPES
//////

DataType{
    String = "text"
    Number = 123
    Boolean = true|false
    Array = [1, 2, 3]
    Object = {key: "value"}
    Null = null
    Undefined = undefined
}

//////
// OPERATORS
//////

Operator{
    arithmetic = [+, -, *, /, %]
    assignment = [=, +=, -=]
    comparison = [==, ===, !=, !==, >, <]
    logical = [&&, ||, !]
}

//////
// CONTROL FLOW
//////

ControlFlow{
    if = "if (condition) { code }"
    else = "else { code }"
    switch = "switch (value) { case x: code }"
    
    for_loop = "for (let i=0; i<n; i++) { code }"
    while_loop = "while (condition) { code }"
    for_of = "for (item of array) { code }"
    for_in = "for (key in object) { code }"
}

//////
// FUNCTIONS - THE OLD WAY
//////

Function: description{
    "Trước khi có class, functions được dùng như constructors",
    "Functions có prototype property để implement inheritance",
    "'this' keyword thay đổi tùy ngữ cảnh gọi function"
}{
    constructor: description{
        "Function được gọi với 'new' keyword",
        "Tạo object mới, 'this' trỏ đến object đó",
        "Ngầm định return this"
    }{
        syntax = "function Name(param) { this.prop = param }"
        example = """
        function Person(name) {
            this.name = name
            this.sayHello = function() {
                console.log('Hello ' + this.name)
            }
        }
        const john = new Person('John')
        """
    }

    prototype: description{
        "Cơ chế inheritance trong JS - mọi function có prototype",
        "Methods trong prototype được chia sẻ bởi mọi instances",
        "Tiết kiệm memory so với define methods trong constructor"
    }{
        syntax = "ClassName.prototype.methodName = function() { }"
        example = """
        Person.prototype.sayHello = function() {
            console.log('Hello ' + this.name)
        }
        // Tất cả instances đều có sayHello method
        """
    }
}

//////
// OBJECTS - PRE-CLASS ERA
//////

Object: description{
    "JS objects là collections of key-value pairs",
    "Trước ES6, objects được dùng để mô phỏng classes",
    "Có thể tạo objects với: constructor functions, object literals, Object.create()"
}{
    creation: description{
        "Nhiều cách tạo objects trước khi class syntax ra đời"
    }{
        literal = "{ key: value, method() { } }"
        constructor = "new FunctionName()"
        object_create = "Object.create(prototype)"
    }

    inheritance: description{
        "Prototype chain - objects kế thừa từ prototypes",
        "Khi truy cập property, JS tìm trong object → prototype → prototype chain"
    }{
        example = """
        const animal = { eats: true }
        const rabbit = Object.create(animal)
        console.log(rabbit.eats) // true - inherited
        """
    }
}

//////
// CLASSES - ES6 SYNTAX
//////

Class: description{
    "Syntax sugar trên existing prototype-based inheritance",
    "Không giống class trong Python/C++ - vẫn là prototypes underneath",
    "Không thể gọi class như function (không hoisting)"
}{
    declaration: description{
        "Class declarations không hoisted - phải declare trước khi use"
    }{
        syntax = "class ClassName { ... }"
        example = "class Person { ... }"
    }

    constructor: description{
        "Method đặc biệt - tự động gọi khi tạo instance với new",
        "Dùng để initialize object properties",
        "Mỗi class chỉ có MỘT constructor"
    }{
        syntax = "constructor(parameters) { ... }"
        example = """
        class Person {
            constructor(name) {
                this.name = name  // 'this' là instance
            }
        }
        """
    }

    methods: description{
        "Methods được tự động thêm vào prototype",
        "Chia sẻ bởi mọi instances - tiết kiệm memory",
        "Không cần 'function' keyword trong class"
    }{
        syntax = "methodName() { ... }"
        example = """
        class Person {
            sayHello() {
                console.log('Hello ' + this.name)
            }
        }
        """
    }

    static: description{
        "Static methods/properties thuộc về class, không phải instances",
        "Gọi trực tiếp từ class: ClassName.staticMethod()",
        "Không thể gọi từ instances"
    }{
        syntax = "static methodName() { }"
        example = """
        class MathUtils {
            static add(a, b) { return a + b }
        }
        MathUtils.add(1, 2) // 3
        """
    }

    getters_setters: description{
        "Cho phép access properties nhưng với custom logic",
        "Getters: được gọi khi access property",
        "Setters: được gọi khi assign value to property"
    }{
        syntax = "get propName() { } set propName(value) { }"
        example = """
        class Person {
            constructor(firstName, lastName) {
                this.firstName = firstName
                this.lastName = lastName
            }
            get fullName() {
                return `${this.firstName} ${this.lastName}`
            }
            set fullName(name) {
                [this.firstName, this.lastName] = name.split(' ')
            }
        }
        """
    }
}

//////
// INHERITANCE
//////

Inheritance: description{
    "JS dùng prototype chain, không phải class-based inheritance",
    "'extends' keyword tạo prototype chain giữa classes",
    "'super' keyword để gọi parent class constructor/methods"
}{
    extends: description{
        "Tạo child class kế thừa từ parent class",
        "Child class có access đến tất cả parent methods/properties"
    }{
        syntax = "class Child extends Parent { }"
        example = """
        class Animal {
            constructor(name) {
                this.name = name
            }
            speak() {
                console.log(`${this.name} makes a sound`)
            }
        }

        class Dog extends Animal {
            constructor(name, breed) {
                super(name)  // Gọi parent constructor
                this.breed = breed
            }
        }
        """
    }

    super: description{
        "Gọi parent class constructor/methods",
        "Bắt buộc gọi super() trước khi dùng 'this' trong child constructor",
        "Có thể dùng super.parentMethod() để gọi overridden methods"
    }{
        in_constructor = "super(parentParams)"
        in_methods = "super.parentMethod()"
    }

    method_override: description{
        "Child class có thể override parent methods",
        "Vẫn có thể access parent method với super.methodName()"
    }{
        example = """
        class Dog extends Animal {
            speak() {
                super.speak()  // Gọi parent method
                console.log(`${this.name} barks`)
            }
        }
        """
    }
}

//////
// COMPARISON WITH OTHER LANGUAGES
//////

Comparison: description{
    "JS classes khác biệt đáng kể so với Python/C++ classes"
}{
    vs_python: description{
        "Python: class-based inheritance thực sự",
        "JS: prototype-based với class syntax sugar",
        "Python: multiple inheritance, JS: single inheritance"
    }{
        python_example = """
        class Person:
            def __init__(self, name):
                self.name = name
        """
        js_example = """
        class Person {
            constructor(name) {
                this.name = name
            }
        }
        """
    }

    vs_cpp: description{
        "C++: compile-time inheritance, strict types",
        "JS: runtime inheritance, dynamic types",
        "C++: multiple inheritance, access modifiers",
        "JS: không có access modifiers (public/private/protected)"
    }
}

//////
// PRIVATE FIELDS (ES2022)
//////

PrivateFields: description{
    "Fields/methods chỉ accessible trong class",
    "Prefix với #, phải declare trước khi use"
}{
    syntax = "#privateField"
    example = """
    class Person {
        #secret = 'classified'

        #getSecret() {
            return this.#secret
        }

        reveal() {
            return this.#getSecret()
        }
    }
    """
}
//////
// ARRAYS
//////

Array{
    access = "array[index]"
    length = "array.length"
    
    methods: description{"common array methods"}{
        push = "add to end"
        pop = "remove from end" 
        shift = "remove from start"
        unshift = "add to start"
        map = "transform each item"
        filter = "select items"
        reduce = "accumulate value"
    }
}

//////
// STRINGS
//////

String{
    template = `text ${variable}`
    methods: description{"common string methods"}{
        length = "string.length"
        toUpperCase = "UPPERCASE"
        toLowerCase = "lowercase"
        slice = "extract part"
        split = "string to array"
        includes = "check substring"
    }
}

//////
// ASYNC PROGRAMMING
//////

Async: description{
    "JavaScript xử lý bất đồng bộ để không block main thread",
    "Dùng cho các tác vụ mất thời gian: network requests, file I/O, timers"
}

Async.Callback: description{
    "Function được truyền vào another function như argument",
    "Được gọi lại (called back) khi async operation hoàn thành",
    "Dễ dẫn đến 'callback hell' khi có nhiều async operations liên tiếp"
}{
    pattern = "function(error, data) { }"
    example = "fs.readFile('file.txt', (err, data) => { ... })"
}

Async.Promise: description{
    "Object đại diện cho completion/failure của async operation",
    "Giải quyết vấn đề callback hell với .then() chains",
    "Có 3 states: pending, fulfilled, rejected"
}{
    creation = "new Promise((resolve, reject) => { ... })"
    consumption = "promise.then(result => ...).catch(error => ...)"
    methods = {
        all = "Wait for ALL promises to complete",
        race = "Wait for FIRST promise to settle",
        any = "Wait for FIRST promise to fulfill",
        allSettled = "Wait for ALL promises to settle"
    }
}

Async.AsyncAwait: description{
    "Syntax sugar trên Promises, viết async code giống sync code",
    "Dễ đọc và debug hơn Promise chains",
    "async function luôn trả về Promise",
    "await chỉ hoạt động trong async functions"
}{
    declaration = "async function myFunction() { }"
    usage = "const result = await promise"
    error_handling = "try { await promise } catch (error) { }"
}

Async.EventLoop: description{
    "Cơ chế xử lý bất đồng bộ của JavaScript",
    "Xử lý các tasks theo thứ tự ưu tiên: Call Stack → Microtask Queue → Task Queue"
}{
    microtasks = "Promise callbacks, queueMicrotask() - ưu tiên cao"
    macrotasks = "setTimeout, setInterval, I/O - ưu tiên thấp hơn"
}

Async.Timing: description{
    "Kiểm soát thời điểm thực thi code",
    "Thời gian tính bằng milliseconds"
}{
    setTimeout: description{
        "Thực thi function SAU KHI delay",
        "Chỉ chạy MỘT LẦN",
        "Trả về timeoutID để cancel"
    }{
        syntax = "setTimeout(callback, delayMs)"
        example = "setTimeout(() => console.log('Hello'), 1000)"
    }

    setInterval: description{
        "Thực thi function LIÊN TỤC mỗi interval",
        "Chạy MÃI MÃI cho đến khi bị clear",
        "Trả về intervalID để cancel"
    }{
        syntax = "setInterval(callback, intervalMs)"
        example = "setInterval(() => console.log('Tick'), 1000)"
    }

    clearTimeout = "clearTimeout(timeoutID)"
    clearInterval = "clearInterval(intervalID)"
}

Async.Examples: description{
    "So sánh 3 cách viết async"
}{
    callback_style = """
    getUser(userId, (user) => {
        getPosts(user, (posts) => {
            getComments(posts, (comments) => {
                // callback hell!
            })
        })
    })
    """

    promise_style = """
    getUser(userId)
        .then(user => getPosts(user))
        .then(posts => getComments(posts))
        .then(comments => { ... })
        .catch(error => { ... })
    """

    async_await_style = """
    try {
        const user = await getUser(userId)
        const posts = await getPosts(user)
        const comments = await getComments(posts)
    } catch (error) {
        // handle error
    }
    """
}
//////
// ERROR HANDLING
//////

ErrorHandling{
    try_catch = "try { code } catch (err) { }"
    throw = "throw new Error('message')"
    finally = "finally { cleanup }"
}

//////
// MODULES
//////

Module{
    export = "export function name() { }"
    import = "import { name } from './file.js'"
    default_export = "export default function() { }"
}

//////
// ES6+ FEATURES
//////

ES6{
    destructuring = "const {prop} = obj"
    spread = "...array or ...object"
    rest_parameters = "function(...args) { }"
    optional_chaining = "obj?.property"
    nullish_coalescing = "value ?? defaultValue"
}

Note{
    JS.comment = "// single-line or /* multi-line */"
    JS.comment.shortcut = "Ctrl + /"
}