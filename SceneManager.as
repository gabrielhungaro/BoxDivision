package  {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class SceneManager extends Sprite{
		
		public static var _instance:SceneManager;
		private var vectorOfScenes:Vector.<AScene>;
		private var currentSceneName:String;
		private var currentAScene:AScene;
		private var sceneTransition:Boolean = true;
		
		public function SceneManager() {
			//initialize();
		}
		
		public static function getInstance():SceneManager{
			if(!_instance){
				_instance = new SceneManager();
			} 
			return _instance;
		}
		
		public function init():void
		{
			trace("init SceneManager");
			vectorOfScenes = new Vector.<AScene>();
			this.addEventListener(Event.ENTER_FRAME,update);
		}
		
		private function update(event:Event):void
		{
			if(currentAScene){
				currentAScene.update(event);
			}
		}
		
		public function add(sceneName:String, sceneAsset:MovieClip, scene:AScene):void
		{
			scene.setAsset(sceneAsset);
			scene.setName(sceneName);
			scene.setManager(this);
			vectorOfScenes.push(scene);
		}
		
		public function changeScene(sceneName:String):void
		{
			if(currentSceneName != sceneName){
				if(currentAScene){
					currentAScene.destroy();
					this.removeChild(currentAScene);
					currentAScene = null;
				}
				currentAScene = getSceneByName(sceneName);
				currentSceneName = currentAScene.getName();
				currentAScene.init();
				this.addChild(currentAScene);
			}else{
				return;
			}
		}
		
		public function getSceneByName(sceneName:String):AScene
		{
			for(var i:int=0; i<vectorOfScenes.length; i++){
				if(vectorOfScenes[i].getName() == sceneName){
					return vectorOfScenes[i];
				}
			}
			return null;
		}
	}
	
}
