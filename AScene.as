package  {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Scene;
	
	public class AScene extends Sprite{
		
		protected var asset:MovieClip;
		protected var sceneManager:SceneManager;
		protected var withUpdate:Boolean;
		
		public function AScene() {
			// constructor code
		}
		
		public function init():void
		{
			trace("init scene");
			if(asset){
				this.addChild(asset);
			}
		}
		
		protected function changeScene(sceneName:String):void
		{
			sceneManager.changeScene(sceneName);
		}
		
		public function update(event:Event):void
		{
			
		}
		
		public function destroy():void
		{
			if(asset){
				this.removeChild(asset);
			}
		}
		
		public function setAsset(value:MovieClip):void
		{
			asset = value;
		}
		
		public function getAsset():MovieClip
		{
			return asset;
		}
		
		public function setManager(value:SceneManager):void
		{
			sceneManager = value;
		}
		
		public function setName(value:String):void
		{
			name = value;
		}
		
		public function getName():String
		{
			return name;
		}

	}
	
}
