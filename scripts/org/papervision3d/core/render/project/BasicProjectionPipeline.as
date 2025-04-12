package org.papervision3d.core.render.project
{
   import org.papervision3d.core.render.data.RenderSessionData;
   import org.papervision3d.objects.DisplayObject3D;
   
   public class BasicProjectionPipeline extends ProjectionPipeline
   {
      public function BasicProjectionPipeline()
      {
         super();
         init();
      }
      
      protected function init() : void
      {
      }
      
      protected function projectObject(param1:DisplayObject3D, param2:RenderSessionData) : void
      {
         param1.project(param2.camera,param2);
      }
      
      override public function project(param1:RenderSessionData) : void
      {
         var _loc2_:Array = null;
         var _loc3_:DisplayObject3D = null;
         var _loc4_:Number = NaN;
         param1.camera.transformView();
         _loc2_ = param1.renderObjects;
         _loc4_ = _loc2_.length;
         if(param1.camera.useProjectionMatrix)
         {
            for each(_loc3_ in _loc2_)
            {
               if(_loc3_.visible)
               {
                  if(param1.viewPort.viewportObjectFilter)
                  {
                     if(param1.viewPort.viewportObjectFilter.testObject(_loc3_))
                     {
                        projectObject(_loc3_,param1);
                     }
                     else
                     {
                        ++param1.renderStatistics.filteredObjects;
                     }
                  }
                  else
                  {
                     projectObject(_loc3_,param1);
                  }
               }
            }
         }
         else
         {
            for each(_loc3_ in _loc2_)
            {
               if(_loc3_.visible)
               {
                  if(param1.viewPort.viewportObjectFilter)
                  {
                     if(param1.viewPort.viewportObjectFilter.testObject(_loc3_))
                     {
                        projectObject(_loc3_,param1);
                     }
                     else
                     {
                        ++param1.renderStatistics.filteredObjects;
                     }
                  }
                  else
                  {
                     projectObject(_loc3_,param1);
                  }
               }
            }
         }
      }
   }
}

