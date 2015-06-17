package  {
	import flash.net.SharedObject;
	
	public class AScore {
		
		private static var instance:AScore;
		private var score:int;
		private var maxScore:int;
		private var sharedObject:SharedObject;
		
		public function AScore() {
			sharedObject = SharedObject.getLocal("BoxDivision");
			if(sharedObject.data.score == undefined){
				sharedObject.data.score = 0;
				sharedObject.close();
				sharedObject.flush();
			}
		}
		
		public static function getInstance():AScore{
			if(!instance){
				instance = new AScore();
			}
			return instance;
		}
		
		public function setScore(value:int):void
		{
			score = value;
		}
		
		public function getScore():int
		{
			return score;
		}
		
		public function setMaxScore(value:int):void
		{
			maxScore = value;
			sharedObject.data.score = maxScore;
			sharedObject.close();
			sharedObject.flush();
		}
		
		public function getMaxScore():int
		{
			maxScore = sharedObject.data.score;
			return maxScore;
		}
	}
	
}
