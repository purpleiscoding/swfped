package org.papervision3d.core.geom
{
   import flash.utils.Dictionary;
   import org.papervision3d.core.culling.ITriangleCuller;
   import org.papervision3d.core.geom.renderables.Triangle3D;
   import org.papervision3d.core.geom.renderables.Triangle3DInstance;
   import org.papervision3d.core.geom.renderables.Vertex3D;
   import org.papervision3d.core.geom.renderables.Vertex3DInstance;
   import org.papervision3d.core.math.NumberUV;
   import org.papervision3d.core.proto.*;
   import org.papervision3d.core.render.command.RenderTriangle;
   import org.papervision3d.core.render.data.RenderSessionData;
   import org.papervision3d.core.render.draw.ITriangleDrawer;
   import org.papervision3d.objects.DisplayObject3D;
   
   public class TriangleMesh3D extends Vertices3D
   {
      public function TriangleMesh3D(param1:MaterialObject3D, param2:Array, param3:Array, param4:String = null)
      {
         super(param2,param4);
         this.geometry.faces = param3 || new Array();
         this.material = param1 || MaterialObject3D.DEFAULT;
      }
      
      override public function project(param1:DisplayObject3D, param2:RenderSessionData) : Number
      {
         var _loc3_:Array = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:ITriangleCuller = null;
         var _loc7_:Vertex3DInstance = null;
         var _loc8_:Vertex3DInstance = null;
         var _loc9_:Vertex3DInstance = null;
         var _loc10_:Triangle3DInstance = null;
         var _loc11_:Triangle3D = null;
         var _loc12_:MaterialObject3D = null;
         var _loc13_:RenderTriangle = null;
         super.project(param1,param2);
         if(!this.culled)
         {
            _loc3_ = this.geometry.faces;
            _loc4_ = 0;
            _loc5_ = 0;
            _loc6_ = param2.triangleCuller;
            for each(_loc11_ in _loc3_)
            {
               _loc12_ = !!_loc11_.material ? _loc11_.material : material;
               _loc10_ = _loc11_.face3DInstance;
               _loc7_ = _loc11_.v0.vertex3DInstance;
               _loc8_ = _loc11_.v1.vertex3DInstance;
               _loc9_ = _loc11_.v2.vertex3DInstance;
               if(_loc10_.visible = _loc6_.testFace(_loc11_,_loc7_,_loc8_,_loc9_))
               {
                  _loc4_ += _loc10_.screenZ = (_loc7_.z + _loc8_.z + _loc9_.z) / 3;
                  _loc13_ = _loc11_.renderCommand;
                  _loc5_++;
                  _loc13_.renderer = _loc12_ as ITriangleDrawer;
                  _loc13_.screenDepth = _loc10_.screenZ;
                  param2.renderer.addToRenderList(_loc13_);
               }
               else
               {
                  ++param2.renderStatistics.culledTriangles;
               }
            }
            return this.screenZ = _loc4_ / _loc5_;
         }
         ++param2.renderStatistics.culledObjects;
         return 0;
      }
      
      public function mergeVertices() : void
      {
         var _loc1_:Dictionary = null;
         var _loc2_:Array = null;
         var _loc3_:Vertex3D = null;
         var _loc4_:Triangle3D = null;
         var _loc5_:Vertex3D = null;
         _loc1_ = new Dictionary();
         _loc2_ = new Array();
         for each(_loc3_ in this.geometry.vertices)
         {
            for each(_loc5_ in _loc1_)
            {
               if(_loc3_.x == _loc5_.x && _loc3_.y == _loc5_.y && _loc3_.z == _loc5_.z)
               {
                  _loc1_[_loc3_] = _loc5_;
                  break;
               }
            }
            if(!_loc1_[_loc3_])
            {
               _loc1_[_loc3_] = _loc3_;
               _loc2_.push(_loc3_);
            }
         }
         this.geometry.vertices = _loc2_;
         for each(_loc4_ in geometry.faces)
         {
            _loc4_.v0 = _loc1_[_loc4_.v0];
            _loc4_.v1 = _loc1_[_loc4_.v1];
            _loc4_.v2 = _loc1_[_loc4_.v2];
         }
      }
      
      override public function clone() : DisplayObject3D
      {
         var _loc1_:DisplayObject3D = null;
         var _loc2_:TriangleMesh3D = null;
         _loc1_ = super.clone();
         _loc2_ = new TriangleMesh3D(this.material,[],[],_loc1_.name);
         if(this.materials)
         {
            _loc2_.materials = this.materials.clone();
         }
         if(_loc1_.geometry)
         {
            _loc2_.geometry = _loc1_.geometry.clone(_loc2_);
         }
         _loc2_.copyTransform(this.transform);
         return _loc2_;
      }
      
      override public function set material(param1:MaterialObject3D) : void
      {
         var _loc2_:Triangle3D = null;
         super.material = param1;
         for each(_loc2_ in geometry.faces)
         {
            _loc2_.material = param1;
         }
      }
      
      public function quarterFaces() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:Triangle3D = null;
         var _loc5_:int = 0;
         var _loc6_:Vertex3D = null;
         var _loc7_:Vertex3D = null;
         var _loc8_:Vertex3D = null;
         var _loc9_:Vertex3D = null;
         var _loc10_:Vertex3D = null;
         var _loc11_:Vertex3D = null;
         var _loc12_:NumberUV = null;
         var _loc13_:NumberUV = null;
         var _loc14_:NumberUV = null;
         var _loc15_:NumberUV = null;
         var _loc16_:NumberUV = null;
         var _loc17_:NumberUV = null;
         var _loc18_:Triangle3D = null;
         var _loc19_:Triangle3D = null;
         var _loc20_:Triangle3D = null;
         var _loc21_:Triangle3D = null;
         _loc1_ = new Array();
         _loc2_ = new Array();
         _loc3_ = this.geometry.faces;
         _loc5_ = int(_loc3_.length);
         while(true)
         {
            _loc4_ = _loc3_[--_loc5_];
            if(!_loc4_)
            {
               break;
            }
            _loc6_ = _loc4_.v0;
            _loc7_ = _loc4_.v1;
            _loc8_ = _loc4_.v2;
            _loc9_ = new Vertex3D((_loc6_.x + _loc7_.x) / 2,(_loc6_.y + _loc7_.y) / 2,(_loc6_.z + _loc7_.z) / 2);
            _loc10_ = new Vertex3D((_loc7_.x + _loc8_.x) / 2,(_loc7_.y + _loc8_.y) / 2,(_loc7_.z + _loc8_.z) / 2);
            _loc11_ = new Vertex3D((_loc8_.x + _loc6_.x) / 2,(_loc8_.y + _loc6_.y) / 2,(_loc8_.z + _loc6_.z) / 2);
            this.geometry.vertices.push(_loc9_,_loc10_,_loc11_);
            _loc12_ = _loc4_.uv[0];
            _loc13_ = _loc4_.uv[1];
            _loc14_ = _loc4_.uv[2];
            _loc15_ = new NumberUV((_loc12_.u + _loc13_.u) / 2,(_loc12_.v + _loc13_.v) / 2);
            _loc16_ = new NumberUV((_loc13_.u + _loc14_.u) / 2,(_loc13_.v + _loc14_.v) / 2);
            _loc17_ = new NumberUV((_loc14_.u + _loc12_.u) / 2,(_loc14_.v + _loc12_.v) / 2);
            _loc18_ = new Triangle3D(this,[_loc6_,_loc9_,_loc11_],_loc4_.material,[_loc12_,_loc15_,_loc17_]);
            _loc19_ = new Triangle3D(this,[_loc9_,_loc7_,_loc10_],_loc4_.material,[_loc15_,_loc13_,_loc16_]);
            _loc20_ = new Triangle3D(this,[_loc11_,_loc10_,_loc8_],_loc4_.material,[_loc17_,_loc16_,_loc14_]);
            _loc21_ = new Triangle3D(this,[_loc9_,_loc10_,_loc11_],_loc4_.material,[_loc15_,_loc16_,_loc17_]);
            _loc2_.push(_loc18_,_loc19_,_loc20_,_loc21_);
         }
         this.geometry.faces = _loc2_;
         this.mergeVertices();
         this.geometry.ready = true;
      }
      
      public function projectTexture(param1:String = "x", param2:String = "y") : void
      {
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:MaterialObject3D = null;
         var _loc10_:String = null;
         var _loc11_:Triangle3D = null;
         var _loc12_:Array = null;
         var _loc13_:Vertex3D = null;
         var _loc14_:Vertex3D = null;
         var _loc15_:Vertex3D = null;
         var _loc16_:NumberUV = null;
         var _loc17_:NumberUV = null;
         var _loc18_:NumberUV = null;
         _loc3_ = this.geometry.faces;
         _loc4_ = this.boundingBox();
         _loc5_ = Number(_loc4_.min[param1]);
         _loc6_ = Number(_loc4_.size[param1]);
         _loc7_ = Number(_loc4_.min[param2]);
         _loc8_ = Number(_loc4_.size[param2]);
         _loc9_ = this.material;
         for(_loc10_ in _loc3_)
         {
            _loc11_ = _loc3_[Number(_loc10_)];
            _loc12_ = _loc11_.vertices;
            _loc13_ = _loc12_[0];
            _loc14_ = _loc12_[1];
            _loc15_ = _loc12_[2];
            _loc16_ = new NumberUV((_loc13_[param1] - _loc5_) / _loc6_,(_loc13_[param2] - _loc7_) / _loc8_);
            _loc17_ = new NumberUV((_loc14_[param1] - _loc5_) / _loc6_,(_loc14_[param2] - _loc7_) / _loc8_);
            _loc18_ = new NumberUV((_loc15_[param1] - _loc5_) / _loc6_,(_loc15_[param2] - _loc7_) / _loc8_);
            _loc11_.uv = [_loc16_,_loc17_,_loc18_];
         }
      }
   }
}

