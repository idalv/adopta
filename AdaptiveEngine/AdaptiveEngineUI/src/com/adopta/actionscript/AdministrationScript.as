// ActionScript file

	import com.adopta.actionscript.ApplicationContext;
	import com.adopta.component.AdministrationComponent;
	import com.adopta.service.generated.AdaptiveEngineService;
	import com.adopta.service.generated.ReadCoursePortfolios;
	import com.adopta.service.generated.ReadCoursePortfoliosResultEvent;
	import com.adopta.service.generated.SaveCoursePortfolios;
	import com.adopta.service.generated.SaveCoursePortfoliosResultEvent;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
    
    // Declare an instance of the generated web service class.
    public var adaptiveEngineService:AdaptiveEngineService;
    
    /**
    * In the initApp() method we will create a new web service object and
    * add the fault event listener for that web service.
    * Unlike the event listeners, we get only one fault event listener per 
    * web service class, as opposed to the event listeners that we get for each
    * operation that returns something.
    */
    public function initApp():void
    {
        // Instantiate the new object.
        adaptiveEngineService = new AdaptiveEngineService(null, ApplicationContext.wsdlURL);
        
        // Register the fault event listener method. 
        adaptiveEngineService.addAdaptiveEngineServiceFaultEventListener(handleFaults);
        
        readCoursePortfolios();
    }
   
    /**
    * The handleFaults() method is a very basic fault event handler method that
    * displays an Alert with the error message.
    */
    public function handleFaults(event:FaultEvent):void
    {
        Alert.show("A fault occured contacting the server. Fault message is: " + event.fault.faultString);
    }
    
   /**
    * 
    */
    public function readCoursePortfolios():void
    {
        adaptiveEngineService.addreadCoursePortfoliosEventListener(readCoursePortfoliosResult);
        var readCoursePortfolios:ReadCoursePortfolios = new ReadCoursePortfolios();
        readCoursePortfolios.arg0 = AdaptiveEngineUI.applicationContext.loggedInUser.id;
        adaptiveEngineService.readCoursePortfolios(readCoursePortfolios);    
    }
    
   /**
    * 
    */
    public function readCoursePortfoliosResult(event:ReadCoursePortfoliosResultEvent):void
    {
        if(event.result != null) {
            AdministrationComponent.coursePortfolios = event.result;
        }
    }
    
   /**
    * 
    */
    public function saveCoursePortfolios(coursePortfolios:Array):void
    {
    	adaptiveEngineService.addsaveCoursePortfoliosEventListener(saveCoursePortfoliosResult);
        var saveCoursePortfolios:SaveCoursePortfolios = new SaveCoursePortfolios(coursePortfolios);
        adaptiveEngineService.saveCoursePortfolios(saveCoursePortfolios);    
    }
    
    /**
    * 
    */
    public function saveCoursePortfoliosResult(event:SaveCoursePortfoliosResultEvent):void
    {
    	readCoursePortfolios();
        Alert.show("Changes saved successfully!");
    }