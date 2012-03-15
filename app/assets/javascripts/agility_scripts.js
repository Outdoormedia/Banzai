
// Bind model to element's HTML content
var message = $$({txt:"I'm text from a model"}, '<div data-bind="txt"/>');
$$.document.append(txt_message);

// Bind model to element's attribute
var url = 'http://google.com/favicon.ico';
var icon = $$({path:url}, '<p>Image src from model: <img data-bind="src=path"/></p>');
$$.document.append(icon);

var check = $$(
  {a:false, b:true},
  "<div> \
      <input type='checkbox' name='test' data-bind='a'/> checked: <span data-bind='a'/><br/> \
      <input type='checkbox' name='test' data-bind='b'/> checked: <span data-bind='b'/><br/> \
   </div>"
);
$$.document.append(check);