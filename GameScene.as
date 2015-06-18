package  {
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.display.BlendMode;
	
	public class GameScene extends AScene{
		
		private var initScale:int;
		private var initColor:uint;
		private var initVel:int;
		private var initAlpha:Number;
		private var vectorOfBoxes:Vector.<Box>;
		private var score:int;
		private var seconds:int;
		private var minutes:int;
		private var count:int;
		private var baseScore:int;
		private var timeToAdd:Number;
		private var numberOfInitBoxes:int;
		private var clicksToDestroyBox:int;
		private var collisionBeetwenBoxes:Boolean;
		
		public function GameScene() {
			// constructor code
		}
		
		public override function init():void
		{
			super.init();
			
			initVariables();
			
			vectorOfBoxes = new Vector.<Box>();
			for(var i:int=0; i<numberOfInitBoxes; i++){
				
				createBox(getRandomPosition().x,
						  getRandomPosition().y,
						  initScale,
						  initScale,
						  initColor,
						  initAlpha,
						  initVel,
						  initVel);
			}
		}
		
		private function initVariables():void
		{
			initScale = 100;
			initColor = ColorController.getInstance().getBaseColor();
			initVel = 4;
			initAlpha = 1;
			vectorOfBoxes = null;
			score = 0;
			seconds = 59;
			minutes = 2;
			count;
			baseScore = 10;
			timeToAdd = 5;
			numberOfInitBoxes = 2;
			clicksToDestroyBox = 3;
			collisionBeetwenBoxes = true;
			AScore.getInstance().setScore(score);
		}
		
		private function getRandomPosition():Point
		{
			var posX:Number;
			var posY:Number;
			posX = Math.ceil(Math.random() * (asset.width-initScale*2)) + initScale;
			posY = Math.ceil(Math.random() * (asset.height-initScale*2)) + initScale;
			var randomPoint:Point = new Point(posX, posY);
			return randomPoint;
		}
		
		private function createBox(_x:Number, _y:Number, _width:Number, _height:Number, _color:uint, _alpha:Number, _xVel:Number, _yVel:Number):Box
		{
			var box:Box = new Box(_x, _y, _width, _height, _color, _alpha, _xVel, _yVel);
			this.addChild(box);
			vectorOfBoxes.push(box);
			box.addEventListener(MouseEvent.CLICK, onClickBox);
			return box;
		}
		
		private function onClickBox(event:Event):void
		{
			var box:Box = event.currentTarget as Box;
			box.divideBox();
			addScore(Math.ceil(box.getVelMultiplier()));
			
			var xVel:Number = (box.getXVeloity() * (-1));
			var yVel:Number = (box.getYVeloity() * (-1));
			if(box.getClickedTimes() == clicksToDestroyBox){
				destroyBox(box);
			}else{
				createBox(box.x, box.y, box.width, box.height, ColorController.getInstance().changeColor(box.getClickedTimes()), initAlpha, xVel, yVel).setClickedTimes(box.getClickedTimes());
			}
			
			updateScoreHUD();
		}
		
		private function destroyBox(box:Box):void
		{
			removeBox(box);
			var xVel:Number = (box.getXVeloity() * (-1));
			var yVel:Number = (box.getYVeloity() * (-1));
			createBox(getRandomPosition().x, getRandomPosition().y, initScale, initScale, initColor, initAlpha, xVel, yVel);
			addTime();
			addScore(Math.ceil(box.getVelMultiplier()));
		}
		
		private function removeBox(box:Box):void
		{
			this.removeChild(box);
			vectorOfBoxes.splice(vectorOfBoxes.indexOf(box),1);
		}
		
		private function addScore(multiplier:Number):void
		{
			(multiplier < 0) ? multiplier *= -1 : multiplier = multiplier;
			score += baseScore*multiplier;
		}
		
		private function updateScoreHUD():void
		{
			asset.scoreText.text = score.toString();
		}
		
		private function controlTime():void
		{
			count++;
			if(count >= 24){
				seconds--;
				count = 0;
			}
			if(minutes == 0 && seconds <= 0){
				endGame();
			}
			if(seconds <= 0){
				minutes--;
				seconds = 59;
			}
			if(seconds > 59){
				minutes++;
				seconds = seconds - 59;
			}
			updateTimeHUD();
		}
		
		private function addTime():void
		{
			seconds += timeToAdd;
		}
		
		private function updateTimeHUD():void
		{
			var minutesStr:String;
			var secondsStr:String;
			minutesStr = minutes.toString();
			if(minutes < 10){
				minutesStr = "0" + minutes.toString();
			}
			secondsStr = seconds.toString();
			if(seconds < 10){
				secondsStr = "0" + seconds.toString();
			}
			asset.timeText.text = minutesStr + ":" + secondsStr;
		}
		
		public override function update(event:Event):void
		{
			controlTime();
			
			verifyBoxPosition();
			moveBoxes();
		}
		
		private function moveBoxes():void
		{
			if(vectorOfBoxes){
				for(var i:int = 0; i<vectorOfBoxes.length; i++){
					if(vectorOfBoxes[i]){
						vectorOfBoxes[i].x += vectorOfBoxes[i].getXVeloity();
						vectorOfBoxes[i].y += vectorOfBoxes[i].getYVeloity();
					}
				}
			}
		}
		
		public function verifyBoxPosition():void
		{
			for(var i:int = 0; i<vectorOfBoxes.length; i++){
				if(vectorOfBoxes[i]){
					if(vectorOfBoxes[i].x >= asset.width - vectorOfBoxes[i].width || vectorOfBoxes[i].x <= asset.x){
						vectorOfBoxes[i].invertXDirection();
					}
					if(vectorOfBoxes[i].y >= asset.height - vectorOfBoxes[i].height || vectorOfBoxes[i].y <= asset.y){
						vectorOfBoxes[i].invertYDirection();
					}
					for(var j:int=0; j <vectorOfBoxes.length; j++){
						
					}
				}
			}
		}
		
		private function endGame():void
		{
			AScore.getInstance().setScore(score);
			if(score > AScore.getInstance().getMaxScore()){
				AScore.getInstance().setMaxScore(score);
			}
			changeScene(SceneConstants.SCORE_SCENE);
		}
	}
	
}
