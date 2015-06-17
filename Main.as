package {
	
	import flash.display.MovieClip;
	
	
	public class Main extends MovieClip {
		
		private var sceneManager:SceneManager;
		
		public function Main() {
			trace("init BoxDivision");
			sceneManager = SceneManager.getInstance()
			sceneManager.init();
			this.addChild(sceneManager);
			
			var startScreen:StartScreen = new StartScreen();
			var gameScreen:GameScreen = new GameScreen();
			var scoreScreen:ScoreScreen = new ScoreScreen();
			var splashScreen:SplashScreen = new SplashScreen();
			
			sceneManager.add(SceneConstants.SPLASH_SCENE, splashScreen, new SplashScene());
			sceneManager.add(SceneConstants.START_SCENE, startScreen, new StartScene());
			sceneManager.add(SceneConstants.GAME_SCENE, gameScreen, new GameScene());
			sceneManager.add(SceneConstants.SCORE_SCENE, scoreScreen, new ScoreScene());
			sceneManager.changeScene(SceneConstants.SPLASH_SCENE);
		}
	}
	
}
