package com.adopta.actionscript
{
	import com.adopta.service.generated.Role;
	import com.adopta.enum.RoleEnum;
	import com.adopta.service.generated.User;
	
	public class ApplicationContext
	{
		public static var wsdlURL:String = "http://77.70.32.208:8888/AdaptiveEngine/AdaptiveEngineService";
		
		public function ApplicationContext() {}
		
		// Holds a reference to the user that has currently logged in
		public var loggedInUser:User;
		
		public function isAuthor():Boolean
		{
			return hasRole(RoleEnum.AUTHOR);
		}
		
		public function isInstructor():Boolean
        {
            return hasRole(RoleEnum.INSTRUCTOR);
        }
		
		public function isLearner():Boolean
        {
            return hasRole(RoleEnum.LEARNER);
        }
        
        private function hasRole(roleId:Number):Boolean 
        {
            for (var i:int = 0; i < loggedInUser.roles.length; i++) {
                var hasRole:Role = loggedInUser.roles[i];
                if (hasRole.id == roleId) {
                    return true;
                }
            }
            
            return false;
        }
	}
}