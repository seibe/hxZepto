(function (console) { "use strict";
var Main = function() {
	new js.Zepto(window.document).ready($bind(this,this.init));
};
Main.main = function() {
	new Main();
};
Main.prototype = {
	init: function() {
		this.mobile = js.Zepto.os.ios || js.Zepto.os.android || js.Zepto.os.webos;
		var num;
		if(this.mobile) num = 30; else num = 100;
		var _g = 0;
		while(_g < num) {
			var i = _g++;
			haxe_Timer.delay($bind(this,this.addFlake),this.rand(216));
		}
		window.ondeviceorientation = function(e) {
			if(e.alpha != null) new js.Zepto("body").css({ 'transform' : "rotate(" + e.alpha + "deg)"});
		};
	}
	,rand: function(max) {
		return Math.floor(Math.random() * max);
	}
	,addFlake: function() {
		var _g = this;
		var el = new js.Zepto("<div><div>" + Main.glyphs[this.rand(Main.glyphs.length)] + "</div></div>");
		new js.Zepto("body").append(el);
		el.css({ left : this.rand(100) + "%", top : -100 - this.rand(200), fontSize : 15 + this.rand(100), opacity : 0.5 + Math.random() / 2});
		el.anim({ translateY : window.innerHeight * (this.mobile?3:2) + this.rand(window.innerHeight / 2) + "px", translateX : 50 - this.rand(100) + "px", rotate : 500 - this.rand(1000) + "deg"},6 + this.rand(10),"linear",function() {
			_g.addFlake();
			el.remove();
		});
	}
};
var haxe_Timer = function(time_ms) {
	var me = this;
	this.id = setInterval(function() {
		me.run();
	},time_ms);
};
haxe_Timer.delay = function(f,time_ms) {
	var t = new haxe_Timer(time_ms);
	t.run = function() {
		t.stop();
		f();
	};
	return t;
};
haxe_Timer.prototype = {
	stop: function() {
		if(this.id == null) return;
		clearInterval(this.id);
		this.id = null;
	}
	,run: function() {
	}
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
var q = window.Zepto;
var js = js || {}
js.Zepto = q;
Main.glyphs = "❄❅❆".split("");
Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});
