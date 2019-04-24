package game.common.auth;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.web.servlet.ModelAndView;

@Aspect
public class AdminSessionAspect {
   
   @Pointcut("execution(public * game.controller.MemberController.*(..))")
   public void memberMaster() {
      
   }
   @Pointcut("execution(public * game.controller.GameController.*(..))")
   public void gameMaster() {
      
   }
   @Pointcut("execution(public * game.controller.EventController.*(..))")
   public void eventMaster() {
      
   }
   
   @Around("memberMaster()||gameMaster()||eventMaster()")
   public ModelAndView loginCheck(ProceedingJoinPoint joinPoint) throws Throwable{
      ModelAndView mav=new ModelAndView();
      HttpServletRequest request=null;
      
      Object[] objArray=joinPoint.getArgs();
      for(Object obj:objArray) {
         if(obj instanceof HttpServletRequest) {
            request=(HttpServletRequest)obj;
         }
      }
      
      if(request!=null) {
         if(request.getSession().getAttribute("master")==null) {
            mav.setViewName("admin/login/index");
         }else {
            mav=(ModelAndView)joinPoint.proceed();
         }
      }else {
         mav=(ModelAndView)joinPoint.proceed();
      }
      return mav;
   }
}