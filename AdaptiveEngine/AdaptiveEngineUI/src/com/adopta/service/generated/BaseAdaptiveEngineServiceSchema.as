package com.adopta.service.generated
{
	 import mx.rpc.xml.Schema
	 public class BaseAdaptiveEngineServiceSchema
	{
		 public var schemas:Array = new Array();
		 public var targetNamespaces:Array = new Array();
		 public function BaseAdaptiveEngineServiceSchema():void
		{
			 var xsdXML0:XML = <xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://schemas.xmlsoap.org/wsdl/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tns="http://webservice.adopta.com/" xmlns:xs="http://www.w3.org/2001/XMLSchema" attributeFormDefault="unqualified" elementFormDefault="unqualified" targetNamespace="http://webservice.adopta.com/">
    <xsd:element name="continueCourse" type="tns:continueCourse"/>
    <xsd:element name="continueCourseResponse" type="tns:continueCourseResponse"/>
    <xsd:element name="findAllComplexities" type="tns:findAllComplexities"/>
    <xsd:element name="findAllComplexitiesResponse" type="tns:findAllComplexitiesResponse"/>
    <xsd:element name="findCurrentVisitedPages" type="tns:findCurrentVisitedPages"/>
    <xsd:element name="findCurrentVisitedPagesResponse" type="tns:findCurrentVisitedPagesResponse"/>
    <xsd:element name="findVisitedPages" type="tns:findVisitedPages"/>
    <xsd:element name="findVisitedPagesResponse" type="tns:findVisitedPagesResponse"/>
    <xsd:element name="findVisitedPaths" type="tns:findVisitedPaths"/>
    <xsd:element name="findVisitedPathsResponse" type="tns:findVisitedPathsResponse"/>
    <xsd:element name="login" type="tns:login"/>
    <xsd:element name="loginResponse" type="tns:loginResponse"/>
    <xsd:element name="navigateToPage" type="tns:navigateToPage"/>
    <xsd:element name="navigateToPageResponse" type="tns:navigateToPageResponse"/>
    <xsd:element name="readAllLearners" type="tns:readAllLearners"/>
    <xsd:element name="readAllLearnersResponse" type="tns:readAllLearnersResponse"/>
    <xsd:element name="readCoursePortfolios" type="tns:readCoursePortfolios"/>
    <xsd:element name="readCoursePortfoliosResponse" type="tns:readCoursePortfoliosResponse"/>
    <xsd:element name="readLearnerCoursePortfolios" type="tns:readLearnerCoursePortfolios"/>
    <xsd:element name="readLearnerCoursePortfoliosResponse" type="tns:readLearnerCoursePortfoliosResponse"/>
    <xsd:element name="saveCoursePortfolios" type="tns:saveCoursePortfolios"/>
    <xsd:element name="saveCoursePortfoliosResponse" type="tns:saveCoursePortfoliosResponse"/>
    <xsd:element name="saveVisitedPaths" type="tns:saveVisitedPaths"/>
    <xsd:element name="saveVisitedPathsResponse" type="tns:saveVisitedPathsResponse"/>
    <xsd:element name="startCourse" type="tns:startCourse"/>
    <xsd:element name="startCourseResponse" type="tns:startCourseResponse"/>
    <xsd:element name="submitAnswers" type="tns:submitAnswers"/>
    <xsd:element name="submitAnswersResponse" type="tns:submitAnswersResponse"/>
    <xsd:complexType name="readLearnerCoursePortfolios">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="arg0" type="xs:long"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="readLearnerCoursePortfoliosResponse">
        <xsd:sequence>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="return" type="tns:learnerCoursePortfolio"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="learnerCoursePortfolio">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="course" type="tns:course"/>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="learner" type="tns:user"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="course">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="name" type="xs:string"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="user">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="learnerStyles" nillable="true" type="tns:learnerStyle"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="ontologies" nillable="true" type="tns:ontology"/>
            <xsd:element minOccurs="0" name="password" type="xs:string"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="roles" nillable="true" type="tns:role"/>
            <xsd:element minOccurs="0" name="status" type="tns:status"/>
            <xsd:element minOccurs="0" name="username" type="xs:string"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="learnerStyle">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element name="percentage" type="xs:float"/>
            <xsd:element minOccurs="0" name="style" type="tns:style"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="style">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="name" type="xs:string"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="ontology">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="learningObjects" nillable="true" type="tns:learningObject"/>
            <xsd:element minOccurs="0" name="name" type="xs:string"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="ontologyMetadata" nillable="true" type="tns:ontologyMetadata"/>
            <xsd:element name="userId" type="xs:long"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="learningObject">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="complexity" type="tns:complexity"/>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="linksToChilds" nillable="true" type="tns:loToLOLink"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="linksToParents" nillable="true" type="tns:loToLOLink"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="lom" nillable="true" type="tns:lom"/>
            <xsd:element minOccurs="0" name="name" type="xs:string"/>
            <xsd:element name="ontologyId" type="xs:long"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="questionAnswers" nillable="true" type="tns:questionAnswer"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="resources" nillable="true" type="tns:learningObjectResource"/>
            <xsd:element minOccurs="0" name="status" type="tns:status"/>
            <xsd:element minOccurs="0" name="subtype" type="tns:learningObjectSubtype"/>
            <xsd:element minOccurs="0" name="type" type="tns:learningObjectType"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="complexity">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="description" type="xs:string"/>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element name="level" type="xs:int"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="loToLOLink">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="label" type="xs:string"/>
            <xsd:element name="loChildId" type="xs:long"/>
            <xsd:element name="loParentId" type="xs:long"/>
            <xsd:element name="lomParent" type="xs:boolean"/>
            <xsd:element minOccurs="0" name="type" type="tns:learningObjectLinkType"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="learningObjectLinkType">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="name" type="xs:string"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="lom">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="definition" type="tns:lomDefinition"/>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element name="learningObjectId" type="xs:long"/>
            <xsd:element minOccurs="0" name="value" type="xs:string"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="lomDefinition">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="name" type="xs:string"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="predefinedValues" nillable="true" type="tns:lomPredefinedValue"/>
            <xsd:element minOccurs="0" name="type" type="xs:string"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="lomPredefinedValue">
        <xsd:sequence>
            <xsd:element name="definitionId" type="xs:long"/>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="value" type="xs:string"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="questionAnswer">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element name="learningObjectId" type="xs:long"/>
            <xsd:element name="points" type="xs:float"/>
            <xsd:element minOccurs="0" name="text" type="xs:string"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="learningObjectResource">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="blobType" type="xs:string"/>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element name="learningObjectId" type="xs:long"/>
            <xsd:element name="order" type="xs:int"/>
            <xsd:element minOccurs="0" name="resource" type="xs:base64Binary"/>
            <xsd:element minOccurs="0" name="stringResource" type="xs:string"/>
            <xsd:element minOccurs="0" name="type" type="tns:resourceType"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="resourceType">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="name" type="xs:string"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="status">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="name" type="xs:string"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="learningObjectSubtype">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="name" type="xs:string"/>
            <xsd:element name="typeId" type="xs:long"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="learningObjectType">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="name" type="xs:string"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="subtypes" nillable="true" type="tns:learningObjectSubtype"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="ontologyMetadata">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="definition" type="tns:ontologyMetadataDefinition"/>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element name="ontologyId" type="xs:long"/>
            <xsd:element minOccurs="0" name="value" type="xs:string"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="ontologyMetadataDefinition">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="name" type="xs:string"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="predefinedValues" nillable="true" type="tns:ontologyMetadataPredefinedValue"/>
            <xsd:element minOccurs="0" name="type" type="xs:string"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="ontologyMetadataPredefinedValue">
        <xsd:sequence>
            <xsd:element name="definitionId" type="xs:long"/>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="value" type="xs:string"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="role">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="description" type="xs:string"/>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="name" type="xs:string"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="readAllLearners">
        <xsd:sequence>
            <xsd:element name="arg0" type="xs:long"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="readAllLearnersResponse">
        <xsd:sequence>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="return" type="tns:user"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="login">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="arg0" type="xs:string"/>
            <xsd:element minOccurs="0" name="arg1" type="xs:string"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="loginResponse">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="return" type="tns:user"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="findAllComplexities">
        <xsd:sequence/>
    </xsd:complexType>
    <xsd:complexType name="findAllComplexitiesResponse">
        <xsd:sequence>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="return" type="tns:complexity"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="saveCoursePortfolios">
        <xsd:sequence>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="arg0" type="tns:coursePortfolio"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="coursePortfolio">
        <xsd:sequence>
            <xsd:element name="addVisitedPaths" type="xs:boolean"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="assessmentRanks" nillable="true" type="tns:assessmentRank"/>
            <xsd:element name="automaticPathSelection" type="xs:boolean"/>
            <xsd:element minOccurs="0" name="course" type="tns:course"/>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="instructor" type="tns:user"/>
            <xsd:element name="numberOfQuestions" type="xs:int"/>
            <xsd:element name="showAllLearningObjects" type="xs:boolean"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="assessmentRank">
        <xsd:sequence>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="complexities" nillable="true" type="tns:complexity"/>
            <xsd:element minOccurs="0" name="coursePortfolioId" type="xs:long"/>
            <xsd:element name="from" type="xs:float"/>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element name="to" type="xs:float"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="saveCoursePortfoliosResponse">
        <xsd:sequence/>
    </xsd:complexType>
    <xsd:complexType name="readCoursePortfolios">
        <xsd:sequence>
            <xsd:element name="arg0" type="xs:long"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="readCoursePortfoliosResponse">
        <xsd:sequence>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="return" type="tns:coursePortfolio"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="startCourse">
        <xsd:sequence>
            <xsd:element name="arg0" type="xs:long"/>
            <xsd:element name="arg1" type="xs:long"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="startCourseResponse">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="return" type="tns:visitedPage"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="visitedPage">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="lastVisitedPageFromSelectedPathId" type="xs:long"/>
            <xsd:element name="learnerCoursePortfolioId" type="xs:long"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="linksToNextPages" nillable="true" type="tns:pageToPageLink"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="linksToPreviousPages" nillable="true" type="tns:pageToPageLink"/>
            <xsd:element minOccurs="0" name="nextPage" type="tns:page"/>
            <xsd:element minOccurs="0" name="page" type="tns:page"/>
            <xsd:element minOccurs="0" name="previousPage" type="tns:page"/>
            <xsd:element minOccurs="0" name="score" type="xs:float"/>
            <xsd:element minOccurs="0" name="selectedPath" type="tns:workingPath"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="visitedPageToLearningObjects" nillable="true" type="tns:visitedPageToLearningObject"/>
            <xsd:element minOccurs="0" name="visitedPathId" type="xs:long"/>
            <xsd:element name="visitingOrder" type="xs:int"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="pageToPageLink">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="annotation" type="xs:string"/>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="label" type="xs:string"/>
            <xsd:element name="nextPageId" type="xs:long"/>
            <xsd:element name="previousPageId" type="xs:long"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="page">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="course" type="tns:course"/>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="linksToNextPages" nillable="true" type="tns:pageToPageLink"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="linksToPreviousPages" nillable="true" type="tns:pageToPageLink"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="pageToLearningObjects" nillable="true" type="tns:pageToLearningObject"/>
            <xsd:element minOccurs="0" name="status" type="tns:status"/>
            <xsd:element minOccurs="0" name="threshold" type="xs:float"/>
            <xsd:element minOccurs="0" name="title" type="xs:string"/>
            <xsd:element minOccurs="0" name="type" type="tns:pageType"/>
            <xsd:element name="x" type="xs:int"/>
            <xsd:element name="y" type="xs:int"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="pageToLearningObject">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="learningObject" type="tns:learningObject"/>
            <xsd:element name="pageId" type="xs:long"/>
            <xsd:element name="position" type="xs:int"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="pageType">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="name" type="xs:string"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="workingPath">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="course" type="tns:course"/>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="name" type="xs:string"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="workingPathPages" nillable="true" type="tns:workingPathPage"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="workingPathStyles" nillable="true" type="tns:workingPathStyle"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="workingPathPage">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="page" type="tns:page"/>
            <xsd:element name="pageIndex" type="xs:int"/>
            <xsd:element name="workingPathId" type="xs:long"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="workingPathStyle">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="style" type="tns:style"/>
            <xsd:element name="weight" type="xs:float"/>
            <xsd:element name="workingPathId" type="xs:long"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="visitedPageToLearningObject">
        <xsd:sequence>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element minOccurs="0" name="learningObject" type="tns:learningObject"/>
            <xsd:element name="position" type="xs:int"/>
            <xsd:element name="visitedPageId" type="xs:long"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="navigateToPage">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="arg0" type="tns:visitedPage"/>
            <xsd:element name="arg1" type="xs:long"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="navigateToPageResponse">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="return" type="tns:visitedPage"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="submitAnswers">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="arg0" type="tns:visitedPage"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="arg1" type="tns:longToListOfLongMapping"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="longToListOfLongMapping">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="key" type="xs:long"/>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="value" nillable="true" type="xs:long"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="submitAnswersResponse">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="return" type="tns:visitedPage"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="continueCourse">
        <xsd:sequence>
            <xsd:element name="arg0" type="xs:long"/>
            <xsd:element name="arg1" type="xs:long"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="continueCourseResponse">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="return" type="tns:visitedPage"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="saveVisitedPaths">
        <xsd:sequence>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="arg0" type="tns:visitedPath"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="visitedPath">
        <xsd:sequence>
            <xsd:element minOccurs="0" name="comment" type="xs:string"/>
            <xsd:element name="id" type="xs:long"/>
            <xsd:element name="learnerCoursePortfolioId" type="xs:long"/>
            <xsd:element minOccurs="0" name="pathId" type="xs:long"/>
            <xsd:element minOccurs="0" name="satisfaction" type="xs:float"/>
            <xsd:element minOccurs="0" name="score" type="xs:float"/>
            <xsd:element name="visitingOrder" type="xs:int"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="saveVisitedPathsResponse">
        <xsd:sequence/>
    </xsd:complexType>
    <xsd:complexType name="findCurrentVisitedPages">
        <xsd:sequence>
            <xsd:element name="arg0" type="xs:long"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="findCurrentVisitedPagesResponse">
        <xsd:sequence>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="return" type="tns:visitedPage"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="findVisitedPages">
        <xsd:sequence>
            <xsd:element name="arg0" type="xs:long"/>
            <xsd:element name="arg1" type="xs:long"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="findVisitedPagesResponse">
        <xsd:sequence>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="return" type="tns:visitedPage"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="findVisitedPaths">
        <xsd:sequence>
            <xsd:element name="arg0" type="xs:long"/>
        </xsd:sequence>
    </xsd:complexType>
    <xsd:complexType name="findVisitedPathsResponse">
        <xsd:sequence>
            <xsd:element maxOccurs="unbounded" minOccurs="0" name="return" type="tns:visitedPath"/>
        </xsd:sequence>
    </xsd:complexType>
</xsd:schema>
;
			 var xsdSchema0:Schema = new Schema(xsdXML0);
			schemas.push(xsdSchema0);
			targetNamespaces.push(new Namespace('','http://webservice.adopta.com/'));
		}
	}
}