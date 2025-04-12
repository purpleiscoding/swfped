package org.papervision3d.core.log
{
   import flash.events.EventDispatcher;
   import org.papervision3d.core.log.event.PaperLoggerEvent;
   
   public class PaperLogger extends EventDispatcher
   {
      private static var instance:PaperLogger;
      
      public var traceLogger:PaperTraceLogger;
      
      public function PaperLogger()
      {
         super();
         if(instance)
         {
            throw new Error("Don\'t call the PaperLogger constructor directly");
         }
         traceLogger = new PaperTraceLogger();
         registerLogger(traceLogger);
      }
      
      public static function debug(param1:String, param2:Object = null, ... rest) : void
      {
         getInstance().debug(param1);
      }
      
      public static function log(param1:String, param2:Object = null, ... rest) : void
      {
         getInstance().log(param1);
      }
      
      public static function error(param1:String, param2:Object = null, ... rest) : void
      {
         getInstance().error(param1);
      }
      
      public static function getInstance() : PaperLogger
      {
         if(!instance)
         {
            instance = new PaperLogger();
         }
         return instance;
      }
      
      public static function warning(param1:String, param2:Object = null, ... rest) : void
      {
         getInstance().warning(param1);
      }
      
      public static function info(param1:String, param2:Object = null, ... rest) : void
      {
         getInstance().info(param1);
      }
      
      public function registerLogger(param1:AbstractPaperLogger) : void
      {
         param1.registerWithPaperLogger(this);
      }
      
      public function warning(param1:String, param2:Object = null, ... rest) : void
      {
         var _loc4_:PaperLogVO = null;
         var _loc5_:PaperLoggerEvent = null;
         _loc4_ = new PaperLogVO(LogLevel.WARNING,param1,param2,rest);
         _loc5_ = new PaperLoggerEvent(_loc4_);
         dispatchEvent(_loc5_);
      }
      
      public function log(param1:String, param2:Object = null, ... rest) : void
      {
         var _loc4_:PaperLogVO = null;
         var _loc5_:PaperLoggerEvent = null;
         _loc4_ = new PaperLogVO(LogLevel.LOG,param1,param2,rest);
         _loc5_ = new PaperLoggerEvent(_loc4_);
         dispatchEvent(_loc5_);
      }
      
      public function error(param1:String, param2:Object = null, ... rest) : void
      {
         var _loc4_:PaperLogVO = null;
         var _loc5_:PaperLoggerEvent = null;
         _loc4_ = new PaperLogVO(LogLevel.ERROR,param1,param2,rest);
         _loc5_ = new PaperLoggerEvent(_loc4_);
         dispatchEvent(_loc5_);
      }
      
      public function unregisterLogger(param1:AbstractPaperLogger) : void
      {
         param1.unregisterFromPaperLogger(this);
      }
      
      public function debug(param1:String, param2:Object = null, ... rest) : void
      {
         var _loc4_:PaperLogVO = null;
         var _loc5_:PaperLoggerEvent = null;
         _loc4_ = new PaperLogVO(LogLevel.DEBUG,param1,param2,rest);
         _loc5_ = new PaperLoggerEvent(_loc4_);
         dispatchEvent(_loc5_);
      }
      
      public function info(param1:String, param2:Object = null, ... rest) : void
      {
         var _loc4_:PaperLogVO = null;
         var _loc5_:PaperLoggerEvent = null;
         _loc4_ = new PaperLogVO(LogLevel.INFO,param1,param2,rest);
         _loc5_ = new PaperLoggerEvent(_loc4_);
         dispatchEvent(_loc5_);
      }
   }
}

