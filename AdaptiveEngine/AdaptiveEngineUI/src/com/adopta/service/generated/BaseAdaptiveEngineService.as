/**
 * BaseAdaptiveEngineServiceService.as
 * This file was auto-generated from WSDL by the Apache Axis2 generator modified by Adobe
 * Any change made to this file will be overwritten when the code is re-generated.
 */
package com.adopta.service.generated
{
	import com.adopta.service.util.FlowUIEncoder;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import mx.controls.treeClasses.DefaultDataDescriptor;
	import mx.utils.ObjectUtil;
	import mx.utils.ObjectProxy;
	import mx.messaging.events.MessageFaultEvent;
	import mx.messaging.MessageResponder;
	import mx.messaging.messages.SOAPMessage;
	import mx.messaging.messages.ErrorMessage;
   	import mx.messaging.ChannelSet;
	import mx.messaging.channels.DirectHTTPChannel;
	import mx.rpc.*;
	import mx.rpc.events.*;
	import mx.rpc.soap.*;
	import mx.rpc.wsdl.*;
	import mx.rpc.xml.*;
	import mx.rpc.soap.types.*;
	import mx.collections.ArrayCollection;
	
	/**
	 * Base service implementation, extends the AbstractWebService and adds specific functionality for the selected WSDL
	 * It defines the options and properties for each of the WSDL's operations
	 */ 
	public class BaseAdaptiveEngineService extends AbstractWebService
    {
		private var results:Object;
		private var schemaMgr:SchemaManager;
		private var BaseAdaptiveEngineServiceService:WSDLService;
		private var BaseAdaptiveEngineServicePortType:WSDLPortType;
		private var BaseAdaptiveEngineServiceBinding:WSDLBinding;
		private var BaseAdaptiveEngineServicePort:WSDLPort;
		private var currentOperation:WSDLOperation;
		private var internal_schema:BaseAdaptiveEngineServiceSchema;
	
		/**
		 * Constructor for the base service, initializes all of the WSDL's properties
		 * @param [Optional] The LCDS destination (if available) to use to contact the server
		 * @param [Optional] The URL to the WSDL end-point
		 */
		public function BaseAdaptiveEngineService(destination:String=null, rootURL:String=null)
		{
			super(destination, rootURL);
			if(destination == null)
			{
				//no destination available; must set it to go directly to the target
				this.useProxy = false;
			}
			else
			{
				//specific destination requested; must set proxying to true
				this.useProxy = true;
			}
			
			if(rootURL != null)
			{
				this.endpointURI = rootURL;
			} 
			else 
			{
				this.endpointURI = null;
			}
			internal_schema = new BaseAdaptiveEngineServiceSchema();
			schemaMgr = new SchemaManager();
			for(var i:int;i<internal_schema.schemas.length;i++)
			{
				internal_schema.schemas[i].targetNamespace=internal_schema.targetNamespaces[i];
				schemaMgr.addSchema(internal_schema.schemas[i]);
			}
BaseAdaptiveEngineServiceService = new WSDLService("BaseAdaptiveEngineServiceService");
			BaseAdaptiveEngineServicePort = new WSDLPort("BaseAdaptiveEngineServicePort",BaseAdaptiveEngineServiceService);
        	BaseAdaptiveEngineServiceBinding = new WSDLBinding("BaseAdaptiveEngineServiceBinding");
	        BaseAdaptiveEngineServicePortType = new WSDLPortType("BaseAdaptiveEngineServicePortType");
       		BaseAdaptiveEngineServiceBinding.portType = BaseAdaptiveEngineServicePortType;
       		BaseAdaptiveEngineServicePort.binding = BaseAdaptiveEngineServiceBinding;
       		BaseAdaptiveEngineServiceService.addPort(BaseAdaptiveEngineServicePort);
       		BaseAdaptiveEngineServicePort.endpointURI = "http://127.0.0.1:8080/AdaptiveEngine/AdaptiveEngineService";
       		if(this.endpointURI == null)
       		{
       			this.endpointURI = BaseAdaptiveEngineServicePort.endpointURI; 
       		} 
       		
			var requestMessage:WSDLMessage;
			var responseMessage:WSDLMessage;
			//define the WSDLOperation: new WSDLOperation(methodName)
            var continueCourse:WSDLOperation = new WSDLOperation("continueCourse");
				//input message for the operation
    	        requestMessage = new WSDLMessage("continueCourse");
            				requestMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","continueCourse"),null,new QName("http://webservice.adopta.com/","continueCourse")));
                requestMessage.encoding = new WSDLEncoding();
                requestMessage.encoding.namespaceURI="http://webservice.adopta.com/";
			requestMessage.encoding.useStyle="literal";
                
                responseMessage = new WSDLMessage("continueCourseResponse");
            				responseMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","continueCourseResponse"),null,new QName("http://webservice.adopta.com/","continueCourseResponse")));
                responseMessage.encoding = new WSDLEncoding();
                responseMessage.encoding.namespaceURI="http://webservice.adopta.com/";
                responseMessage.encoding.useStyle="literal";				
				continueCourse.inputMessage = requestMessage;
	        continueCourse.outputMessage = responseMessage;
            continueCourse.schemaManager = this.schemaMgr;
            continueCourse.soapAction = "\"\"";
            continueCourse.style = "document";
            BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.addOperation(continueCourse);
			//define the WSDLOperation: new WSDLOperation(methodName)
            var findAllComplexities:WSDLOperation = new WSDLOperation("findAllComplexities");
				//input message for the operation
    	        requestMessage = new WSDLMessage("findAllComplexities");
            				requestMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","findAllComplexities"),null,new QName("http://webservice.adopta.com/","findAllComplexities")));
                requestMessage.encoding = new WSDLEncoding();
                requestMessage.encoding.namespaceURI="http://webservice.adopta.com/";
			requestMessage.encoding.useStyle="literal";
                
                responseMessage = new WSDLMessage("findAllComplexitiesResponse");
            				responseMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","findAllComplexitiesResponse"),null,new QName("http://webservice.adopta.com/","findAllComplexitiesResponse")));
                responseMessage.encoding = new WSDLEncoding();
                responseMessage.encoding.namespaceURI="http://webservice.adopta.com/";
                responseMessage.encoding.useStyle="literal";				
				findAllComplexities.inputMessage = requestMessage;
	        findAllComplexities.outputMessage = responseMessage;
            findAllComplexities.schemaManager = this.schemaMgr;
            findAllComplexities.soapAction = "\"\"";
            findAllComplexities.style = "document";
            BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.addOperation(findAllComplexities);
			//define the WSDLOperation: new WSDLOperation(methodName)
            var findCurrentVisitedPages:WSDLOperation = new WSDLOperation("findCurrentVisitedPages");
				//input message for the operation
    	        requestMessage = new WSDLMessage("findCurrentVisitedPages");
            				requestMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","findCurrentVisitedPages"),null,new QName("http://webservice.adopta.com/","findCurrentVisitedPages")));
                requestMessage.encoding = new WSDLEncoding();
                requestMessage.encoding.namespaceURI="http://webservice.adopta.com/";
			requestMessage.encoding.useStyle="literal";
                
                responseMessage = new WSDLMessage("findCurrentVisitedPagesResponse");
            				responseMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","findCurrentVisitedPagesResponse"),null,new QName("http://webservice.adopta.com/","findCurrentVisitedPagesResponse")));
                responseMessage.encoding = new WSDLEncoding();
                responseMessage.encoding.namespaceURI="http://webservice.adopta.com/";
                responseMessage.encoding.useStyle="literal";				
				findCurrentVisitedPages.inputMessage = requestMessage;
	        findCurrentVisitedPages.outputMessage = responseMessage;
            findCurrentVisitedPages.schemaManager = this.schemaMgr;
            findCurrentVisitedPages.soapAction = "\"\"";
            findCurrentVisitedPages.style = "document";
            BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.addOperation(findCurrentVisitedPages);
			//define the WSDLOperation: new WSDLOperation(methodName)
            var findVisitedPages:WSDLOperation = new WSDLOperation("findVisitedPages");
				//input message for the operation
    	        requestMessage = new WSDLMessage("findVisitedPages");
            				requestMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","findVisitedPages"),null,new QName("http://webservice.adopta.com/","findVisitedPages")));
                requestMessage.encoding = new WSDLEncoding();
                requestMessage.encoding.namespaceURI="http://webservice.adopta.com/";
			requestMessage.encoding.useStyle="literal";
                
                responseMessage = new WSDLMessage("findVisitedPagesResponse");
            				responseMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","findVisitedPagesResponse"),null,new QName("http://webservice.adopta.com/","findVisitedPagesResponse")));
                responseMessage.encoding = new WSDLEncoding();
                responseMessage.encoding.namespaceURI="http://webservice.adopta.com/";
                responseMessage.encoding.useStyle="literal";				
				findVisitedPages.inputMessage = requestMessage;
	        findVisitedPages.outputMessage = responseMessage;
            findVisitedPages.schemaManager = this.schemaMgr;
            findVisitedPages.soapAction = "\"\"";
            findVisitedPages.style = "document";
            BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.addOperation(findVisitedPages);
			//define the WSDLOperation: new WSDLOperation(methodName)
            var findVisitedPaths:WSDLOperation = new WSDLOperation("findVisitedPaths");
				//input message for the operation
    	        requestMessage = new WSDLMessage("findVisitedPaths");
            				requestMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","findVisitedPaths"),null,new QName("http://webservice.adopta.com/","findVisitedPaths")));
                requestMessage.encoding = new WSDLEncoding();
                requestMessage.encoding.namespaceURI="http://webservice.adopta.com/";
			requestMessage.encoding.useStyle="literal";
                
                responseMessage = new WSDLMessage("findVisitedPathsResponse");
            				responseMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","findVisitedPathsResponse"),null,new QName("http://webservice.adopta.com/","findVisitedPathsResponse")));
                responseMessage.encoding = new WSDLEncoding();
                responseMessage.encoding.namespaceURI="http://webservice.adopta.com/";
                responseMessage.encoding.useStyle="literal";				
				findVisitedPaths.inputMessage = requestMessage;
	        findVisitedPaths.outputMessage = responseMessage;
            findVisitedPaths.schemaManager = this.schemaMgr;
            findVisitedPaths.soapAction = "\"\"";
            findVisitedPaths.style = "document";
            BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.addOperation(findVisitedPaths);
			//define the WSDLOperation: new WSDLOperation(methodName)
            var login:WSDLOperation = new WSDLOperation("login");
				//input message for the operation
    	        requestMessage = new WSDLMessage("login");
            				requestMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","login"),null,new QName("http://webservice.adopta.com/","login")));
                requestMessage.encoding = new WSDLEncoding();
                requestMessage.encoding.namespaceURI="http://webservice.adopta.com/";
			requestMessage.encoding.useStyle="literal";
                
                responseMessage = new WSDLMessage("loginResponse");
            				responseMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","loginResponse"),null,new QName("http://webservice.adopta.com/","loginResponse")));
                responseMessage.encoding = new WSDLEncoding();
                responseMessage.encoding.namespaceURI="http://webservice.adopta.com/";
                responseMessage.encoding.useStyle="literal";				
				login.inputMessage = requestMessage;
	        login.outputMessage = responseMessage;
            login.schemaManager = this.schemaMgr;
            login.soapAction = "\"\"";
            login.style = "document";
            BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.addOperation(login);
			//define the WSDLOperation: new WSDLOperation(methodName)
            var navigateToPage:WSDLOperation = new WSDLOperation("navigateToPage");
				//input message for the operation
    	        requestMessage = new WSDLMessage("navigateToPage");
            				requestMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","navigateToPage"),null,new QName("http://webservice.adopta.com/","navigateToPage")));
                requestMessage.encoding = new WSDLEncoding();
                requestMessage.encoding.namespaceURI="http://webservice.adopta.com/";
			requestMessage.encoding.useStyle="literal";
                
                responseMessage = new WSDLMessage("navigateToPageResponse");
            				responseMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","navigateToPageResponse"),null,new QName("http://webservice.adopta.com/","navigateToPageResponse")));
                responseMessage.encoding = new WSDLEncoding();
                responseMessage.encoding.namespaceURI="http://webservice.adopta.com/";
                responseMessage.encoding.useStyle="literal";				
				navigateToPage.inputMessage = requestMessage;
	        navigateToPage.outputMessage = responseMessage;
            navigateToPage.schemaManager = this.schemaMgr;
            navigateToPage.soapAction = "\"\"";
            navigateToPage.style = "document";
            BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.addOperation(navigateToPage);
			//define the WSDLOperation: new WSDLOperation(methodName)
            var readAllLearners:WSDLOperation = new WSDLOperation("readAllLearners");
				//input message for the operation
    	        requestMessage = new WSDLMessage("readAllLearners");
            				requestMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","readAllLearners"),null,new QName("http://webservice.adopta.com/","readAllLearners")));
                requestMessage.encoding = new WSDLEncoding();
                requestMessage.encoding.namespaceURI="http://webservice.adopta.com/";
			requestMessage.encoding.useStyle="literal";
                
                responseMessage = new WSDLMessage("readAllLearnersResponse");
            				responseMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","readAllLearnersResponse"),null,new QName("http://webservice.adopta.com/","readAllLearnersResponse")));
                responseMessage.encoding = new WSDLEncoding();
                responseMessage.encoding.namespaceURI="http://webservice.adopta.com/";
                responseMessage.encoding.useStyle="literal";				
				readAllLearners.inputMessage = requestMessage;
	        readAllLearners.outputMessage = responseMessage;
            readAllLearners.schemaManager = this.schemaMgr;
            readAllLearners.soapAction = "\"\"";
            readAllLearners.style = "document";
            BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.addOperation(readAllLearners);
			//define the WSDLOperation: new WSDLOperation(methodName)
            var readCoursePortfolios:WSDLOperation = new WSDLOperation("readCoursePortfolios");
				//input message for the operation
    	        requestMessage = new WSDLMessage("readCoursePortfolios");
            				requestMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","readCoursePortfolios"),null,new QName("http://webservice.adopta.com/","readCoursePortfolios")));
                requestMessage.encoding = new WSDLEncoding();
                requestMessage.encoding.namespaceURI="http://webservice.adopta.com/";
			requestMessage.encoding.useStyle="literal";
                
                responseMessage = new WSDLMessage("readCoursePortfoliosResponse");
            				responseMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","readCoursePortfoliosResponse"),null,new QName("http://webservice.adopta.com/","readCoursePortfoliosResponse")));
                responseMessage.encoding = new WSDLEncoding();
                responseMessage.encoding.namespaceURI="http://webservice.adopta.com/";
                responseMessage.encoding.useStyle="literal";				
				readCoursePortfolios.inputMessage = requestMessage;
	        readCoursePortfolios.outputMessage = responseMessage;
            readCoursePortfolios.schemaManager = this.schemaMgr;
            readCoursePortfolios.soapAction = "\"\"";
            readCoursePortfolios.style = "document";
            BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.addOperation(readCoursePortfolios);
			//define the WSDLOperation: new WSDLOperation(methodName)
            var readLearnerCoursePortfolios:WSDLOperation = new WSDLOperation("readLearnerCoursePortfolios");
				//input message for the operation
    	        requestMessage = new WSDLMessage("readLearnerCoursePortfolios");
            				requestMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","readLearnerCoursePortfolios"),null,new QName("http://webservice.adopta.com/","readLearnerCoursePortfolios")));
                requestMessage.encoding = new WSDLEncoding();
                requestMessage.encoding.namespaceURI="http://webservice.adopta.com/";
			requestMessage.encoding.useStyle="literal";
                
                responseMessage = new WSDLMessage("readLearnerCoursePortfoliosResponse");
            				responseMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","readLearnerCoursePortfoliosResponse"),null,new QName("http://webservice.adopta.com/","readLearnerCoursePortfoliosResponse")));
                responseMessage.encoding = new WSDLEncoding();
                responseMessage.encoding.namespaceURI="http://webservice.adopta.com/";
                responseMessage.encoding.useStyle="literal";				
				readLearnerCoursePortfolios.inputMessage = requestMessage;
	        readLearnerCoursePortfolios.outputMessage = responseMessage;
            readLearnerCoursePortfolios.schemaManager = this.schemaMgr;
            readLearnerCoursePortfolios.soapAction = "\"\"";
            readLearnerCoursePortfolios.style = "document";
            BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.addOperation(readLearnerCoursePortfolios);
			//define the WSDLOperation: new WSDLOperation(methodName)
            var saveCoursePortfolios:WSDLOperation = new WSDLOperation("saveCoursePortfolios");
				//input message for the operation
    	        requestMessage = new WSDLMessage("saveCoursePortfolios");
            				requestMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","saveCoursePortfolios"),null,new QName("http://webservice.adopta.com/","saveCoursePortfolios")));
                requestMessage.encoding = new WSDLEncoding();
                requestMessage.encoding.namespaceURI="http://webservice.adopta.com/";
			requestMessage.encoding.useStyle="literal";
                
                responseMessage = new WSDLMessage("saveCoursePortfoliosResponse");
            				responseMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","saveCoursePortfoliosResponse"),null,new QName("http://webservice.adopta.com/","saveCoursePortfoliosResponse")));
                responseMessage.encoding = new WSDLEncoding();
                responseMessage.encoding.namespaceURI="http://webservice.adopta.com/";
                responseMessage.encoding.useStyle="literal";				
				saveCoursePortfolios.inputMessage = requestMessage;
	        saveCoursePortfolios.outputMessage = responseMessage;
            saveCoursePortfolios.schemaManager = this.schemaMgr;
            saveCoursePortfolios.soapAction = "\"\"";
            saveCoursePortfolios.style = "document";
            BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.addOperation(saveCoursePortfolios);
			//define the WSDLOperation: new WSDLOperation(methodName)
            var saveVisitedPaths:WSDLOperation = new WSDLOperation("saveVisitedPaths");
				//input message for the operation
    	        requestMessage = new WSDLMessage("saveVisitedPaths");
            				requestMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","saveVisitedPaths"),null,new QName("http://webservice.adopta.com/","saveVisitedPaths")));
                requestMessage.encoding = new WSDLEncoding();
                requestMessage.encoding.namespaceURI="http://webservice.adopta.com/";
			requestMessage.encoding.useStyle="literal";
                
                responseMessage = new WSDLMessage("saveVisitedPathsResponse");
            				responseMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","saveVisitedPathsResponse"),null,new QName("http://webservice.adopta.com/","saveVisitedPathsResponse")));
                responseMessage.encoding = new WSDLEncoding();
                responseMessage.encoding.namespaceURI="http://webservice.adopta.com/";
                responseMessage.encoding.useStyle="literal";				
				saveVisitedPaths.inputMessage = requestMessage;
	        saveVisitedPaths.outputMessage = responseMessage;
            saveVisitedPaths.schemaManager = this.schemaMgr;
            saveVisitedPaths.soapAction = "\"\"";
            saveVisitedPaths.style = "document";
            BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.addOperation(saveVisitedPaths);
			//define the WSDLOperation: new WSDLOperation(methodName)
            var startCourse:WSDLOperation = new WSDLOperation("startCourse");
				//input message for the operation
    	        requestMessage = new WSDLMessage("startCourse");
            				requestMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","startCourse"),null,new QName("http://webservice.adopta.com/","startCourse")));
                requestMessage.encoding = new WSDLEncoding();
                requestMessage.encoding.namespaceURI="http://webservice.adopta.com/";
			requestMessage.encoding.useStyle="literal";
                
                responseMessage = new WSDLMessage("startCourseResponse");
            				responseMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","startCourseResponse"),null,new QName("http://webservice.adopta.com/","startCourseResponse")));
                responseMessage.encoding = new WSDLEncoding();
                responseMessage.encoding.namespaceURI="http://webservice.adopta.com/";
                responseMessage.encoding.useStyle="literal";				
				startCourse.inputMessage = requestMessage;
	        startCourse.outputMessage = responseMessage;
            startCourse.schemaManager = this.schemaMgr;
            startCourse.soapAction = "\"\"";
            startCourse.style = "document";
            BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.addOperation(startCourse);
			//define the WSDLOperation: new WSDLOperation(methodName)
            var submitAnswers:WSDLOperation = new WSDLOperation("submitAnswers");
				//input message for the operation
    	        requestMessage = new WSDLMessage("submitAnswers");
            				requestMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","submitAnswers"),null,new QName("http://webservice.adopta.com/","submitAnswers")));
                requestMessage.encoding = new WSDLEncoding();
                requestMessage.encoding.namespaceURI="http://webservice.adopta.com/";
			requestMessage.encoding.useStyle="literal";
                
                responseMessage = new WSDLMessage("submitAnswersResponse");
            				responseMessage.addPart(new WSDLMessagePart(new QName("http://webservice.adopta.com/","submitAnswersResponse"),null,new QName("http://webservice.adopta.com/","submitAnswersResponse")));
                responseMessage.encoding = new WSDLEncoding();
                responseMessage.encoding.namespaceURI="http://webservice.adopta.com/";
                responseMessage.encoding.useStyle="literal";				
				submitAnswers.inputMessage = requestMessage;
	        submitAnswers.outputMessage = responseMessage;
            submitAnswers.schemaManager = this.schemaMgr;
            submitAnswers.soapAction = "\"\"";
            submitAnswers.style = "document";
            BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.addOperation(submitAnswers);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","navigateToPage"),com.adopta.service.generated.NavigateToPage);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","workingPath"),com.adopta.service.generated.WorkingPath);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","style"),com.adopta.service.generated.Style);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","ontologyMetadata"),com.adopta.service.generated.OntologyMetadata);
							SchemaTypeRegistry.getInstance().registerCollectionClass(new QName("http://webservice.adopta.com/","findAllComplexitiesResponse"),com.adopta.service.generated.FindAllComplexitiesResponse);
							SchemaTypeRegistry.getInstance().registerCollectionClass(new QName("http://webservice.adopta.com/","readAllLearnersResponse"),com.adopta.service.generated.ReadAllLearnersResponse);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","learningObjectSubtype"),com.adopta.service.generated.LearningObjectSubtype);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","pageToPageLink"),com.adopta.service.generated.PageToPageLink);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","submitAnswersResponse"),com.adopta.service.generated.SubmitAnswersResponse);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","learnerStyle"),com.adopta.service.generated.LearnerStyle);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","findVisitedPaths"),com.adopta.service.generated.FindVisitedPaths);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","complexity"),com.adopta.service.generated.Complexity);
							SchemaTypeRegistry.getInstance().registerCollectionClass(new QName("http://webservice.adopta.com/","saveVisitedPaths"),com.adopta.service.generated.SaveVisitedPaths);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","user"),com.adopta.service.generated.User);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","pageType"),com.adopta.service.generated.PageType);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","longToListOfLongMapping"),com.adopta.service.generated.LongToListOfLongMapping);
							SchemaTypeRegistry.getInstance().registerCollectionClass(new QName("http://webservice.adopta.com/","findCurrentVisitedPagesResponse"),com.adopta.service.generated.FindCurrentVisitedPagesResponse);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","learningObjectLinkType"),com.adopta.service.generated.LearningObjectLinkType);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","ontologyMetadataPredefinedValue"),com.adopta.service.generated.OntologyMetadataPredefinedValue);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","learningObject"),com.adopta.service.generated.LearningObject);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","resourceType"),com.adopta.service.generated.ResourceType);
							SchemaTypeRegistry.getInstance().registerCollectionClass(new QName("http://webservice.adopta.com/","readCoursePortfoliosResponse"),com.adopta.service.generated.ReadCoursePortfoliosResponse);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","learningObjectType"),com.adopta.service.generated.LearningObjectType);
							SchemaTypeRegistry.getInstance().registerCollectionClass(new QName("http://webservice.adopta.com/","findVisitedPagesResponse"),com.adopta.service.generated.FindVisitedPagesResponse);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","navigateToPageResponse"),com.adopta.service.generated.NavigateToPageResponse);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","loginResponse"),com.adopta.service.generated.LoginResponse);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","learnerCoursePortfolio"),com.adopta.service.generated.LearnerCoursePortfolio);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","pageToLearningObject"),com.adopta.service.generated.PageToLearningObject);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","role"),com.adopta.service.generated.Role);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","readAllLearners"),com.adopta.service.generated.ReadAllLearners);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","login"),com.adopta.service.generated.Login);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","course"),com.adopta.service.generated.Course);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","loToLOLink"),com.adopta.service.generated.LoToLOLink);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","saveVisitedPathsResponse"),com.adopta.service.generated.SaveVisitedPathsResponse);
							SchemaTypeRegistry.getInstance().registerCollectionClass(new QName("http://webservice.adopta.com/","findVisitedPathsResponse"),com.adopta.service.generated.FindVisitedPathsResponse);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","page"),com.adopta.service.generated.Page);
							SchemaTypeRegistry.getInstance().registerCollectionClass(new QName("http://webservice.adopta.com/","readLearnerCoursePortfoliosResponse"),com.adopta.service.generated.ReadLearnerCoursePortfoliosResponse);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","coursePortfolio"),com.adopta.service.generated.CoursePortfolio);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","startCourseResponse"),com.adopta.service.generated.StartCourseResponse);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","lomDefinition"),com.adopta.service.generated.LomDefinition);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","startCourse"),com.adopta.service.generated.StartCourse);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","assessmentRank"),com.adopta.service.generated.AssessmentRank);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","visitedPageToLearningObject"),com.adopta.service.generated.VisitedPageToLearningObject);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","workingPathPage"),com.adopta.service.generated.WorkingPathPage);
							SchemaTypeRegistry.getInstance().registerCollectionClass(new QName("http://webservice.adopta.com/","saveCoursePortfolios"),com.adopta.service.generated.SaveCoursePortfolios);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","submitAnswers"),com.adopta.service.generated.SubmitAnswers);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","findCurrentVisitedPages"),com.adopta.service.generated.FindCurrentVisitedPages);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","learningObjectResource"),com.adopta.service.generated.LearningObjectResource);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","saveCoursePortfoliosResponse"),com.adopta.service.generated.SaveCoursePortfoliosResponse);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","findAllComplexities"),com.adopta.service.generated.FindAllComplexities);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","visitedPath"),com.adopta.service.generated.VisitedPath);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","findVisitedPages"),com.adopta.service.generated.FindVisitedPages);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","continueCourse"),com.adopta.service.generated.ContinueCourse);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","visitedPage"),com.adopta.service.generated.VisitedPage);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","questionAnswer"),com.adopta.service.generated.QuestionAnswer);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","lomPredefinedValue"),com.adopta.service.generated.LomPredefinedValue);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","readLearnerCoursePortfolios"),com.adopta.service.generated.ReadLearnerCoursePortfolios);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","ontologyMetadataDefinition"),com.adopta.service.generated.OntologyMetadataDefinition);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","readCoursePortfolios"),com.adopta.service.generated.ReadCoursePortfolios);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","ontology"),com.adopta.service.generated.Ontology);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","continueCourseResponse"),com.adopta.service.generated.ContinueCourseResponse);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","lom"),com.adopta.service.generated.Lom);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","status"),com.adopta.service.generated.Status);
							SchemaTypeRegistry.getInstance().registerClass(new QName("http://webservice.adopta.com/","workingPathStyle"),com.adopta.service.generated.WorkingPathStyle);
		}
		/**
		 * Performs the low level call to the server for the operation
		 * It passes along the headers and the operation arguments
		 * @param continueCourse
		 * @return Asynchronous token
		 */
		public function continueCourse(continueCourse:ContinueCourse):AsyncToken
		{
			var headerArray:Array = new Array();
            var out:Object = new Object();
            out["continueCourse"] = continueCourse;
	            currentOperation = BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.getOperation("continueCourse");
            var pc:PendingCall = new PendingCall(out,headerArray);
            call(currentOperation,out,pc.token,pc.headers);
            return pc.token;
		}
		/**
		 * Performs the low level call to the server for the operation
		 * It passes along the headers and the operation arguments
		 * @param findAllComplexities
		 * @return Asynchronous token
		 */
		public function findAllComplexities(findAllComplexities:FindAllComplexities):AsyncToken
		{
			var headerArray:Array = new Array();
            var out:Object = new Object();
            out["findAllComplexities"] = findAllComplexities;
	            currentOperation = BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.getOperation("findAllComplexities");
            var pc:PendingCall = new PendingCall(out,headerArray);
            call(currentOperation,out,pc.token,pc.headers);
            return pc.token;
		}
		/**
		 * Performs the low level call to the server for the operation
		 * It passes along the headers and the operation arguments
		 * @param findCurrentVisitedPages
		 * @return Asynchronous token
		 */
		public function findCurrentVisitedPages(findCurrentVisitedPages:FindCurrentVisitedPages):AsyncToken
		{
			var headerArray:Array = new Array();
            var out:Object = new Object();
            out["findCurrentVisitedPages"] = findCurrentVisitedPages;
	            currentOperation = BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.getOperation("findCurrentVisitedPages");
            var pc:PendingCall = new PendingCall(out,headerArray);
            call(currentOperation,out,pc.token,pc.headers);
            return pc.token;
		}
		/**
		 * Performs the low level call to the server for the operation
		 * It passes along the headers and the operation arguments
		 * @param findVisitedPages
		 * @return Asynchronous token
		 */
		public function findVisitedPages(findVisitedPages:FindVisitedPages):AsyncToken
		{
			var headerArray:Array = new Array();
            var out:Object = new Object();
            out["findVisitedPages"] = findVisitedPages;
	            currentOperation = BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.getOperation("findVisitedPages");
            var pc:PendingCall = new PendingCall(out,headerArray);
            call(currentOperation,out,pc.token,pc.headers);
            return pc.token;
		}
		/**
		 * Performs the low level call to the server for the operation
		 * It passes along the headers and the operation arguments
		 * @param findVisitedPaths
		 * @return Asynchronous token
		 */
		public function findVisitedPaths(findVisitedPaths:FindVisitedPaths):AsyncToken
		{
			var headerArray:Array = new Array();
            var out:Object = new Object();
            out["findVisitedPaths"] = findVisitedPaths;
	            currentOperation = BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.getOperation("findVisitedPaths");
            var pc:PendingCall = new PendingCall(out,headerArray);
            call(currentOperation,out,pc.token,pc.headers);
            return pc.token;
		}
		/**
		 * Performs the low level call to the server for the operation
		 * It passes along the headers and the operation arguments
		 * @param login
		 * @return Asynchronous token
		 */
		public function login(login:Login):AsyncToken
		{
			var headerArray:Array = new Array();
            var out:Object = new Object();
            out["login"] = login;
	            currentOperation = BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.getOperation("login");
            var pc:PendingCall = new PendingCall(out,headerArray);
            call(currentOperation,out,pc.token,pc.headers);
            return pc.token;
		}
		/**
		 * Performs the low level call to the server for the operation
		 * It passes along the headers and the operation arguments
		 * @param navigateToPage
		 * @return Asynchronous token
		 */
		public function navigateToPage(navigateToPage:NavigateToPage):AsyncToken
		{
			var headerArray:Array = new Array();
            var out:Object = new Object();
            out["navigateToPage"] = navigateToPage;
	            currentOperation = BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.getOperation("navigateToPage");
            var pc:PendingCall = new PendingCall(out,headerArray);
            call(currentOperation,out,pc.token,pc.headers);
            return pc.token;
		}
		/**
		 * Performs the low level call to the server for the operation
		 * It passes along the headers and the operation arguments
		 * @param readAllLearners
		 * @return Asynchronous token
		 */
		public function readAllLearners(readAllLearners:ReadAllLearners):AsyncToken
		{
			var headerArray:Array = new Array();
            var out:Object = new Object();
            out["readAllLearners"] = readAllLearners;
	            currentOperation = BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.getOperation("readAllLearners");
            var pc:PendingCall = new PendingCall(out,headerArray);
            call(currentOperation,out,pc.token,pc.headers);
            return pc.token;
		}
		/**
		 * Performs the low level call to the server for the operation
		 * It passes along the headers and the operation arguments
		 * @param readCoursePortfolios
		 * @return Asynchronous token
		 */
		public function readCoursePortfolios(readCoursePortfolios:ReadCoursePortfolios):AsyncToken
		{
			var headerArray:Array = new Array();
            var out:Object = new Object();
            out["readCoursePortfolios"] = readCoursePortfolios;
	            currentOperation = BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.getOperation("readCoursePortfolios");
            var pc:PendingCall = new PendingCall(out,headerArray);
            call(currentOperation,out,pc.token,pc.headers);
            return pc.token;
		}
		/**
		 * Performs the low level call to the server for the operation
		 * It passes along the headers and the operation arguments
		 * @param readLearnerCoursePortfolios
		 * @return Asynchronous token
		 */
		public function readLearnerCoursePortfolios(readLearnerCoursePortfolios:ReadLearnerCoursePortfolios):AsyncToken
		{
			var headerArray:Array = new Array();
            var out:Object = new Object();
            out["readLearnerCoursePortfolios"] = readLearnerCoursePortfolios;
	            currentOperation = BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.getOperation("readLearnerCoursePortfolios");
            var pc:PendingCall = new PendingCall(out,headerArray);
            call(currentOperation,out,pc.token,pc.headers);
            return pc.token;
		}
		/**
		 * Performs the low level call to the server for the operation
		 * It passes along the headers and the operation arguments
		 * @param saveCoursePortfolios
		 * @return Asynchronous token
		 */
		public function saveCoursePortfolios(saveCoursePortfolios:SaveCoursePortfolios):AsyncToken
		{
			var headerArray:Array = new Array();
            var out:Object = new Object();
            out["saveCoursePortfolios"] = saveCoursePortfolios;
	            currentOperation = BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.getOperation("saveCoursePortfolios");
            var pc:PendingCall = new PendingCall(out,headerArray);
            call(currentOperation,out,pc.token,pc.headers);
            return pc.token;
		}
		/**
		 * Performs the low level call to the server for the operation
		 * It passes along the headers and the operation arguments
		 * @param saveVisitedPaths
		 * @return Asynchronous token
		 */
		public function saveVisitedPaths(saveVisitedPaths:SaveVisitedPaths):AsyncToken
		{
			var headerArray:Array = new Array();
            var out:Object = new Object();
            out["saveVisitedPaths"] = saveVisitedPaths;
	            currentOperation = BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.getOperation("saveVisitedPaths");
            var pc:PendingCall = new PendingCall(out,headerArray);
            call(currentOperation,out,pc.token,pc.headers);
            return pc.token;
		}
		/**
		 * Performs the low level call to the server for the operation
		 * It passes along the headers and the operation arguments
		 * @param startCourse
		 * @return Asynchronous token
		 */
		public function startCourse(startCourse:StartCourse):AsyncToken
		{
			var headerArray:Array = new Array();
            var out:Object = new Object();
            out["startCourse"] = startCourse;
	            currentOperation = BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.getOperation("startCourse");
            var pc:PendingCall = new PendingCall(out,headerArray);
            call(currentOperation,out,pc.token,pc.headers);
            return pc.token;
		}
		/**
		 * Performs the low level call to the server for the operation
		 * It passes along the headers and the operation arguments
		 * @param submitAnswers
		 * @return Asynchronous token
		 */
		public function submitAnswers(submitAnswers:SubmitAnswers):AsyncToken
		{
			var headerArray:Array = new Array();
            var out:Object = new Object();
            out["submitAnswers"] = submitAnswers;
	            currentOperation = BaseAdaptiveEngineServiceService.getPort("BaseAdaptiveEngineServicePort").binding.portType.getOperation("submitAnswers");
            var pc:PendingCall = new PendingCall(out,headerArray);
            call(currentOperation,out,pc.token,pc.headers);
            return pc.token;
		}
        /**
         * Performs the actual call to the remove server
         * It SOAP-encodes the message using the schema and WSDL operation options set above and then calls the server using 
         * an async invoker
         * It also registers internal event handlers for the result / fault cases
         * @private
         */
        private function call(operation:WSDLOperation,args:Object,token:AsyncToken,headers:Array=null):void
        {
	    	var enc:SOAPEncoder = new FlowUIEncoder();
	    	enc.strictNillability = true;
	        var soap:Object = new Object;
	        var message:SOAPMessage = new SOAPMessage();
	        enc.wsdlOperation = operation;
	        soap = enc.encodeRequest(args,headers);
	        message.setSOAPAction(operation.soapAction);
	        message.body = soap.toString();
	        message.url=endpointURI;
            var inv:AsyncRequest = new AsyncRequest();
            inv.destination = super.destination;
            //we need this to handle multiple asynchronous calls 
            var wrappedData:Object = new Object();
            wrappedData.operation = currentOperation;
            wrappedData.returnToken = token;
            if(!this.useProxy)
            {
            	var dcs:ChannelSet = new ChannelSet();	
	        	dcs.addChannel(new DirectHTTPChannel("direct_http_channel"));
            	inv.channelSet = dcs;
            }                
            var processRes:AsyncResponder = new AsyncResponder(processResult,faultResult,wrappedData);
            inv.invoke(message,processRes);
		}
        
        /**
         * Internal event handler to process a successful operation call from the server
         * The result is decoded using the schema and operation settings and then the events get passed on to the actual facade that the user employs in the application 
         * @private
         */
		private function processResult(result:Object,wrappedData:Object):void
           {
           		var headers:Object;
           		var token:AsyncToken = wrappedData.returnToken;
                var currentOperation:WSDLOperation = wrappedData.operation;
                var decoder:SOAPDecoder = new SOAPDecoder();
                decoder.resultFormat = "object";
                decoder.headerFormat = "object";
                decoder.multiplePartsFormat = "object";
                decoder.ignoreWhitespace = true;
                decoder.makeObjectsBindable=false;
                decoder.wsdlOperation = currentOperation;
                decoder.schemaManager = currentOperation.schemaManager;
                var body:Object = result.message.body;
                var stringResult:String = String(body);
                if(stringResult == null  || stringResult == "")
                	return;
                var soapResult:SOAPResult = decoder.decodeResponse(result.message.body);
                if(soapResult.isFault)
                {
	                var faults:Array = soapResult.result as Array;
	                for each (var soapFault:Fault in faults)
	                {
		                var soapFaultEvent:FaultEvent = FaultEvent.createEvent(soapFault,token,null);
		                token.dispatchEvent(soapFaultEvent);
	                }
                } else {
	                result = soapResult.result;
	                headers = soapResult.headers;
	                var event:ResultEvent = ResultEvent.createEvent(result,token,null);
	                event.headers = headers;
	                token.dispatchEvent(event);
                }
           }
           	/**
           	 * Handles the cases when there are errors calling the operation on the server
           	 * This is not the case for SOAP faults, which is handled by the SOAP decoder in the result handler
           	 * but more critical errors, like network outage or the impossibility to connect to the server
           	 * The fault is dispatched upwards to the facade so that the user can do something meaningful 
           	 * @private
           	 */
			private function faultResult(error:MessageFaultEvent,token:Object):void
			{
				//when there is a network error the token is actually the wrappedData object from above	
				if(!(token is AsyncToken))
					token = token.returnToken;
				token.dispatchEvent(new FaultEvent(FaultEvent.FAULT,true,true,new Fault(error.faultCode,error.faultString,error.faultDetail)));
			}
		}
	}

	import mx.rpc.AsyncToken;
	import mx.rpc.AsyncResponder;
	import mx.rpc.wsdl.WSDLBinding;
                
    /**
     * Internal class to handle multiple operation call scheduling
     * It allows us to pass data about the operation being encoded / decoded to and from the SOAP encoder / decoder units. 
     * @private
     */
    class PendingCall
    {
		public var args:*;
		public var headers:Array;
		public var token:AsyncToken;
		
		public function PendingCall(args:Object, headers:Array=null)
		{
			this.args = args;
			this.headers = headers;
			this.token = new AsyncToken(null);
		}
	}