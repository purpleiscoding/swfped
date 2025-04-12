package org.papervision3d.materials.special
{
   import flash.display.Graphics;
   import flash.geom.Rectangle;
   import org.papervision3d.core.geom.renderables.Particle;
   import org.papervision3d.core.log.PaperLogger;
   import org.papervision3d.core.proto.MaterialObject3D;
   import org.papervision3d.core.render.data.RenderSessionData;
   import org.papervision3d.core.render.draw.IParticleDrawer;
   
   public class ParticleMaterial extends MaterialObject3D implements IParticleDrawer
   {
      public static var SHAPE_SQUARE:int = 0;
      
      public static var SHAPE_CIRCLE:int = 1;
      
      public var shape:int;
      
      public function ParticleMaterial(param1:Number, param2:Number, param3:int = 0)
      {
         super();
         this.shape = param3;
         this.fillAlpha = param2;
         this.fillColor = param1;
      }
      
      public function updateRenderRect(param1:Particle) : void
      {
         var _loc2_:Rectangle = null;
         _loc2_ = param1.renderRect;
         if(param1.size == 0)
         {
            _loc2_.width = 1;
            _loc2_.height = 1;
         }
         else
         {
            _loc2_.width = param1.renderScale * param1.size;
            _loc2_.height = param1.renderScale * param1.size;
         }
         _loc2_.x = param1.vertex3D.vertex3DInstance.x - _loc2_.width / 2;
         _loc2_.y = param1.vertex3D.vertex3DInstance.y - _loc2_.width / 2;
      }
      
      public function drawParticle(param1:Particle, param2:Graphics, param3:RenderSessionData) : void
      {
         var _loc4_:Rectangle = null;
         param2.beginFill(fillColor,fillAlpha);
         _loc4_ = param1.renderRect;
         if(shape == SHAPE_SQUARE)
         {
            param2.drawRect(_loc4_.x,_loc4_.y,_loc4_.width,_loc4_.height);
         }
         else if(shape == SHAPE_CIRCLE)
         {
            param2.drawCircle(_loc4_.x + _loc4_.width / 2,_loc4_.y + _loc4_.width / 2,_loc4_.width / 2);
         }
         else
         {
            PaperLogger.warning("Particle material has no valid shape - Must be ParticleMaterial.SHAPE_SQUARE or ParticleMaterial.SHAPE_CIRCLE");
         }
         param2.endFill();
         ++param3.renderStatistics.particles;
      }
   }
}

