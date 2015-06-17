package  {
	import flash.events.MouseEvent;
	
	public class StartScene extends AScene{

		public function StartScene() {
			// constructor code
		}
		
		public override function init():void
		{
			super.init();
			
			asset.startBtn.buttonMode = true;
			asset.startBtn.addEventListener(MouseEvent.CLICK, onClickStart);
			asset.startBtn.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			asset.startBtn.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}
		
		private function onClickStart(event:MouseEvent):void
		{
			changeScene(SceneConstants.GAME_SCENE);
		}
		
		private function onMouseOver(event:MouseEvent):void
		{
			event.currentTarget.gotoAndStop(2);
		}
		
		private function onMouseOut(event:MouseEvent):void
		{
			event.currentTarget.gotoAndStop(1);
		}

	}
	
}
