// ActionScript file

	import com.adopta.actionscript.ApplicationContext;
	import com.adopta.component.MonitoringComponent;
	import com.adopta.component.MonitoringHistoryComponent;
	import com.adopta.component.MonitoringLiveComponent;
	import com.adopta.service.generated.AdaptiveEngineService;
	import com.adopta.service.generated.FindCurrentVisitedPages;
	import com.adopta.service.generated.FindCurrentVisitedPagesResultEvent;
	import com.adopta.service.generated.FindVisitedPages;
	import com.adopta.service.generated.FindVisitedPagesResultEvent;
	import com.adopta.service.generated.FindVisitedPaths;
	import com.adopta.service.generated.FindVisitedPathsResultEvent;
	import com.adopta.service.generated.ReadLearnerCoursePortfolios;
	import com.adopta.service.generated.ReadLearnerCoursePortfoliosResultEvent;
	import com.adopta.service.generated.SaveVisitedPaths;
	import com.adopta.service.generated.SaveVisitedPathsResultEvent;
	
	import mx.collections.ArrayCollection;
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
        // Initialize the data
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
    public function readLearnerCoursePortfolios():void
    {
    	// Instantiate the new object.
        adaptiveEngineService = new AdaptiveEngineService(null, ApplicationContext.wsdlURL);
        
        // Register the fault event listener method. 
        adaptiveEngineService.addAdaptiveEngineServiceFaultEventListener(handleFaults);
        
        adaptiveEngineService.addreadLearnerCoursePortfoliosEventListener(readLearnerCoursePortfoliosResult);
        var readLearnerCoursePortfolios:ReadLearnerCoursePortfolios = new ReadLearnerCoursePortfolios();
        readLearnerCoursePortfolios.arg0 = MonitoringComponent.learner.id;
        adaptiveEngineService.readLearnerCoursePortfolios(readLearnerCoursePortfolios);    
    }
    
    /**
    * 
    */
    public function readLearnerCoursePortfoliosResult(event:ReadLearnerCoursePortfoliosResultEvent):void
    {
        if(event.result != null) {
            MonitoringComponent.learnerCoursePortfolios = event.result;
        }
    }
    
   /**
    * 
    */
    public function saveVisitedPaths(visitedPaths:ArrayCollection):void
    {
    	// Instantiate the new object.
        adaptiveEngineService = new AdaptiveEngineService(null, ApplicationContext.wsdlURL);
        
        // Register the fault event listener method. 
        adaptiveEngineService.addAdaptiveEngineServiceFaultEventListener(handleFaults);
        
        adaptiveEngineService.addsaveVisitedPathsEventListener(saveVisitedPathsResult);
        var saveVisitedPaths:SaveVisitedPaths = new SaveVisitedPaths(visitedPaths.toArray());
        adaptiveEngineService.saveVisitedPaths(saveVisitedPaths);    
    }
    
    /**
    * 
    */
    public function saveVisitedPathsResult(event:SaveVisitedPathsResultEvent):void
    {
        readLearnerCoursePortfolios();
        MonitoringHistoryComponent.visitedPaths = new ArrayCollection();
        Alert.show("Changes saved successfully!");
    }
    
   /**
    * 
    */
    public function readCurrentVisitedPages(learnerCoursePortfolioId:Number):void
    {
        // Instantiate the new object.
        adaptiveEngineService = new AdaptiveEngineService(null, ApplicationContext.wsdlURL);
        
        // Register the fault event listener method. 
        adaptiveEngineService.addAdaptiveEngineServiceFaultEventListener(handleFaults);
        
        adaptiveEngineService.addfindCurrentVisitedPagesEventListener(readCurrentVisitedPagesResult);
        var findCurrentVisitedPages:FindCurrentVisitedPages = new FindCurrentVisitedPages();
        findCurrentVisitedPages.arg0 = learnerCoursePortfolioId;
        adaptiveEngineService.findCurrentVisitedPages(findCurrentVisitedPages);   
    }
    
    /**
    * 
    */
    public function readCurrentVisitedPagesResult(event:FindCurrentVisitedPagesResultEvent):void
    {
        if(event.result != null) {
            MonitoringLiveComponent.currentPages = event.result;
        }
    }
    
   /**
    * 
    */
    public function readVisitedPages(learnerCoursePortfolioId:Number, visitedPathId:Number):void
    {
    	if (isNaN(visitedPathId)) {
    		MonitoringHistoryComponent.visitedPages = new ArrayCollection();
    		return;
    	}
    	
        // Instantiate the new object.
        adaptiveEngineService = new AdaptiveEngineService(null, ApplicationContext.wsdlURL);
        
        // Register the fault event listener method. 
        adaptiveEngineService.addAdaptiveEngineServiceFaultEventListener(handleFaults);
        
        adaptiveEngineService.addfindVisitedPagesEventListener(readVisitedPagesResult);
        var findVisitedPages:FindVisitedPages = new FindVisitedPages();
        findVisitedPages.arg0 = learnerCoursePortfolioId;
        findVisitedPages.arg1 = visitedPathId;
        adaptiveEngineService.findVisitedPages(findVisitedPages);
    }
    
    /**
    * 
    */
    public function readVisitedPagesResult(event:FindVisitedPagesResultEvent):void
    {
        if(event.result != null) {
            MonitoringHistoryComponent.visitedPages = event.result;
        }
    }
    
       /**
    * 
    */
    public function readVisitedPaths(learnerCoursePortfolioId:Number):void
    {
        // Instantiate the new object.
        adaptiveEngineService = new AdaptiveEngineService(null, ApplicationContext.wsdlURL);
        
        // Register the fault event listener method. 
        adaptiveEngineService.addAdaptiveEngineServiceFaultEventListener(handleFaults);
        
        MonitoringHistoryComponent.lastVisitingOrder = 0;
        adaptiveEngineService.addfindVisitedPathsEventListener(readVisitedPathsResult);
        var findVisitedPaths:FindVisitedPaths = new FindVisitedPaths();
        findVisitedPaths.arg0 = learnerCoursePortfolioId;
        adaptiveEngineService.findVisitedPaths(findVisitedPaths);   
    }
    
    /**
    * 
    */
    public function readVisitedPathsResult(event:FindVisitedPathsResultEvent):void
    {
        if(event.result != null) {
            MonitoringHistoryComponent.visitedPaths = event.result;
            if (MonitoringHistoryComponent.visitedPaths.length > 0) {
                MonitoringHistoryComponent.lastVisitingOrder = MonitoringHistoryComponent.visitedPaths.getItemAt(MonitoringHistoryComponent.visitedPaths.length - 1).visitingOrder;
            }
        }
    }