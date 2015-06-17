package  {
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class SplashScene extends AScene{

		public function SplashScene() {
			// constructor code
		}
		
		public override function init():void
		{
			super.init();
		}
		
		public override function update(event:Event):void
		{
			if(asset.currentFrame == asset.totalFrames){
				this.changeScene(SceneConstants.START_SCENE);
			}
		}

	}
	
}
