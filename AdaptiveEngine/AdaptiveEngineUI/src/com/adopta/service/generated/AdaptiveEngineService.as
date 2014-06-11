/**
 * AdaptiveEngineServiceService.as
 * This file was auto-generated from WSDL by the Apache Axis2 generator modified by Adobe
 * Any change made to this file will be overwritten when the code is re-generated.
 */
 /**
  * Usage example: to use this service from within your Flex application you have two choices:
  * Use it via Actionscript only
  * Use it via MXML tags
  * Actionscript sample code:
  * Step 1: create an instance of the service; pass it the LCDS destination string if any
  * var myService:AdaptiveEngineService= new AdaptiveEngineService();
  * Step 2: for the desired operation add a result handler (a function that you have already defined previously)  
  * myService.addcontinueCourseEventListener(myResultHandlingFunction);
  * Step 3: Call the operation as a method on the service. Pass the right values as arguments:
  * myService.continueCourse(myarg0,myarg1,mycontinueCourse);
  *
  * MXML sample code:
  * First you need to map the package where the files were generated to a namespace, usually on the <mx:Application> tag, 
  * like this: xmlns:srv="com.adopta.service.generated.*"
  * Define the service and within its tags set the request wrapper for the desired operation
  * <srv:AdaptiveEngineService id="myService">
  *   <srv:continueCourse_request_var>
  *		<srv:ContinueCourse_request arg0=myValue,arg1=myValue,continueCourse=myValue/>
  *   </srv:continueCourse_request_var>
  * </srv:AdaptiveEngineService>
  * Then call the operation for which you have set the request wrapper value above, like this:
  * <mx:Button id="myButton" label="Call operation" click="myService.continueCourse_send()" />
  */
package com.adopta.service.generated
{
	import mx.rpc.AsyncToken;
	import flash.events.EventDispatcher;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.events.FaultEvent;
	import flash.utils.ByteArray;
	import mx.rpc.soap.types.*;

    /**
     * Dispatches when a call to the operation continueCourse completes with success
     * and returns some data
     * @eventType ContinueCourseResultEvent
     */
    [Event(name="ContinueCourse_result", type="com.adopta.service.generated.ContinueCourseResultEvent")]
    
    /**
     * Dispatches when a call to the operation findAllComplexities completes with success
     * and returns some data
     * @eventType FindAllComplexitiesResultEvent
     */
    [Event(name="FindAllComplexities_result", type="com.adopta.service.generated.FindAllComplexitiesResultEvent")]
    
    /**
     * Dispatches when a call to the operation findCurrentVisitedPages completes with success
     * and returns some data
     * @eventType FindCurrentVisitedPagesResultEvent
     */
    [Event(name="FindCurrentVisitedPages_result", type="com.adopta.service.generated.FindCurrentVisitedPagesResultEvent")]
    
    /**
     * Dispatches when a call to the operation findVisitedPages completes with success
     * and returns some data
     * @eventType FindVisitedPagesResultEvent
     */
    [Event(name="FindVisitedPages_result", type="com.adopta.service.generated.FindVisitedPagesResultEvent")]
    
    /**
     * Dispatches when a call to the operation findVisitedPaths completes with success
     * and returns some data
     * @eventType FindVisitedPathsResultEvent
     */
    [Event(name="FindVisitedPaths_result", type="com.adopta.service.generated.FindVisitedPathsResultEvent")]
    
    /**
     * Dispatches when a call to the operation login completes with success
     * and returns some data
     * @eventType LoginResultEvent
     */
    [Event(name="Login_result", type="com.adopta.service.generated.LoginResultEvent")]
    
    /**
     * Dispatches when a call to the operation navigateToPage completes with success
     * and returns some data
     * @eventType NavigateToPageResultEvent
     */
    [Event(name="NavigateToPage_result", type="com.adopta.service.generated.NavigateToPageResultEvent")]
    
    /**
     * Dispatches when a call to the operation readAllLearners completes with success
     * and returns some data
     * @eventType ReadAllLearnersResultEvent
     */
    [Event(name="ReadAllLearners_result", type="com.adopta.service.generated.ReadAllLearnersResultEvent")]
    
    /**
     * Dispatches when a call to the operation readCoursePortfolios completes with success
     * and returns some data
     * @eventType ReadCoursePortfoliosResultEvent
     */
    [Event(name="ReadCoursePortfolios_result", type="com.adopta.service.generated.ReadCoursePortfoliosResultEvent")]
    
    /**
     * Dispatches when a call to the operation readLearnerCoursePortfolios completes with success
     * and returns some data
     * @eventType ReadLearnerCoursePortfoliosResultEvent
     */
    [Event(name="ReadLearnerCoursePortfolios_result", type="com.adopta.service.generated.ReadLearnerCoursePortfoliosResultEvent")]
    
    /**
     * Dispatches when a call to the operation saveCoursePortfolios completes with success
     * and returns some data
     * @eventType SaveCoursePortfoliosResultEvent
     */
    [Event(name="SaveCoursePortfolios_result", type="com.adopta.service.generated.SaveCoursePortfoliosResultEvent")]
    
    /**
     * Dispatches when a call to the operation saveVisitedPaths completes with success
     * and returns some data
     * @eventType SaveVisitedPathsResultEvent
     */
    [Event(name="SaveVisitedPaths_result", type="com.adopta.service.generated.SaveVisitedPathsResultEvent")]
    
    /**
     * Dispatches when a call to the operation startCourse completes with success
     * and returns some data
     * @eventType StartCourseResultEvent
     */
    [Event(name="StartCourse_result", type="com.adopta.service.generated.StartCourseResultEvent")]
    
    /**
     * Dispatches when a call to the operation submitAnswers completes with success
     * and returns some data
     * @eventType SubmitAnswersResultEvent
     */
    [Event(name="SubmitAnswers_result", type="com.adopta.service.generated.SubmitAnswersResultEvent")]
    
	/**
	 * Dispatches when the operation that has been called fails. The fault event is common for all operations
	 * of the WSDL
	 * @eventType mx.rpc.events.FaultEvent
	 */
    [Event(name="fault", type="mx.rpc.events.FaultEvent")]

	public class AdaptiveEngineService extends EventDispatcher implements IAdaptiveEngineService
	{
    	private var _baseService:BaseAdaptiveEngineService;
        
        /**
         * Constructor for the facade; sets the destination and create a baseService instance
         * @param The LCDS destination (if any) associated with the imported WSDL
         */  
        public function AdaptiveEngineService(destination:String=null,rootURL:String=null)
        {
        	_baseService = new BaseAdaptiveEngineService(destination,rootURL);
        }
        
		//stub functions for the continueCourse operation
          

        /**
         * @see IAdaptiveEngineService#continueCourse()
         */
        public function continueCourse(continueCourse:ContinueCourse):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.continueCourse(continueCourse);
            _internal_token.addEventListener("result",_continueCourse_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IAdaptiveEngineService#continueCourse_send()
		 */    
        public function continueCourse_send():AsyncToken
        {
        	return continueCourse(_continueCourse_request.continueCourse);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _continueCourse_request:ContinueCourse_request;
		/**
		 * @see IAdaptiveEngineService#continueCourse_request_var
		 */
		[Bindable]
		public function get continueCourse_request_var():ContinueCourse_request
		{
			return _continueCourse_request;
		}
		
		/**
		 * @private
		 */
		public function set continueCourse_request_var(request:ContinueCourse_request):void
		{
			_continueCourse_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _continueCourse_lastResult:ContinueCourseResponse;
		[Bindable]
		/**
		 * @see IAdaptiveEngineService#continueCourse_lastResult
		 */	  
		public function get continueCourse_lastResult():ContinueCourseResponse
		{
			return _continueCourse_lastResult;
		}
		/**
		 * @private
		 */
		public function set continueCourse_lastResult(lastResult:ContinueCourseResponse):void
		{
			_continueCourse_lastResult = lastResult;
		}
		
		/**
		 * @see IAdaptiveEngineService#addcontinueCourse()
		 */
		public function addcontinueCourseEventListener(listener:Function):void
		{
			addEventListener(ContinueCourseResultEvent.ContinueCourse_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _continueCourse_populate_results(event:ResultEvent):void
		{
			var e:ContinueCourseResultEvent = new ContinueCourseResultEvent();
		            e.result = event.result as ContinueCourseResponse;
		                       e.headers = event.headers;
		             continueCourse_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//stub functions for the findAllComplexities operation
          

        /**
         * @see IAdaptiveEngineService#findAllComplexities()
         */
        public function findAllComplexities(findAllComplexities:FindAllComplexities):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.findAllComplexities(findAllComplexities);
            _internal_token.addEventListener("result",_findAllComplexities_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IAdaptiveEngineService#findAllComplexities_send()
		 */    
        public function findAllComplexities_send():AsyncToken
        {
        	return findAllComplexities(_findAllComplexities_request.findAllComplexities);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _findAllComplexities_request:FindAllComplexities_request;
		/**
		 * @see IAdaptiveEngineService#findAllComplexities_request_var
		 */
		[Bindable]
		public function get findAllComplexities_request_var():FindAllComplexities_request
		{
			return _findAllComplexities_request;
		}
		
		/**
		 * @private
		 */
		public function set findAllComplexities_request_var(request:FindAllComplexities_request):void
		{
			_findAllComplexities_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _findAllComplexities_lastResult:FindAllComplexitiesResponse;
		[Bindable]
		/**
		 * @see IAdaptiveEngineService#findAllComplexities_lastResult
		 */	  
		public function get findAllComplexities_lastResult():FindAllComplexitiesResponse
		{
			return _findAllComplexities_lastResult;
		}
		/**
		 * @private
		 */
		public function set findAllComplexities_lastResult(lastResult:FindAllComplexitiesResponse):void
		{
			_findAllComplexities_lastResult = lastResult;
		}
		
		/**
		 * @see IAdaptiveEngineService#addfindAllComplexities()
		 */
		public function addfindAllComplexitiesEventListener(listener:Function):void
		{
			addEventListener(FindAllComplexitiesResultEvent.FindAllComplexities_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _findAllComplexities_populate_results(event:ResultEvent):void
		{
			var e:FindAllComplexitiesResultEvent = new FindAllComplexitiesResultEvent();
		            e.result = event.result as FindAllComplexitiesResponse;
		                       e.headers = event.headers;
		             findAllComplexities_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//stub functions for the findCurrentVisitedPages operation
          

        /**
         * @see IAdaptiveEngineService#findCurrentVisitedPages()
         */
        public function findCurrentVisitedPages(findCurrentVisitedPages:FindCurrentVisitedPages):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.findCurrentVisitedPages(findCurrentVisitedPages);
            _internal_token.addEventListener("result",_findCurrentVisitedPages_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IAdaptiveEngineService#findCurrentVisitedPages_send()
		 */    
        public function findCurrentVisitedPages_send():AsyncToken
        {
        	return findCurrentVisitedPages(_findCurrentVisitedPages_request.findCurrentVisitedPages);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _findCurrentVisitedPages_request:FindCurrentVisitedPages_request;
		/**
		 * @see IAdaptiveEngineService#findCurrentVisitedPages_request_var
		 */
		[Bindable]
		public function get findCurrentVisitedPages_request_var():FindCurrentVisitedPages_request
		{
			return _findCurrentVisitedPages_request;
		}
		
		/**
		 * @private
		 */
		public function set findCurrentVisitedPages_request_var(request:FindCurrentVisitedPages_request):void
		{
			_findCurrentVisitedPages_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _findCurrentVisitedPages_lastResult:FindCurrentVisitedPagesResponse;
		[Bindable]
		/**
		 * @see IAdaptiveEngineService#findCurrentVisitedPages_lastResult
		 */	  
		public function get findCurrentVisitedPages_lastResult():FindCurrentVisitedPagesResponse
		{
			return _findCurrentVisitedPages_lastResult;
		}
		/**
		 * @private
		 */
		public function set findCurrentVisitedPages_lastResult(lastResult:FindCurrentVisitedPagesResponse):void
		{
			_findCurrentVisitedPages_lastResult = lastResult;
		}
		
		/**
		 * @see IAdaptiveEngineService#addfindCurrentVisitedPages()
		 */
		public function addfindCurrentVisitedPagesEventListener(listener:Function):void
		{
			addEventListener(FindCurrentVisitedPagesResultEvent.FindCurrentVisitedPages_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _findCurrentVisitedPages_populate_results(event:ResultEvent):void
		{
			var e:FindCurrentVisitedPagesResultEvent = new FindCurrentVisitedPagesResultEvent();
		            e.result = event.result as FindCurrentVisitedPagesResponse;
		                       e.headers = event.headers;
		             findCurrentVisitedPages_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//stub functions for the findVisitedPages operation
          

        /**
         * @see IAdaptiveEngineService#findVisitedPages()
         */
        public function findVisitedPages(findVisitedPages:FindVisitedPages):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.findVisitedPages(findVisitedPages);
            _internal_token.addEventListener("result",_findVisitedPages_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IAdaptiveEngineService#findVisitedPages_send()
		 */    
        public function findVisitedPages_send():AsyncToken
        {
        	return findVisitedPages(_findVisitedPages_request.findVisitedPages);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _findVisitedPages_request:FindVisitedPages_request;
		/**
		 * @see IAdaptiveEngineService#findVisitedPages_request_var
		 */
		[Bindable]
		public function get findVisitedPages_request_var():FindVisitedPages_request
		{
			return _findVisitedPages_request;
		}
		
		/**
		 * @private
		 */
		public function set findVisitedPages_request_var(request:FindVisitedPages_request):void
		{
			_findVisitedPages_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _findVisitedPages_lastResult:FindVisitedPagesResponse;
		[Bindable]
		/**
		 * @see IAdaptiveEngineService#findVisitedPages_lastResult
		 */	  
		public function get findVisitedPages_lastResult():FindVisitedPagesResponse
		{
			return _findVisitedPages_lastResult;
		}
		/**
		 * @private
		 */
		public function set findVisitedPages_lastResult(lastResult:FindVisitedPagesResponse):void
		{
			_findVisitedPages_lastResult = lastResult;
		}
		
		/**
		 * @see IAdaptiveEngineService#addfindVisitedPages()
		 */
		public function addfindVisitedPagesEventListener(listener:Function):void
		{
			addEventListener(FindVisitedPagesResultEvent.FindVisitedPages_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _findVisitedPages_populate_results(event:ResultEvent):void
		{
			var e:FindVisitedPagesResultEvent = new FindVisitedPagesResultEvent();
		            e.result = event.result as FindVisitedPagesResponse;
		                       e.headers = event.headers;
		             findVisitedPages_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//stub functions for the findVisitedPaths operation
          

        /**
         * @see IAdaptiveEngineService#findVisitedPaths()
         */
        public function findVisitedPaths(findVisitedPaths:FindVisitedPaths):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.findVisitedPaths(findVisitedPaths);
            _internal_token.addEventListener("result",_findVisitedPaths_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IAdaptiveEngineService#findVisitedPaths_send()
		 */    
        public function findVisitedPaths_send():AsyncToken
        {
        	return findVisitedPaths(_findVisitedPaths_request.findVisitedPaths);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _findVisitedPaths_request:FindVisitedPaths_request;
		/**
		 * @see IAdaptiveEngineService#findVisitedPaths_request_var
		 */
		[Bindable]
		public function get findVisitedPaths_request_var():FindVisitedPaths_request
		{
			return _findVisitedPaths_request;
		}
		
		/**
		 * @private
		 */
		public function set findVisitedPaths_request_var(request:FindVisitedPaths_request):void
		{
			_findVisitedPaths_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _findVisitedPaths_lastResult:FindVisitedPathsResponse;
		[Bindable]
		/**
		 * @see IAdaptiveEngineService#findVisitedPaths_lastResult
		 */	  
		public function get findVisitedPaths_lastResult():FindVisitedPathsResponse
		{
			return _findVisitedPaths_lastResult;
		}
		/**
		 * @private
		 */
		public function set findVisitedPaths_lastResult(lastResult:FindVisitedPathsResponse):void
		{
			_findVisitedPaths_lastResult = lastResult;
		}
		
		/**
		 * @see IAdaptiveEngineService#addfindVisitedPaths()
		 */
		public function addfindVisitedPathsEventListener(listener:Function):void
		{
			addEventListener(FindVisitedPathsResultEvent.FindVisitedPaths_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _findVisitedPaths_populate_results(event:ResultEvent):void
		{
			var e:FindVisitedPathsResultEvent = new FindVisitedPathsResultEvent();
		            e.result = event.result as FindVisitedPathsResponse;
		                       e.headers = event.headers;
		             findVisitedPaths_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//stub functions for the login operation
          

        /**
         * @see IAdaptiveEngineService#login()
         */
        public function login(login:Login):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.login(login);
            _internal_token.addEventListener("result",_login_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IAdaptiveEngineService#login_send()
		 */    
        public function login_send():AsyncToken
        {
        	return login(_login_request.login);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _login_request:Login_request;
		/**
		 * @see IAdaptiveEngineService#login_request_var
		 */
		[Bindable]
		public function get login_request_var():Login_request
		{
			return _login_request;
		}
		
		/**
		 * @private
		 */
		public function set login_request_var(request:Login_request):void
		{
			_login_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _login_lastResult:LoginResponse;
		[Bindable]
		/**
		 * @see IAdaptiveEngineService#login_lastResult
		 */	  
		public function get login_lastResult():LoginResponse
		{
			return _login_lastResult;
		}
		/**
		 * @private
		 */
		public function set login_lastResult(lastResult:LoginResponse):void
		{
			_login_lastResult = lastResult;
		}
		
		/**
		 * @see IAdaptiveEngineService#addlogin()
		 */
		public function addloginEventListener(listener:Function):void
		{
			addEventListener(LoginResultEvent.Login_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _login_populate_results(event:ResultEvent):void
		{
			var e:LoginResultEvent = new LoginResultEvent();
		            e.result = event.result as LoginResponse;
		                       e.headers = event.headers;
		             login_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//stub functions for the navigateToPage operation
          

        /**
         * @see IAdaptiveEngineService#navigateToPage()
         */
        public function navigateToPage(navigateToPage:NavigateToPage):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.navigateToPage(navigateToPage);
            _internal_token.addEventListener("result",_navigateToPage_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IAdaptiveEngineService#navigateToPage_send()
		 */    
        public function navigateToPage_send():AsyncToken
        {
        	return navigateToPage(_navigateToPage_request.navigateToPage);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _navigateToPage_request:NavigateToPage_request;
		/**
		 * @see IAdaptiveEngineService#navigateToPage_request_var
		 */
		[Bindable]
		public function get navigateToPage_request_var():NavigateToPage_request
		{
			return _navigateToPage_request;
		}
		
		/**
		 * @private
		 */
		public function set navigateToPage_request_var(request:NavigateToPage_request):void
		{
			_navigateToPage_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _navigateToPage_lastResult:NavigateToPageResponse;
		[Bindable]
		/**
		 * @see IAdaptiveEngineService#navigateToPage_lastResult
		 */	  
		public function get navigateToPage_lastResult():NavigateToPageResponse
		{
			return _navigateToPage_lastResult;
		}
		/**
		 * @private
		 */
		public function set navigateToPage_lastResult(lastResult:NavigateToPageResponse):void
		{
			_navigateToPage_lastResult = lastResult;
		}
		
		/**
		 * @see IAdaptiveEngineService#addnavigateToPage()
		 */
		public function addnavigateToPageEventListener(listener:Function):void
		{
			addEventListener(NavigateToPageResultEvent.NavigateToPage_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _navigateToPage_populate_results(event:ResultEvent):void
		{
			var e:NavigateToPageResultEvent = new NavigateToPageResultEvent();
		            e.result = event.result as NavigateToPageResponse;
		                       e.headers = event.headers;
		             navigateToPage_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//stub functions for the readAllLearners operation
          

        /**
         * @see IAdaptiveEngineService#readAllLearners()
         */
        public function readAllLearners(readAllLearners:ReadAllLearners):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.readAllLearners(readAllLearners);
            _internal_token.addEventListener("result",_readAllLearners_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IAdaptiveEngineService#readAllLearners_send()
		 */    
        public function readAllLearners_send():AsyncToken
        {
        	return readAllLearners(_readAllLearners_request.readAllLearners);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _readAllLearners_request:ReadAllLearners_request;
		/**
		 * @see IAdaptiveEngineService#readAllLearners_request_var
		 */
		[Bindable]
		public function get readAllLearners_request_var():ReadAllLearners_request
		{
			return _readAllLearners_request;
		}
		
		/**
		 * @private
		 */
		public function set readAllLearners_request_var(request:ReadAllLearners_request):void
		{
			_readAllLearners_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _readAllLearners_lastResult:ReadAllLearnersResponse;
		[Bindable]
		/**
		 * @see IAdaptiveEngineService#readAllLearners_lastResult
		 */	  
		public function get readAllLearners_lastResult():ReadAllLearnersResponse
		{
			return _readAllLearners_lastResult;
		}
		/**
		 * @private
		 */
		public function set readAllLearners_lastResult(lastResult:ReadAllLearnersResponse):void
		{
			_readAllLearners_lastResult = lastResult;
		}
		
		/**
		 * @see IAdaptiveEngineService#addreadAllLearners()
		 */
		public function addreadAllLearnersEventListener(listener:Function):void
		{
			addEventListener(ReadAllLearnersResultEvent.ReadAllLearners_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _readAllLearners_populate_results(event:ResultEvent):void
		{
			var e:ReadAllLearnersResultEvent = new ReadAllLearnersResultEvent();
		            e.result = event.result as ReadAllLearnersResponse;
		                       e.headers = event.headers;
		             readAllLearners_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//stub functions for the readCoursePortfolios operation
          

        /**
         * @see IAdaptiveEngineService#readCoursePortfolios()
         */
        public function readCoursePortfolios(readCoursePortfolios:ReadCoursePortfolios):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.readCoursePortfolios(readCoursePortfolios);
            _internal_token.addEventListener("result",_readCoursePortfolios_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IAdaptiveEngineService#readCoursePortfolios_send()
		 */    
        public function readCoursePortfolios_send():AsyncToken
        {
        	return readCoursePortfolios(_readCoursePortfolios_request.readCoursePortfolios);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _readCoursePortfolios_request:ReadCoursePortfolios_request;
		/**
		 * @see IAdaptiveEngineService#readCoursePortfolios_request_var
		 */
		[Bindable]
		public function get readCoursePortfolios_request_var():ReadCoursePortfolios_request
		{
			return _readCoursePortfolios_request;
		}
		
		/**
		 * @private
		 */
		public function set readCoursePortfolios_request_var(request:ReadCoursePortfolios_request):void
		{
			_readCoursePortfolios_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _readCoursePortfolios_lastResult:ReadCoursePortfoliosResponse;
		[Bindable]
		/**
		 * @see IAdaptiveEngineService#readCoursePortfolios_lastResult
		 */	  
		public function get readCoursePortfolios_lastResult():ReadCoursePortfoliosResponse
		{
			return _readCoursePortfolios_lastResult;
		}
		/**
		 * @private
		 */
		public function set readCoursePortfolios_lastResult(lastResult:ReadCoursePortfoliosResponse):void
		{
			_readCoursePortfolios_lastResult = lastResult;
		}
		
		/**
		 * @see IAdaptiveEngineService#addreadCoursePortfolios()
		 */
		public function addreadCoursePortfoliosEventListener(listener:Function):void
		{
			addEventListener(ReadCoursePortfoliosResultEvent.ReadCoursePortfolios_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _readCoursePortfolios_populate_results(event:ResultEvent):void
		{
			var e:ReadCoursePortfoliosResultEvent = new ReadCoursePortfoliosResultEvent();
		            e.result = event.result as ReadCoursePortfoliosResponse;
		                       e.headers = event.headers;
		             readCoursePortfolios_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//stub functions for the readLearnerCoursePortfolios operation
          

        /**
         * @see IAdaptiveEngineService#readLearnerCoursePortfolios()
         */
        public function readLearnerCoursePortfolios(readLearnerCoursePortfolios:ReadLearnerCoursePortfolios):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.readLearnerCoursePortfolios(readLearnerCoursePortfolios);
            _internal_token.addEventListener("result",_readLearnerCoursePortfolios_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IAdaptiveEngineService#readLearnerCoursePortfolios_send()
		 */    
        public function readLearnerCoursePortfolios_send():AsyncToken
        {
        	return readLearnerCoursePortfolios(_readLearnerCoursePortfolios_request.readLearnerCoursePortfolios);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _readLearnerCoursePortfolios_request:ReadLearnerCoursePortfolios_request;
		/**
		 * @see IAdaptiveEngineService#readLearnerCoursePortfolios_request_var
		 */
		[Bindable]
		public function get readLearnerCoursePortfolios_request_var():ReadLearnerCoursePortfolios_request
		{
			return _readLearnerCoursePortfolios_request;
		}
		
		/**
		 * @private
		 */
		public function set readLearnerCoursePortfolios_request_var(request:ReadLearnerCoursePortfolios_request):void
		{
			_readLearnerCoursePortfolios_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _readLearnerCoursePortfolios_lastResult:ReadLearnerCoursePortfoliosResponse;
		[Bindable]
		/**
		 * @see IAdaptiveEngineService#readLearnerCoursePortfolios_lastResult
		 */	  
		public function get readLearnerCoursePortfolios_lastResult():ReadLearnerCoursePortfoliosResponse
		{
			return _readLearnerCoursePortfolios_lastResult;
		}
		/**
		 * @private
		 */
		public function set readLearnerCoursePortfolios_lastResult(lastResult:ReadLearnerCoursePortfoliosResponse):void
		{
			_readLearnerCoursePortfolios_lastResult = lastResult;
		}
		
		/**
		 * @see IAdaptiveEngineService#addreadLearnerCoursePortfolios()
		 */
		public function addreadLearnerCoursePortfoliosEventListener(listener:Function):void
		{
			addEventListener(ReadLearnerCoursePortfoliosResultEvent.ReadLearnerCoursePortfolios_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _readLearnerCoursePortfolios_populate_results(event:ResultEvent):void
		{
			var e:ReadLearnerCoursePortfoliosResultEvent = new ReadLearnerCoursePortfoliosResultEvent();
		            e.result = event.result as ReadLearnerCoursePortfoliosResponse;
		                       e.headers = event.headers;
		             readLearnerCoursePortfolios_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//stub functions for the saveCoursePortfolios operation
          

        /**
         * @see IAdaptiveEngineService#saveCoursePortfolios()
         */
        public function saveCoursePortfolios(saveCoursePortfolios:SaveCoursePortfolios):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.saveCoursePortfolios(saveCoursePortfolios);
            _internal_token.addEventListener("result",_saveCoursePortfolios_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IAdaptiveEngineService#saveCoursePortfolios_send()
		 */    
        public function saveCoursePortfolios_send():AsyncToken
        {
        	return saveCoursePortfolios(_saveCoursePortfolios_request.saveCoursePortfolios);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _saveCoursePortfolios_request:SaveCoursePortfolios_request;
		/**
		 * @see IAdaptiveEngineService#saveCoursePortfolios_request_var
		 */
		[Bindable]
		public function get saveCoursePortfolios_request_var():SaveCoursePortfolios_request
		{
			return _saveCoursePortfolios_request;
		}
		
		/**
		 * @private
		 */
		public function set saveCoursePortfolios_request_var(request:SaveCoursePortfolios_request):void
		{
			_saveCoursePortfolios_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _saveCoursePortfolios_lastResult:SaveCoursePortfoliosResponse;
		[Bindable]
		/**
		 * @see IAdaptiveEngineService#saveCoursePortfolios_lastResult
		 */	  
		public function get saveCoursePortfolios_lastResult():SaveCoursePortfoliosResponse
		{
			return _saveCoursePortfolios_lastResult;
		}
		/**
		 * @private
		 */
		public function set saveCoursePortfolios_lastResult(lastResult:SaveCoursePortfoliosResponse):void
		{
			_saveCoursePortfolios_lastResult = lastResult;
		}
		
		/**
		 * @see IAdaptiveEngineService#addsaveCoursePortfolios()
		 */
		public function addsaveCoursePortfoliosEventListener(listener:Function):void
		{
			addEventListener(SaveCoursePortfoliosResultEvent.SaveCoursePortfolios_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _saveCoursePortfolios_populate_results(event:ResultEvent):void
		{
			var e:SaveCoursePortfoliosResultEvent = new SaveCoursePortfoliosResultEvent();
		            e.result = event.result as SaveCoursePortfoliosResponse;
		                       e.headers = event.headers;
		             saveCoursePortfolios_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//stub functions for the saveVisitedPaths operation
          

        /**
         * @see IAdaptiveEngineService#saveVisitedPaths()
         */
        public function saveVisitedPaths(saveVisitedPaths:SaveVisitedPaths):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.saveVisitedPaths(saveVisitedPaths);
            _internal_token.addEventListener("result",_saveVisitedPaths_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IAdaptiveEngineService#saveVisitedPaths_send()
		 */    
        public function saveVisitedPaths_send():AsyncToken
        {
        	return saveVisitedPaths(_saveVisitedPaths_request.saveVisitedPaths);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _saveVisitedPaths_request:SaveVisitedPaths_request;
		/**
		 * @see IAdaptiveEngineService#saveVisitedPaths_request_var
		 */
		[Bindable]
		public function get saveVisitedPaths_request_var():SaveVisitedPaths_request
		{
			return _saveVisitedPaths_request;
		}
		
		/**
		 * @private
		 */
		public function set saveVisitedPaths_request_var(request:SaveVisitedPaths_request):void
		{
			_saveVisitedPaths_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _saveVisitedPaths_lastResult:SaveVisitedPathsResponse;
		[Bindable]
		/**
		 * @see IAdaptiveEngineService#saveVisitedPaths_lastResult
		 */	  
		public function get saveVisitedPaths_lastResult():SaveVisitedPathsResponse
		{
			return _saveVisitedPaths_lastResult;
		}
		/**
		 * @private
		 */
		public function set saveVisitedPaths_lastResult(lastResult:SaveVisitedPathsResponse):void
		{
			_saveVisitedPaths_lastResult = lastResult;
		}
		
		/**
		 * @see IAdaptiveEngineService#addsaveVisitedPaths()
		 */
		public function addsaveVisitedPathsEventListener(listener:Function):void
		{
			addEventListener(SaveVisitedPathsResultEvent.SaveVisitedPaths_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _saveVisitedPaths_populate_results(event:ResultEvent):void
		{
			var e:SaveVisitedPathsResultEvent = new SaveVisitedPathsResultEvent();
		            e.result = event.result as SaveVisitedPathsResponse;
		                       e.headers = event.headers;
		             saveVisitedPaths_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//stub functions for the startCourse operation
          

        /**
         * @see IAdaptiveEngineService#startCourse()
         */
        public function startCourse(startCourse:StartCourse):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.startCourse(startCourse);
            _internal_token.addEventListener("result",_startCourse_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IAdaptiveEngineService#startCourse_send()
		 */    
        public function startCourse_send():AsyncToken
        {
        	return startCourse(_startCourse_request.startCourse);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _startCourse_request:StartCourse_request;
		/**
		 * @see IAdaptiveEngineService#startCourse_request_var
		 */
		[Bindable]
		public function get startCourse_request_var():StartCourse_request
		{
			return _startCourse_request;
		}
		
		/**
		 * @private
		 */
		public function set startCourse_request_var(request:StartCourse_request):void
		{
			_startCourse_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _startCourse_lastResult:StartCourseResponse;
		[Bindable]
		/**
		 * @see IAdaptiveEngineService#startCourse_lastResult
		 */	  
		public function get startCourse_lastResult():StartCourseResponse
		{
			return _startCourse_lastResult;
		}
		/**
		 * @private
		 */
		public function set startCourse_lastResult(lastResult:StartCourseResponse):void
		{
			_startCourse_lastResult = lastResult;
		}
		
		/**
		 * @see IAdaptiveEngineService#addstartCourse()
		 */
		public function addstartCourseEventListener(listener:Function):void
		{
			addEventListener(StartCourseResultEvent.StartCourse_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _startCourse_populate_results(event:ResultEvent):void
		{
			var e:StartCourseResultEvent = new StartCourseResultEvent();
		            e.result = event.result as StartCourseResponse;
		                       e.headers = event.headers;
		             startCourse_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//stub functions for the submitAnswers operation
          

        /**
         * @see IAdaptiveEngineService#submitAnswers()
         */
        public function submitAnswers(submitAnswers:SubmitAnswers):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.submitAnswers(submitAnswers);
            _internal_token.addEventListener("result",_submitAnswers_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IAdaptiveEngineService#submitAnswers_send()
		 */    
        public function submitAnswers_send():AsyncToken
        {
        	return submitAnswers(_submitAnswers_request.submitAnswers);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _submitAnswers_request:SubmitAnswers_request;
		/**
		 * @see IAdaptiveEngineService#submitAnswers_request_var
		 */
		[Bindable]
		public function get submitAnswers_request_var():SubmitAnswers_request
		{
			return _submitAnswers_request;
		}
		
		/**
		 * @private
		 */
		public function set submitAnswers_request_var(request:SubmitAnswers_request):void
		{
			_submitAnswers_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _submitAnswers_lastResult:SubmitAnswersResponse;
		[Bindable]
		/**
		 * @see IAdaptiveEngineService#submitAnswers_lastResult
		 */	  
		public function get submitAnswers_lastResult():SubmitAnswersResponse
		{
			return _submitAnswers_lastResult;
		}
		/**
		 * @private
		 */
		public function set submitAnswers_lastResult(lastResult:SubmitAnswersResponse):void
		{
			_submitAnswers_lastResult = lastResult;
		}
		
		/**
		 * @see IAdaptiveEngineService#addsubmitAnswers()
		 */
		public function addsubmitAnswersEventListener(listener:Function):void
		{
			addEventListener(SubmitAnswersResultEvent.SubmitAnswers_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _submitAnswers_populate_results(event:ResultEvent):void
		{
			var e:SubmitAnswersResultEvent = new SubmitAnswersResultEvent();
		            e.result = event.result as SubmitAnswersResponse;
		                       e.headers = event.headers;
		             submitAnswers_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//service-wide functions
		/**
		 * @see IAdaptiveEngineService#getWebService()
		 */
		public function getWebService():BaseAdaptiveEngineService
		{
			return _baseService;
		}
		
		/**
		 * Set the event listener for the fault event which can be triggered by each of the operations defined by the facade
		 */
		public function addAdaptiveEngineServiceFaultEventListener(listener:Function):void
		{
			addEventListener("fault",listener);
		}
		
		/**
		 * Internal function to re-dispatch the fault event passed on by the base service implementation
		 * @private
		 */
		 
		 private function throwFault(event:FaultEvent):void
		 {
		 	dispatchEvent(event);
		 }
    }
}
