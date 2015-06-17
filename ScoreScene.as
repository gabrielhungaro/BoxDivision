package  {
	import flash.events.MouseEvent;
	
	public class ScoreScene extends AScene{

		public function ScoreScene() {
			// constructor code
		}
		public override function init():void
		{
			super.init();
			
			asset.scoreText.text = AScore.getInstance().getScore().toString();
			asset.maxScoreText.text = AScore.getInstance().getMaxScore().toString();
			
			asset.playAgainBtn.buttonMode = true;
			asset.playAgainBtn.addEventListener(MouseEvent.CLICK, onClickPlayAgain);
			asset.playAgainBtn.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			asset.playAgainBtn.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}
		
		private function onClickPlayAgain(event:MouseEvent):void
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
