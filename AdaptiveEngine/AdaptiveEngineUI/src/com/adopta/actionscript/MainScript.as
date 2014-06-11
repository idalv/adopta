// ActionScript file

	import com.adopta.actionscript.ApplicationContext;
	import com.adopta.component.MainComponent;
	import com.adopta.service.generated.AdaptiveEngineService;
	import com.adopta.service.generated.ReadAllLearners;
	import com.adopta.service.generated.ReadAllLearnersResultEvent;
	import com.adopta.service.generated.ReadLearnerCoursePortfolios;
	import com.adopta.service.generated.ReadLearnerCoursePortfoliosResultEvent;
	
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
    
        // Initialize the data
        readAllLearners();
        readLearnerCoursePortfolios();
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
    public function readAllLearners():void
    {
        adaptiveEngineService.addreadAllLearnersEventListener(readAllLearnersResult);
        var readAllLearners:ReadAllLearners = new ReadAllLearners();
        readAllLearners.arg0 = AdaptiveEngineUI.applicationContext.loggedInUser.id;
        adaptiveEngineService.readAllLearners(readAllLearners);    
    }
    
    /**
    * 
    */
    public function readAllLearnersResult(event:ReadAllLearnersResultEvent):void
    {
        if(event.result != null) {
            MainComponent.learners = event.result;
            MainComponent.filteredLearners = event.result;
        }
    }
    
        /**
    * 
    */
    public function readLearnerCoursePortfolios():void
    {
        adaptiveEngineService.addreadLearnerCoursePortfoliosEventListener(readLearnerCoursePortfoliosResult);
        var readLearnerCoursePortfolios:ReadLearnerCoursePortfolios = new ReadLearnerCoursePortfolios();
        readLearnerCoursePortfolios.arg0 = AdaptiveEngineUI.applicationContext.loggedInUser.id;
        adaptiveEngineService.readLearnerCoursePortfolios(readLearnerCoursePortfolios);    
    }
    
    /**
    * 
    */
    public function readLearnerCoursePortfoliosResult(event:ReadLearnerCoursePortfoliosResultEvent):void
    {
        if(event.result != null) {
            MainComponent.learnerCoursePortfolios = event.result;
        }
    }