package;

import haxe.Timer;
import js.Browser;
import js.html.DeviceOrientationEvent;
import js.Zepto;

/**
 * @author seibe
 */
class Main 
{
	private static var glyphs:Array<String> = "❄❅❆".split("");
	private var mobile:Bool;
	
	static function main() 
	{
		new Main();
	}
	
	public function new()
	{
		new Zepto(Browser.document).ready(init);
	}
	
	private function init():Void
	{
		mobile = (Zepto.os.ios || Zepto.os.android || Zepto.os.webos);
		var num:Int = mobile ? 30 : 100;
		
		for (i in 0...num) {
			Timer.delay(addFlake, rand(6*6*6));
		}
		
		Browser.window.ondeviceorientation = function(e:DeviceOrientationEvent):Void {
			if (e.alpha != null) {
				new Zepto('body').css( { 'transform': 'rotate(' + e.alpha + 'deg)' } );
			}
		}
	}
	
	private function rand(max:Float):Int
	{
		return Math.floor(Math.random() * max);
	}
	
	private function addFlake():Void
	{
		var el:Zepto = new Zepto("<div><div>" + glyphs[rand(glyphs.length)] + "</div></div>");
		
		new Zepto("body").append(el);
		el.css({
			left: rand(100)+'%', top: -100-rand(200),
			fontSize: 15+rand(100),
			opacity: 0.5+Math.random()/2
		});
		el.anim( {
			translateY: (Browser.window.innerHeight * (mobile ? 3 : 2)) + rand(Browser.window.innerHeight / 2) + 'px',
			translateX: 50 - rand(100) + 'px',
			rotate: (500-rand(1000))+'deg'
		}, 6 + rand(10), 'linear', function():Void { addFlake(); el.remove(); } );
	}
	
}
