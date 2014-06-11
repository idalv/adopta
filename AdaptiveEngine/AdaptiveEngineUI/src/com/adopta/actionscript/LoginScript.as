// ActionScript file

	import com.adopta.actionscript.ApplicationContext;
	import com.adopta.service.generated.AdaptiveEngineService;
	import com.adopta.service.generated.Login;
	import com.adopta.service.generated.LoginResponse;
	import com.adopta.service.generated.LoginResultEvent;
	import com.adopta.service.generated.User;
	
	import mx.controls.Alert;
	import mx.core.Application;
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
    public function loginUser(username:String, password:String):void
    {
        // Register the event listener for the login operation.
        adaptiveEngineService.addloginEventListener(loginResult);
        
        // Call the operation if we have a valid name and password.
        if(username != null && username.length > 0 && password != null && password.length > 0) {
        	var login:Login = new Login();
        	login.arg0 = username;
        	login.arg1 = password;
            adaptiveEngineService.login(login);    
        }
    }
    
    /**
    * 
    */
    public function loginResult(event:LoginResultEvent):void
    {
        if(event.result != null) {
            // Instantiate a new Entry object with result that we got from the call. 
            var response:LoginResponse = event.result;
            // Populate the result form fields with the corresponding data.
            var user:User = response._return;
            if (user != null) {
            	AdaptiveEngineUI.applicationContext.loggedInUser = user;
            	Application.application.currentState = "Main";
            } else {
            	Alert.show("No user found!");
            }
        }
    }
