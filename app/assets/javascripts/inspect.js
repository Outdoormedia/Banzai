// From the console command line, enter
// "Inspect.methods(foo)" and you get a dump of all the methods on the object foo,
// "Inspect.properties(foo)" and you get a dump of the properties.
//
//  Set a hash up this way
// 	Inspect = window.Inspect 
//      window.MenuStates = {oma_plan_menu: 'hidden'} 
// then can test window.MenuStates.oma_plan_menu == 'hidden'

var Inspect = {
    TYPE_FUNCTION: 'function',
    // Returns an array of (the names of) all methods
    methods: function(obj) {
        var testObj = obj || self;
        var methods = [];
        for (prop in testObj) {
            if (typeof testObj[prop] == Inspect.TYPE_FUNCTION && typeof Inspect[prop] != Inspect.TYPE_FUNCTION) {
                methods.push(prop);
            }
        }
        return methods;
    },
    // Returns an array of (the names of) all properties
    properties: function(obj) {
        var testObj = obj || self;
        var properties = [];
        for (prop in testObj) {
            if (typeof testObj[prop] != Inspect.TYPE_FUNCTION && typeof Inspect[prop] != Inspect.TYPE_FUNCTION) {
                properties.push(prop);
            }
        }
        return properties;
    }
}

window.Inspect = Inspect
