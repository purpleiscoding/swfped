package org.papervision3d.core.render.command
{
   import flash.display.Graphics;
   import flash.geom.Point;
   import org.papervision3d.core.geom.renderables.Line3D;
   import org.papervision3d.core.math.Number2D;
   import org.papervision3d.core.math.Number3D;
   import org.papervision3d.core.render.data.RenderHitData;
   import org.papervision3d.core.render.data.RenderSessionData;
   import org.papervision3d.materials.special.LineMaterial;
   
   public class RenderLine extends RenderableListItem implements IRenderListItem
   {
      private static var lineVector:Number3D = Number3D.ZERO;
      
      private static var mouseVector:Number3D = Number3D.ZERO;
      
      public var renderer:LineMaterial;
      
      private var l1:Number2D;
      
      private var l2:Number2D;
      
      public var line:Line3D;
      
      private var v:Number2D;
      
      private var cp3d:Number3D;
      
      private var p:Number2D;
      
      public function RenderLine(param1:Line3D)
      {
         super();
         this.renderable = Line3D;
         this.renderableInstance = param1;
         this.line = param1;
         p = new Number2D();
         l1 = new Number2D();
         l2 = new Number2D();
         v = new Number2D();
         cp3d = new Number3D();
      }
      
      override public function render(param1:RenderSessionData, param2:Graphics) : void
      {
         renderer.drawLine(line,param2,param1);
      }
      
      override public function hitTestPoint2D(param1:Point, param2:RenderHitData) : RenderHitData
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(renderer.interactive)
         {
            _loc3_ = line.size;
            p.reset(param1.x,param1.y);
            l1.reset(line.v0.vertex3DInstance.x,line.v0.vertex3DInstance.y);
            l2.reset(line.v1.vertex3DInstance.x,line.v1.vertex3DInstance.y);
            v.copyFrom(l2);
            v.minusEq(l1);
            _loc4_ = ((p.x - l1.x) * (l2.x - l1.x) + (p.y - l1.y) * (l2.y - l1.y)) / (v.x * v.x + v.y * v.y);
            if(_loc4_ > 0 && _loc4_ < 1)
            {
               v.multiplyEq(_loc4_);
               v.plusEq(l1);
               v.minusEq(p);
               _loc5_ = v.x * v.x + v.y * v.y;
               if(_loc5_ < _loc3_ * _loc3_)
               {
                  param2.displayObject3D = line.instance;
                  param2.material = renderer;
                  param2.renderable = line;
                  param2.hasHit = true;
                  cp3d.reset(line.v1.x - line.v0.x,line.v1.y - line.v0.y,line.v1.x - line.v0.x);
                  cp3d.x *= _loc4_;
                  cp3d.y *= _loc4_;
                  cp3d.z *= _loc4_;
                  cp3d.x += line.v0.x;
                  cp3d.y += line.v0.y;
                  cp3d.z += line.v0.z;
                  param2.x = cp3d.x;
                  param2.y = cp3d.y;
                  param2.z = cp3d.z;
                  param2.u = 0;
                  param2.v = 0;
                  return param2;
               }
            }
         }
         return param2;
      }
   }
}

