package org.papervision3d.core.render.command
{
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import org.papervision3d.core.geom.renderables.Triangle3D;
   import org.papervision3d.core.geom.renderables.Vertex3DInstance;
   import org.papervision3d.core.math.Matrix3D;
   import org.papervision3d.core.math.Number3D;
   import org.papervision3d.core.proto.MaterialObject3D;
   import org.papervision3d.core.render.data.RenderHitData;
   import org.papervision3d.core.render.data.RenderSessionData;
   import org.papervision3d.core.render.draw.ITriangleDrawer;
   import org.papervision3d.materials.BitmapMaterial;
   import org.papervision3d.materials.MovieMaterial;
   
   public class RenderTriangle extends RenderableListItem implements IRenderListItem
   {
      protected static var resBA:Vertex3DInstance = new Vertex3DInstance();
      
      protected static var resPA:Vertex3DInstance = new Vertex3DInstance();
      
      protected static var resRA:Vertex3DInstance = new Vertex3DInstance();
      
      protected static var vPoint:Vertex3DInstance = new Vertex3DInstance();
      
      public var renderer:ITriangleDrawer;
      
      public var triangle:Triangle3D;
      
      public var container:Sprite;
      
      private var position:Number3D = new Number3D();
      
      protected var vx1:Vertex3DInstance;
      
      public var renderMat:MaterialObject3D;
      
      protected var vx0:Vertex3DInstance;
      
      protected var vPoint:Vertex3DInstance;
      
      protected var vx2:Vertex3DInstance;
      
      public function RenderTriangle(param1:Triangle3D)
      {
         super();
         this.triangle = param1;
         renderableInstance = param1;
         renderable = Triangle3D;
      }
      
      override public function render(param1:RenderSessionData, param2:Graphics) : void
      {
         renderer.drawTriangle(triangle,param2,param1);
      }
      
      override public function hitTestPoint2D(param1:Point, param2:RenderHitData) : RenderHitData
      {
         renderMat = triangle.material;
         if(!renderMat)
         {
            renderMat = triangle.instance.material;
         }
         if(renderMat.interactive)
         {
            vPoint = RenderTriangle.vPoint;
            vPoint.x = param1.x;
            vPoint.y = param1.y;
            vx0 = triangle.v0.vertex3DInstance;
            vx1 = triangle.v1.vertex3DInstance;
            vx2 = triangle.v2.vertex3DInstance;
            if(sameSide(vPoint,vx0,vx1,vx2))
            {
               if(sameSide(vPoint,vx1,vx0,vx2))
               {
                  if(sameSide(vPoint,vx2,vx0,vx1))
                  {
                     return deepHitTest(triangle,vPoint,param2);
                  }
               }
            }
         }
         return param2;
      }
      
      public function sameSide(param1:Vertex3DInstance, param2:Vertex3DInstance, param3:Vertex3DInstance, param4:Vertex3DInstance) : Boolean
      {
         Vertex3DInstance.subTo(param4,param3,resBA);
         Vertex3DInstance.subTo(param1,param3,resPA);
         Vertex3DInstance.subTo(param2,param3,resRA);
         return Vertex3DInstance.cross(resBA,resPA) * Vertex3DInstance.cross(resBA,resRA) >= 0;
      }
      
      private function deepHitTest(param1:Triangle3D, param2:Vertex3DInstance, param3:RenderHitData) : RenderHitData
      {
         var _loc4_:Vertex3DInstance = null;
         var _loc5_:Vertex3DInstance = null;
         var _loc6_:Vertex3DInstance = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Array = null;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc37_:Number = NaN;
         var _loc38_:Number = NaN;
         var _loc39_:BitmapData = null;
         var _loc40_:Number = NaN;
         var _loc41_:Number = NaN;
         var _loc42_:Number = NaN;
         var _loc43_:Number = NaN;
         var _loc44_:MovieMaterial = null;
         var _loc45_:Rectangle = null;
         _loc4_ = param1.v0.vertex3DInstance;
         _loc5_ = param1.v1.vertex3DInstance;
         _loc6_ = param1.v2.vertex3DInstance;
         _loc7_ = _loc6_.x - _loc4_.x;
         _loc8_ = _loc6_.y - _loc4_.y;
         _loc9_ = _loc5_.x - _loc4_.x;
         _loc10_ = _loc5_.y - _loc4_.y;
         _loc11_ = param2.x - _loc4_.x;
         _loc12_ = param2.y - _loc4_.y;
         _loc13_ = _loc7_ * _loc7_ + _loc8_ * _loc8_;
         _loc14_ = _loc7_ * _loc9_ + _loc8_ * _loc10_;
         _loc15_ = _loc7_ * _loc11_ + _loc8_ * _loc12_;
         _loc16_ = _loc9_ * _loc9_ + _loc10_ * _loc10_;
         _loc17_ = _loc9_ * _loc11_ + _loc10_ * _loc12_;
         _loc18_ = 1 / (_loc13_ * _loc16_ - _loc14_ * _loc14_);
         _loc19_ = (_loc16_ * _loc15_ - _loc14_ * _loc17_) * _loc18_;
         _loc20_ = (_loc13_ * _loc17_ - _loc14_ * _loc15_) * _loc18_;
         _loc21_ = param1.v2.x - param1.v0.x;
         _loc22_ = param1.v2.y - param1.v0.y;
         _loc23_ = param1.v2.z - param1.v0.z;
         _loc24_ = param1.v1.x - param1.v0.x;
         _loc25_ = param1.v1.y - param1.v0.y;
         _loc26_ = param1.v1.z - param1.v0.z;
         _loc27_ = param1.v0.x + _loc21_ * _loc19_ + _loc24_ * _loc20_;
         _loc28_ = param1.v0.y + _loc22_ * _loc19_ + _loc25_ * _loc20_;
         _loc29_ = param1.v0.z + _loc23_ * _loc19_ + _loc26_ * _loc20_;
         _loc30_ = param1.uv;
         _loc31_ = Number(_loc30_[0].u);
         _loc32_ = Number(_loc30_[1].u);
         _loc33_ = Number(_loc30_[2].u);
         _loc34_ = Number(_loc30_[0].v);
         _loc35_ = Number(_loc30_[1].v);
         _loc36_ = Number(_loc30_[2].v);
         _loc37_ = (_loc32_ - _loc31_) * _loc20_ + (_loc33_ - _loc31_) * _loc19_ + _loc31_;
         _loc38_ = (_loc35_ - _loc34_) * _loc20_ + (_loc36_ - _loc34_) * _loc19_ + _loc34_;
         if(triangle.material)
         {
            renderMat = param1.material;
         }
         else
         {
            renderMat = param1.instance.material;
         }
         _loc39_ = renderMat.bitmap;
         _loc40_ = 1;
         _loc41_ = 1;
         _loc42_ = 0;
         _loc43_ = 0;
         if(renderMat is MovieMaterial)
         {
            _loc44_ = renderMat as MovieMaterial;
            _loc45_ = _loc44_.rect;
            if(_loc45_)
            {
               _loc42_ = _loc45_.x;
               _loc43_ = _loc45_.y;
               _loc40_ = _loc45_.width;
               _loc41_ = _loc45_.height;
            }
         }
         else if(_loc39_)
         {
            _loc40_ = BitmapMaterial.AUTO_MIP_MAPPING ? renderMat.widthOffset : _loc39_.width;
            _loc41_ = BitmapMaterial.AUTO_MIP_MAPPING ? renderMat.heightOffset : _loc39_.height;
         }
         param3.displayObject3D = param1.instance;
         param3.material = renderMat;
         param3.renderable = param1;
         param3.hasHit = true;
         position.x = _loc27_;
         position.y = _loc28_;
         position.z = _loc29_;
         Matrix3D.multiplyVector(param1.instance.world,position);
         param3.x = position.x;
         param3.y = position.y;
         param3.z = position.z;
         param3.u = _loc37_ * _loc40_ + _loc42_;
         param3.v = _loc41_ - _loc38_ * _loc41_ + _loc43_;
         return param3;
      }
   }
}

