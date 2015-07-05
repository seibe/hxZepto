package js;

import js.html.DOMWindow;
import js.html.Element;
import js.html.Event;
import js.html.HTMLDocument;
import js.html.Node;
import js.html.TouchEvent;
import js.html.MouseEvent;
import js.html.XMLHttpRequest;

typedef ZeptoOffset = { top:Int, left:Int, width:Int, height:Int };

extern class ZeptoEvent extends Event
{
	public function isDefaultPrevented():Bool;
	public function isImmediatePropagationStopped():Bool;
	public function isPropagationStopped():Bool;
}
extern class ZeptoMouseEvent extends MouseEvent
{
	public function isDefaultPrevented():Bool;
	public function isImmediatePropagationStopped():Bool;
	public function isPropagationStopped():Bool;
}
extern class ZeptoTouchEvent extends TouchEvent
{
	public function isDefaultPrevented():Bool;
	public function isImmediatePropagationStopped():Bool;
	public function isPropagationStopped():Bool;
}

typedef ZeptoAjaxEvent = ZeptoEvent;
typedef ZeptoSelf = Zepto;
typedef ZeptoCollection = Zepto;

extern class ZeptoXhr extends XMLHttpRequest
{
	function done(callback:Dynamic->String->XMLHttpRequest->Void):ZeptoXhr;
	function fail(callback:XMLHttpRequest->String->Dynamic->Void):ZeptoXhr;
	function always():ZeptoXhr;
	function then():ZeptoXhr;
}

extern class ZeptoHelper {
	@:overload(function(z:Zepto):Zepto{})
	@:overload(function(z:DOMWindow):Zepto{})
	@:overload(function(z:Element):Zepto{})
	public static inline function _(selector:String):Zepto {
		return new Zepto(selector);
	}
}

@:initPackage
extern class Zepto implements ArrayAccess<Element>
{
	// constructor
	@:overload(function(z:Zepto):Void{})
	@:overload(function(z:DOMWindow):Void{})
	@:overload(function(z:HTMLDocument):Void{})
	@:overload(function(z:Element):Void{})
	function new(html:String):Void;
	
	// core
	static function camelCase(string:String):String;
	static function contains(parent:Element, node:Element):Bool;
	//static function each(collection:ZeptoCollection, it:Int->Element->Void):ZeptoCollection;
	
	@:overload(function(deep:Bool, target:Dynamic, ?source:Dynamic, ?source2:Dynamic):Dynamic{})
	static function extend(target:Dynamic, ?source:Dynamic, ?source2:Dynamic):Dynamic;
	
	static var fn(default, null):ZeptoCollection;
	static function grep(items:Array<Dynamic>, callback:Dynamic->Bool):Array<Dynamic>;
	
	@:overload(function(object:Dynamic):Bool{})
	static function inArray(element:Dynamic, array:Array<Dynamic>, ?fromIndex:Int):Int;
	
	static function isFunction(object:Dynamic):Bool;
	static function isPlainObject(object:Dynamic):Bool;
	static function isWindow(object:Dynamic):Bool;
	//static function map(collection:ZeptoCollection, it:Element->Int->Dynamic):ZeptoCollection;
	static function parseJSON(string:String):{};
	static function trim(string:String):String;
	static function type(object:Dynamic):String;
	
	function add(selector:String, ?context:Element):ZeptoSelf;
	
	@:overload(function(it:Int->String->String):ZeptoSelf{})
	function addClass(name:String):ZeptoSelf;
	
	function after(content:Dynamic):ZeptoSelf;
	function append(content:Dynamic):ZeptoSelf;
	function appendTo(target:String):ZeptoSelf;
	
	@:overload(function(name:String, it:Int->String->String):ZeptoSelf{})
	@:overload(function(name:String, value:String):ZeptoSelf{})
	function attr(name:String):String;
	
	function before(content:Dynamic):ZeptoSelf;
	
	@:overload(function(selector:String):ZeptoCollection{})
	function children():ZeptoCollection;
	
	function clone():ZeptoCollection;
	
	@:overload(function(element:Element):ZeptoCollection{})
	@:overload(function(collection:Zepto):ZeptoCollection{})
	function closest(selector:String, ?context:Element):ZeptoCollection;
	
	function contents():ZeptoCollection;
	
	@:overload(function(map:{}):Zepto{})
	@:overload(function(property:String, value:String):ZeptoSelf{})
	@:overload(function(properties:Array<String>):Dynamic{})
	function css(property:String):String;
	
	@:overload(function(name:String, value:String):ZeptoSelf{})
	function data(name:String):String;
	
	function each(it:Int->Element->Void):ZeptoSelf;
	function empty():ZeptoSelf;
	function eq(index:Int):ZeptoCollection;
	
	@:overload(function(it:Int->Bool):ZeptoCollection{})
	function filter(selector:String):ZeptoCollection;
	
	@:overload(function(element:Element):ZeptoCollection{})
	@:overload(function(collection:Zepto):ZeptoCollection{})
	function find(selector:String):ZeptoCollection;
	
	function first():ZeptoCollection;
	function forEach(it:Element->Int->Dynamic->Bool, ?context:Element):Void;
	
	@:overload(function(index:Int):Node{})
	function get():Array<Node>;
	
	@:overload(function(node:Node):ZeptoCollection{})
	function has(selector:String):ZeptoCollection;
	
	function hasClass(name:String):Zepto;
	
	@:overload(function(it:Int->Int->Int):ZeptoSelf{})
	@:overload(function(value:Int):ZeptoSelf{})
	function height():Int;
	
	function hide():ZeptoSelf;
	
	@:overload(function(it:Int->String->String):ZeptoSelf{})
	@:overload(function(content:Dynamic):ZeptoSelf{})
	function html():String;
	
	function index(?element:Element):Int;
	function indexOf(element:Element, ?fromIndex:Int):Int;
	function insertAfter(target:String):ZeptoSelf;
	function insertBefore(target:String):ZeptoSelf;
	function is(selector:String):Bool;
	function last():ZeptoCollection;
	function map(it:Int->Element->Dynamic):ZeptoCollection;
	function next(?selector:String):ZeptoCollection;
	
	@:overload(function(it:Int->Bool):ZeptoCollection{})
	@:overload(function(collection:Zepto):ZeptoCollection{})
	function not(selector:String):ZeptoCollection;
	
	@:overload(function(it:Int->ZeptoOffset->ZeptoOffset):ZeptoSelf{})
	@:overload(function(coordinates:Dynamic):ZeptoSelf{})
	function offset():ZeptoOffset;
	
	function offsetParent():ZeptoCollection;
	function parent(?selector:String):ZeptoCollection;
	function parents(?selector:String):ZeptoCollection;
	function pluck(property:String):Array<String>;
	function position():{ top:Int, left:Int };
	function prepend(content:Dynamic):ZeptoSelf;
	function prependTo(target:String):ZeptoSelf;
	function prev(?selector:String):ZeptoCollection;
	
	@:overload(function(name:String, it:Int->String->String):ZeptoSelf{})
	@:overload(function(name:String, value:String):ZeptoSelf{})
	function prop(name:String):String;
	
	function push(element:Dynamic, ?element2:Dynamic, ?element3:Dynamic):ZeptoSelf;
	function ready(callback:Void->Void):ZeptoSelf;
	function reduce(callcback:Dynamic->Element->Int->Dynamic, initial:Dynamic):Dynamic;
	function remove():ZeptoSelf;
	function removeAttr(name:String):ZeptoSelf;
	
	@:overload(function(it:Int->String->String):ZeptoSelf{})
	function removeClass(?name:String):ZeptoSelf;
	
	function replaceWidth(content:Dynamic):ZeptoSelf;
	
	@:overload(function(value:Int):ZeptoSelf{})
	function scrollLeft():Int;
	
	@:overload(function(value:Int):ZeptoSelf{})
	function scrollTop():Int;
	
	function show():ZeptoSelf;
	function siblings(?selector:String):ZeptoCollection;
	function size():Int;
	function slice(start:Int, ?end:Int):Array<Dynamic>;
	
	@:overload(function(it:Int->String->String):ZeptoSelf{})
	@:overload(function(content:Dynamic):ZeptoSelf{})
	function text():String;
	
	function toggle(?setting:Bool):ZeptoSelf;
	
	@:overload(function(it:Int->String->String, ?setting:Bool):ZeptoSelf{})
	function toggleClass(names:String, ?setting:Bool):ZeptoSelf;
	
	function unwrap():ZeptoSelf;
	
	@:overload(function(it:Int->String->String, ?setting:Bool):ZeptoSelf{})
	@:overload(function(value:String):ZeptoSelf{})
	function val():String;
	
	@:overload(function(it:Int->Int->Int):ZeptoSelf{})
	@:overload(function(value:Int):ZeptoSelf{})
	function width():Int;
	
	@:overload(function(it:Int->String):ZeptoSelf{})
	function wrap(structure:String):ZeptoSelf;
	
	function wrapAll(structure:String):ZeptoSelf;
	
	@:overload(function(it:Int->String):ZeptoSelf{})
	function wrapInner(structure:String):ZeptoSelf;
	
	// Detect
	static var os(default, null): {
		phone:Bool, tablet:Bool,
		ios:Bool, android:Bool, webos:Bool, blackberry:Bool, bb10:Bool, rimtabletos:Bool,
		iphone:Bool, ipad:Bool, ipod:Bool, touchpad:Bool, kindle:Bool,
		version:String
	};
	static var browser(default, null): {
		chrome:Bool, firefox:Bool, safari:Bool, webview:Bool, silk:Bool, playbook:Bool, ie:Bool,
		version:String
	};
	
	// Event
	static function Event(type:String, properties:Dynamic):ZeptoEvent;
	
	@:overload(function(context:Dynamic, property:Dynamic, ?addtionalArgment:Dynamic):Dynamic{})
	static function proxy(fn:Dynamic, context:Dynamic, ?addtionalArgment:Dynamic):Dynamic;
	
	@:overload(function(?type:String, ?selector:String):ZeptoSelf{})
	@:overload(function(type:String, selector:String, callback:ZeptoEvent->Void):ZeptoSelf{})
	function off(type:String, callback:ZeptoEvent->Void):ZeptoSelf;
	
	@:overload(function(type:String, callback:ZeptoAjaxEvent->XMLHttpRequest->Dynamic->Dynamic->Void):ZeptoSelf{})
	@:overload(function(type:String, callback:ZeptoAjaxEvent->XMLHttpRequest->Dynamic->Void):ZeptoSelf{})
	@:overload(function(type:String, selector:String, callback:ZeptoEvent->Void):ZeptoSelf{})
	@:overload(function(type:String, callback:ZeptoTouchEvent->Void):ZeptoSelf{})
	@:overload(function(type:String, callback:ZeptoMouseEvent->Void):ZeptoSelf{})
	function on(type:String, callback:ZeptoEvent->Void):ZeptoSelf;
	
	@:overload(function(type:String, selector:String, callback:ZeptoEvent->Void):ZeptoSelf{})
	function one(type:String, callback:ZeptoEvent->Void):ZeptoSelf;
	
	function trigger(event:String, ?args:Array<Dynamic>):ZeptoSelf;
	function triggerHandler(event:String, ?args:Array<Dynamic>):ZeptoSelf;
	
	// Ajax
	static function ajax(options:{
		?type:String,
		?url:String,
		?data:Dynamic,
		?processData:Bool,
		?contentType:String,
		?mimeType:String,
		?dataType:String,
		?jsonp:String,
		?jsonpCallback:Dynamic,
		?timeout:Int,
		?headers:Dynamic,
		?async:Bool,
		?global:Bool,
		?context:Element,
		?traditional:Bool,
		?cache:Bool,
		?xhrFields:XMLHttpRequest,
		?username:String,
		?password:String,
		?beforeSend:XMLHttpRequest->Dynamic->Void,
		?success:Dynamic->String->XMLHttpRequest->Void,
		?error:XMLHttpRequest->String->Dynamic->Void,
		?complete:XMLHttpRequest->String->Void
	}):ZeptoXhr;
	static function ajaxSettings(options:{
		?timeout:Int,
		?global:Bool,
		?xhr:XMLHttpRequest,
		?accepts:String
	}):Void;
	
	//@:overload(function(url:String, data:Dynamic, callback:Dynamic->String->XMLHttpRequest->Void, ?dataType:String):ZeptoXhr{})
	//static function get(url:String, callback:Dynamic->String->XMLHttpRequest->Void, ?dataType:String):ZeptoXhr;
	
	@:overload(function(url:String, data:Dynamic, callback:Dynamic->String->XMLHttpRequest->Void):ZeptoXhr{})
	static function getJSON(url:String, callback:Dynamic->String->XMLHttpRequest->Void):ZeptoXhr;
	
	@:overload(function(array:Array<Dynamic>):String{})
	static function param(object:Dynamic, ?shallow:Bool):String;
	
	@:overload(function(url:String, data:Dynamic, callback:Dynamic->String->XMLHttpRequest->Void):ZeptoXhr{})
	static function post(url:String, callback:Dynamic->String->XMLHttpRequest->Void):ZeptoXhr;
	
	function load(url:String, callback:Dynamic->String->XMLHttpRequest->Void):ZeptoSelf;
	
	// Form
	function serialize():String;
	function serializeArray():Array<Dynamic>;
	function submit(?callback:ZeptoEvent->Void):ZeptoSelf;
	
	// Effects
	static var fx(default, null):{ off:Bool, speeds:Dynamic };
	
	@:overload(function(animationName:String, options:{duration:Int, easing:String, complete:Void->Void}):ZeptoSelf{})
	@:overload(function(properties:Dynamic, options:{duration:Int, easing:String, complete:Void->Void}):ZeptoSelf{})
	function animate(properties:Dynamic, ?duration:Int, ?easing:String, ?complete:Void->Void):ZeptoSelf;
	
	@:overload(function(animationName:String, options:{duration:Int, easing:String, complete:Void->Void}):ZeptoSelf{})
	@:overload(function(properties:Dynamic, options:{duration:Int, easing:String, complete:Void->Void}):ZeptoSelf{})
	function anim(properties:Dynamic, ?duration:Int, ?easing:String, ?complete:Void->Void):ZeptoSelf;
	
	// Touch
	function tap(callback:ZeptoTouchEvent->Void):ZeptoSelf;
	function singleTap(callback:ZeptoTouchEvent->Void):ZeptoSelf;
	function doubleTap(callback:ZeptoTouchEvent->Void):ZeptoSelf;
	function longTap(callback:ZeptoTouchEvent->Void):ZeptoSelf;
	function swipe(callback:ZeptoTouchEvent->Void):ZeptoSelf;
	function swipeLeft(callback:ZeptoTouchEvent->Void):ZeptoSelf;
	function swipeRight(callback:ZeptoTouchEvent->Void):ZeptoSelf;
	function swipeUp(callback:ZeptoTouchEvent->Void):ZeptoSelf;
	function swipeDown(callback:ZeptoTouchEvent->Void):ZeptoSelf;
	
	
	//
	static var cur(get, null):Zepto;
	private static inline function getCur():Zepto {
		return untyped $(__js__("this"));
	}

	private static function __init__() : Void untyped {
		var q : Dynamic = (untyped js.Browser.window).Zepto;
		untyped __js__("var js = js || {}");
		js["Zepto"] = q;
	}
}