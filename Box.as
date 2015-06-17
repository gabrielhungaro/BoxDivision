package  {
	import flash.display.MovieClip;
	import flash.display.BlendMode;
	import flash.geom.ColorTransform;
	import flash.display.Graphics;
	
	public class Box extends MovieClip{
		
		private var initVel:Number;
		private var xVelocity:Number;
		private var yVelocity:Number;
		private var clickedTimes:int = 0;
		private var velocityMultiplier:Number = 1.2;
		private var initLineColor:uint = 0x00FF00;
		private var rColor:uint = 1;
		private var gColor:uint = 255;
		private var bColor:uint = 0;
		private var collider:Collider;
		private var top:int;
		private var botton:int;
		private var left:int;
		private var right:int;
		
		public function Box(_x:Number,_y:Number, _width:Number, _height:Number, _color:uint, _alpha:Number, _xVel:Number, _yVel:Number) {
			initVel = _xVel;
			xVelocity = _xVel;
			yVelocity = _yVel;
			this.graphics.beginFill(_color, _alpha);
			//this.graphics.lineStyle(3, initLineColor);
			//this.graphics.lineStyle(3, ColorController.getInstance().combineRGB(rColor,gColor,bColor));
			this.graphics.drawRect(0, 0, _width, _height);
			this.graphics.endFill();
			this.x = _x;
			this.y = _y;
			createCollider();
			//this.blendMode = BlendMode.INVERT;
			updateBoundBox();
		}
		
		private function changeColor(r:uint, g:uint, b:uint):void
		{
			this.alpha *= .5;
			/*this.graphics.clear();
			this.graphics.beginFill(this.transform.colorTransform.color, this.alpha);
			this.graphics.lineStyle(3, ColorController.getInstance().combineRGB(r,g,b));
			this.graphics.drawRect(0, 0, this.width, this.height);*/
			/*var newColor:ColorTransform = new ColorTransform();
			newColor.color = ColorController.getInstance().combineRGB(r, g, b);
			this.transform.colorTransform = newColor;*/
		}
		
		public function divideBox():void
		{
			//this.alpha *= .5;
			clickedTimes++;
			this.scaleX = this.scaleX/2;
			this.scaleY = this.scaleY/2;
			xVelocity *= velocityMultiplier;
			yVelocity *= velocityMultiplier;
			updateBoundBox();
			changeColor(rColor*(gColor/clickedTimes),gColor/clickedTimes, bColor);
		}
		
		private function updateBoundBox():void
		{
			top = 0;
			left = 0;
			botton = this.height;
			right = this.width;
			trace(top, left, botton, right);
		}
		
		public function invertXDirection():void
		{
			xVelocity *= -1;
		}
		
		public function invertYDirection():void
		{
			yVelocity *= -1;
		}
		
		public function setClickedTimes(value:int):void
		{
			clickedTimes = value;
		}
		
		public function getClickedTimes():int
		{
			return clickedTimes;
		}
		
		public function getXVeloity():Number
		{
			return xVelocity;
		}
		
		public function getYVeloity():Number
		{
			return yVelocity;
		}
		
		public function getVelMultiplier():Number
		{
			return velocityMultiplier;
		}
		
		public function getCollider():

	}
	
}
