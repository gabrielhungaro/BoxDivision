package  {
	
	public class ColorController {
		
		private static var instance:ColorController
		private var baseColor:uint;
		private var rColor:uint = 20;
		private var gColor:uint = 150;
		private var bColor:uint = 200;
		
		public function ColorController() {
			// constructor code
		}
		
		public static function getInstance():ColorController
		{
			if(!instance){
				instance = new ColorController();
			}
			return instance;
		}
		
		public function changeColor(colorMultiplier:int):uint
		{
			return combineRGB(rColor*0.5, gColor*0.5, bColor*0.5);
		}
		
		public function combineRGB(r:uint, g:uint, b:uint):uint
		{
			return ( ( r << 16 )  | ( g << 8 ) | b );
		}
		
		public function getBaseColor():uint
		{
			return combineRGB(rColor, gColor, bColor);
		}
		
		public function getRGBbyHEX(value:uint):Object
		{
			var color:Object = new Object();
			color.r = new uint();
			color.g = new uint();
			color.b = new uint();
			color.r = ( ( value >> 16 ) & 0xFF );
			color.g = ( ( value >> 8 ) & 0xFF );
			color.b = ( value & 0xFF );
			trace(color.r);
			trace(color.g);
			trace(color.b);
			return color;
		}

	}
	
}
