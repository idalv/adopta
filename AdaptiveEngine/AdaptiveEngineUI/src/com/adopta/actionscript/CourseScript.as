// ActionScript file

	import com.adopta.actionscript.ApplicationContext;
	import com.adopta.component.CourseComponent;
	import com.adopta.service.generated.AdaptiveEngineService;
	import com.adopta.service.generated.ContinueCourse;
	import com.adopta.service.generated.ContinueCourseResponse;
	import com.adopta.service.generated.ContinueCourseResultEvent;
	import com.adopta.service.generated.LongToListOfLongMapping;
	import com.adopta.service.generated.NavigateToPage;
	import com.adopta.service.generated.NavigateToPageResponse;
	import com.adopta.service.generated.NavigateToPageResultEvent;
	import com.adopta.service.generated.StartCourse;
	import com.adopta.service.generated.StartCourseResponse;
	import com.adopta.service.generated.StartCourseResultEvent;
	import com.adopta.service.generated.SubmitAnswers;
	import com.adopta.service.generated.SubmitAnswersResponse;
	import com.adopta.service.generated.SubmitAnswersResultEvent;
	import com.adopta.service.generated.VisitedPage;
	
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.rpc.events.FaultEvent;
    
    // Declare an instance of the generated web service class.
    public var adaptiveEngineServiceC:AdaptiveEngineService;
   
    /**
    * The handleFaults() method is a very basic fault event handler method that
    * displays an Alert with the error message.
    */
    public function handleFaultsC(event:FaultEvent):void
    {
        Alert.show("A fault occured contacting the server. Fault message is: " + event.fault.faultString);
    }
    
    public function initService():void {
    	// Instantiate the new object.
        adaptiveEngineServiceC = new AdaptiveEngineService(null, ApplicationContext.wsdlURL);
        
        // Register the fault event listener method. 
        adaptiveEngineServiceC.addAdaptiveEngineServiceFaultEventListener(handleFaultsC);
    }
    
    public function loadCourse():void
    {
        initService();
        adaptiveEngineServiceC.addstartCourseEventListener(loadCourseResult);
        var startCourse:StartCourse = new StartCourse();
        startCourse.arg0 = CourseComponent.learnerCoursePortfolio.learner.id;
        startCourse.arg1 = CourseComponent.learnerCoursePortfolio.course.id;
        adaptiveEngineServiceC.startCourse(startCourse);    
    }
    
    public function loadCourseResult(event:StartCourseResultEvent):void
    {
        if(event.result != null) {
            var response:StartCourseResponse = event.result;
            processPage(response._return);
        }
    }
    
    public function continueCourse():void
    {
        initService();
        adaptiveEngineServiceC.addcontinueCourseEventListener(continueCourseResult);
        var continueCourse:ContinueCourse = new ContinueCourse();
        continueCourse.arg0 = CourseComponent.learnerCoursePortfolio.learner.id;
        continueCourse.arg1 = CourseComponent.learnerCoursePortfolio.course.id;
        adaptiveEngineServiceC.continueCourse(continueCourse);    
    }
    
    public function continueCourseResult(event:ContinueCourseResultEvent):void
    {
        if(event.result != null) {
            var response:ContinueCourseResponse = event.result;
            processPage(response._return);
        }
    }
    
    public function navigateToPage(page:Number):void
    {        
    	initService();
    	adaptiveEngineServiceC.addnavigateToPageEventListener(navigateToPageResult);
        var navigateToPage:NavigateToPage = new NavigateToPage();
        navigateToPage.arg0 = CourseComponent.visitedPage;
        navigateToPage.arg1 = page;
        adaptiveEngineServiceC.navigateToPage(navigateToPage);    
    }
    
    public function navigateToPageResult(event:NavigateToPageResultEvent):void
    {
        if(event.result != null) {
            var response:NavigateToPageResponse = event.result;
            processPage(response._return);
        }
    }
    
    public function submitAnswers(answers:Dictionary):void
    {        
        initService();
        adaptiveEngineServiceC.addsubmitAnswersEventListener(submitAnswersResult);
        var submitAnswers:SubmitAnswers = new SubmitAnswers();
        submitAnswers.arg0 = CourseComponent.visitedPage;
        submitAnswers.arg1 = new Array();
        
        // Process each dictionary entry
        for (var key:String in answers) {
            var loId:Number = Number(key);
            var questionAnswers:ArrayCollection = answers[loId];
            
            var questionToAnswers:LongToListOfLongMapping = new LongToListOfLongMapping;
            questionToAnswers.key = loId;
            questionToAnswers.value = questionAnswers.toArray();
            submitAnswers.arg1.push(questionToAnswers);
        }
        
        // Call the service
        adaptiveEngineServiceC.submitAnswers(submitAnswers);    
    }
    
    public function submitAnswersResult(event:SubmitAnswersResultEvent):void
    {
        if(event.result != null) {
            var response:SubmitAnswersResponse = event.result;
            processPage(response._return);
        }
    }
    
    public function processPage(page:VisitedPage):void {
        if (page != null) {
            CourseComponent.visitedPage = page;
            var course:CourseComponent = Application.application.main.course;
            course.renderObjects();
        } else {
            Alert.show("Course is completed!");
        }
    }