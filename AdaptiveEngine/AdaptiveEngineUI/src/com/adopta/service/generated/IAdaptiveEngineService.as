
/**
 * Service.as
 * This file was auto-generated from WSDL by the Apache Axis2 generator modified by Adobe
 * Any change made to this file will be overwritten when the code is re-generated.
 */
package com.adopta.service.generated{
	import mx.rpc.AsyncToken;
	import flash.utils.ByteArray;
	import mx.rpc.soap.types.*;
               
    public interface IAdaptiveEngineService
    {
    	//Stub functions for the continueCourse operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param arg0
    	 * @param arg1
    	 * @param continueCourse
    	 * @return An AsyncToken
    	 */
    	function continueCourse(continueCourse:ContinueCourse):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function continueCourse_send():AsyncToken;
        
        /**
         * The continueCourse operation lastResult property
         */
        function get continueCourse_lastResult():ContinueCourseResponse;
		/**
		 * @private
		 */
        function set continueCourse_lastResult(lastResult:ContinueCourseResponse):void;
       /**
        * Add a listener for the continueCourse operation successful result event
        * @param The listener function
        */
       function addcontinueCourseEventListener(listener:Function):void;
       
       
        /**
         * The continueCourse operation request wrapper
         */
        function get continueCourse_request_var():ContinueCourse_request;
        
        /**
         * @private
         */
        function set continueCourse_request_var(request:ContinueCourse_request):void;
                   
    	//Stub functions for the findAllComplexities operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param findAllComplexities
    	 * @return An AsyncToken
    	 */
    	function findAllComplexities(findAllComplexities:FindAllComplexities):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function findAllComplexities_send():AsyncToken;
        
        /**
         * The findAllComplexities operation lastResult property
         */
        function get findAllComplexities_lastResult():FindAllComplexitiesResponse;
		/**
		 * @private
		 */
        function set findAllComplexities_lastResult(lastResult:FindAllComplexitiesResponse):void;
       /**
        * Add a listener for the findAllComplexities operation successful result event
        * @param The listener function
        */
       function addfindAllComplexitiesEventListener(listener:Function):void;
       
       
        /**
         * The findAllComplexities operation request wrapper
         */
        function get findAllComplexities_request_var():FindAllComplexities_request;
        
        /**
         * @private
         */
        function set findAllComplexities_request_var(request:FindAllComplexities_request):void;
                   
    	//Stub functions for the findCurrentVisitedPages operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param arg0
    	 * @param findCurrentVisitedPages
    	 * @return An AsyncToken
    	 */
    	function findCurrentVisitedPages(findCurrentVisitedPages:FindCurrentVisitedPages):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function findCurrentVisitedPages_send():AsyncToken;
        
        /**
         * The findCurrentVisitedPages operation lastResult property
         */
        function get findCurrentVisitedPages_lastResult():FindCurrentVisitedPagesResponse;
		/**
		 * @private
		 */
        function set findCurrentVisitedPages_lastResult(lastResult:FindCurrentVisitedPagesResponse):void;
       /**
        * Add a listener for the findCurrentVisitedPages operation successful result event
        * @param The listener function
        */
       function addfindCurrentVisitedPagesEventListener(listener:Function):void;
       
       
        /**
         * The findCurrentVisitedPages operation request wrapper
         */
        function get findCurrentVisitedPages_request_var():FindCurrentVisitedPages_request;
        
        /**
         * @private
         */
        function set findCurrentVisitedPages_request_var(request:FindCurrentVisitedPages_request):void;
                   
    	//Stub functions for the findVisitedPages operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param findVisitedPages
    	 * @param arg0
    	 * @param arg1
    	 * @return An AsyncToken
    	 */
    	function findVisitedPages(findVisitedPages:FindVisitedPages):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function findVisitedPages_send():AsyncToken;
        
        /**
         * The findVisitedPages operation lastResult property
         */
        function get findVisitedPages_lastResult():FindVisitedPagesResponse;
		/**
		 * @private
		 */
        function set findVisitedPages_lastResult(lastResult:FindVisitedPagesResponse):void;
       /**
        * Add a listener for the findVisitedPages operation successful result event
        * @param The listener function
        */
       function addfindVisitedPagesEventListener(listener:Function):void;
       
       
        /**
         * The findVisitedPages operation request wrapper
         */
        function get findVisitedPages_request_var():FindVisitedPages_request;
        
        /**
         * @private
         */
        function set findVisitedPages_request_var(request:FindVisitedPages_request):void;
                   
    	//Stub functions for the findVisitedPaths operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param arg0
    	 * @param findVisitedPaths
    	 * @return An AsyncToken
    	 */
    	function findVisitedPaths(findVisitedPaths:FindVisitedPaths):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function findVisitedPaths_send():AsyncToken;
        
        /**
         * The findVisitedPaths operation lastResult property
         */
        function get findVisitedPaths_lastResult():FindVisitedPathsResponse;
		/**
		 * @private
		 */
        function set findVisitedPaths_lastResult(lastResult:FindVisitedPathsResponse):void;
       /**
        * Add a listener for the findVisitedPaths operation successful result event
        * @param The listener function
        */
       function addfindVisitedPathsEventListener(listener:Function):void;
       
       
        /**
         * The findVisitedPaths operation request wrapper
         */
        function get findVisitedPaths_request_var():FindVisitedPaths_request;
        
        /**
         * @private
         */
        function set findVisitedPaths_request_var(request:FindVisitedPaths_request):void;
                   
    	//Stub functions for the login operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param arg0
    	 * @param arg1
    	 * @param login
    	 * @return An AsyncToken
    	 */
    	function login(login:Login):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function login_send():AsyncToken;
        
        /**
         * The login operation lastResult property
         */
        function get login_lastResult():LoginResponse;
		/**
		 * @private
		 */
        function set login_lastResult(lastResult:LoginResponse):void;
       /**
        * Add a listener for the login operation successful result event
        * @param The listener function
        */
       function addloginEventListener(listener:Function):void;
       
       
        /**
         * The login operation request wrapper
         */
        function get login_request_var():Login_request;
        
        /**
         * @private
         */
        function set login_request_var(request:Login_request):void;
                   
    	//Stub functions for the navigateToPage operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param navigateToPage
    	 * @param arg0
    	 * @param arg1
    	 * @return An AsyncToken
    	 */
    	function navigateToPage(navigateToPage:NavigateToPage):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function navigateToPage_send():AsyncToken;
        
        /**
         * The navigateToPage operation lastResult property
         */
        function get navigateToPage_lastResult():NavigateToPageResponse;
		/**
		 * @private
		 */
        function set navigateToPage_lastResult(lastResult:NavigateToPageResponse):void;
       /**
        * Add a listener for the navigateToPage operation successful result event
        * @param The listener function
        */
       function addnavigateToPageEventListener(listener:Function):void;
       
       
        /**
         * The navigateToPage operation request wrapper
         */
        function get navigateToPage_request_var():NavigateToPage_request;
        
        /**
         * @private
         */
        function set navigateToPage_request_var(request:NavigateToPage_request):void;
                   
    	//Stub functions for the readAllLearners operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param readAllLearners
    	 * @param arg0
    	 * @return An AsyncToken
    	 */
    	function readAllLearners(readAllLearners:ReadAllLearners):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function readAllLearners_send():AsyncToken;
        
        /**
         * The readAllLearners operation lastResult property
         */
        function get readAllLearners_lastResult():ReadAllLearnersResponse;
		/**
		 * @private
		 */
        function set readAllLearners_lastResult(lastResult:ReadAllLearnersResponse):void;
       /**
        * Add a listener for the readAllLearners operation successful result event
        * @param The listener function
        */
       function addreadAllLearnersEventListener(listener:Function):void;
       
       
        /**
         * The readAllLearners operation request wrapper
         */
        function get readAllLearners_request_var():ReadAllLearners_request;
        
        /**
         * @private
         */
        function set readAllLearners_request_var(request:ReadAllLearners_request):void;
                   
    	//Stub functions for the readCoursePortfolios operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param readCoursePortfolios
    	 * @param arg0
    	 * @return An AsyncToken
    	 */
    	function readCoursePortfolios(readCoursePortfolios:ReadCoursePortfolios):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function readCoursePortfolios_send():AsyncToken;
        
        /**
         * The readCoursePortfolios operation lastResult property
         */
        function get readCoursePortfolios_lastResult():ReadCoursePortfoliosResponse;
		/**
		 * @private
		 */
        function set readCoursePortfolios_lastResult(lastResult:ReadCoursePortfoliosResponse):void;
       /**
        * Add a listener for the readCoursePortfolios operation successful result event
        * @param The listener function
        */
       function addreadCoursePortfoliosEventListener(listener:Function):void;
       
       
        /**
         * The readCoursePortfolios operation request wrapper
         */
        function get readCoursePortfolios_request_var():ReadCoursePortfolios_request;
        
        /**
         * @private
         */
        function set readCoursePortfolios_request_var(request:ReadCoursePortfolios_request):void;
                   
    	//Stub functions for the readLearnerCoursePortfolios operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param readLearnerCoursePortfolios
    	 * @param arg0
    	 * @return An AsyncToken
    	 */
    	function readLearnerCoursePortfolios(readLearnerCoursePortfolios:ReadLearnerCoursePortfolios):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function readLearnerCoursePortfolios_send():AsyncToken;
        
        /**
         * The readLearnerCoursePortfolios operation lastResult property
         */
        function get readLearnerCoursePortfolios_lastResult():ReadLearnerCoursePortfoliosResponse;
		/**
		 * @private
		 */
        function set readLearnerCoursePortfolios_lastResult(lastResult:ReadLearnerCoursePortfoliosResponse):void;
       /**
        * Add a listener for the readLearnerCoursePortfolios operation successful result event
        * @param The listener function
        */
       function addreadLearnerCoursePortfoliosEventListener(listener:Function):void;
       
       
        /**
         * The readLearnerCoursePortfolios operation request wrapper
         */
        function get readLearnerCoursePortfolios_request_var():ReadLearnerCoursePortfolios_request;
        
        /**
         * @private
         */
        function set readLearnerCoursePortfolios_request_var(request:ReadLearnerCoursePortfolios_request):void;
                   
    	//Stub functions for the saveCoursePortfolios operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param arg0
    	 * @param saveCoursePortfolios
    	 * @return An AsyncToken
    	 */
    	function saveCoursePortfolios(saveCoursePortfolios:SaveCoursePortfolios):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function saveCoursePortfolios_send():AsyncToken;
        
        /**
         * The saveCoursePortfolios operation lastResult property
         */
        function get saveCoursePortfolios_lastResult():SaveCoursePortfoliosResponse;
		/**
		 * @private
		 */
        function set saveCoursePortfolios_lastResult(lastResult:SaveCoursePortfoliosResponse):void;
       /**
        * Add a listener for the saveCoursePortfolios operation successful result event
        * @param The listener function
        */
       function addsaveCoursePortfoliosEventListener(listener:Function):void;
       
       
        /**
         * The saveCoursePortfolios operation request wrapper
         */
        function get saveCoursePortfolios_request_var():SaveCoursePortfolios_request;
        
        /**
         * @private
         */
        function set saveCoursePortfolios_request_var(request:SaveCoursePortfolios_request):void;
                   
    	//Stub functions for the saveVisitedPaths operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param saveVisitedPaths
    	 * @param arg0
    	 * @return An AsyncToken
    	 */
    	function saveVisitedPaths(saveVisitedPaths:SaveVisitedPaths):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function saveVisitedPaths_send():AsyncToken;
        
        /**
         * The saveVisitedPaths operation lastResult property
         */
        function get saveVisitedPaths_lastResult():SaveVisitedPathsResponse;
		/**
		 * @private
		 */
        function set saveVisitedPaths_lastResult(lastResult:SaveVisitedPathsResponse):void;
       /**
        * Add a listener for the saveVisitedPaths operation successful result event
        * @param The listener function
        */
       function addsaveVisitedPathsEventListener(listener:Function):void;
       
       
        /**
         * The saveVisitedPaths operation request wrapper
         */
        function get saveVisitedPaths_request_var():SaveVisitedPaths_request;
        
        /**
         * @private
         */
        function set saveVisitedPaths_request_var(request:SaveVisitedPaths_request):void;
                   
    	//Stub functions for the startCourse operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param startCourse
    	 * @param arg0
    	 * @param arg1
    	 * @return An AsyncToken
    	 */
    	function startCourse(startCourse:StartCourse):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function startCourse_send():AsyncToken;
        
        /**
         * The startCourse operation lastResult property
         */
        function get startCourse_lastResult():StartCourseResponse;
		/**
		 * @private
		 */
        function set startCourse_lastResult(lastResult:StartCourseResponse):void;
       /**
        * Add a listener for the startCourse operation successful result event
        * @param The listener function
        */
       function addstartCourseEventListener(listener:Function):void;
       
       
        /**
         * The startCourse operation request wrapper
         */
        function get startCourse_request_var():StartCourse_request;
        
        /**
         * @private
         */
        function set startCourse_request_var(request:StartCourse_request):void;
                   
    	//Stub functions for the submitAnswers operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param submitAnswers
    	 * @param arg0
    	 * @param arg1
    	 * @return An AsyncToken
    	 */
    	function submitAnswers(submitAnswers:SubmitAnswers):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function submitAnswers_send():AsyncToken;
        
        /**
         * The submitAnswers operation lastResult property
         */
        function get submitAnswers_lastResult():SubmitAnswersResponse;
		/**
		 * @private
		 */
        function set submitAnswers_lastResult(lastResult:SubmitAnswersResponse):void;
       /**
        * Add a listener for the submitAnswers operation successful result event
        * @param The listener function
        */
       function addsubmitAnswersEventListener(listener:Function):void;
       
       
        /**
         * The submitAnswers operation request wrapper
         */
        function get submitAnswers_request_var():SubmitAnswers_request;
        
        /**
         * @private
         */
        function set submitAnswers_request_var(request:SubmitAnswers_request):void;
                   
        /**
         * Get access to the underlying web service that the stub uses to communicate with the server
         * @return The base service that the facade implements
         */
        function getWebService():BaseAdaptiveEngineService;
	}
}