package  {
	import flash.display.MovieClip;
	
	public class Collider {
		
		private var obj:MovieClip;
		public var top:Number;
		public var botton:Number;
		public var left:Number;
		public var right:Number;
		
		public function Collider(value:MovieClip) {
			obj = value;
			top = 0;
			left = 0;
			botton = obj.height;
			right = obj.width;
		}
		
		public function update():void
		{
			top = 0;
			left = 0;
			botton = obj.height;
			right = obj.width;
		}

	}
	
}
