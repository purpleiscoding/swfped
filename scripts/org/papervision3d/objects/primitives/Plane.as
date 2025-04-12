package org.papervision3d.objects.primitives
{
   import org.papervision3d.Papervision3D;
   import org.papervision3d.core.geom.TriangleMesh3D;
   import org.papervision3d.core.geom.renderables.Triangle3D;
   import org.papervision3d.core.geom.renderables.Vertex3D;
   import org.papervision3d.core.math.NumberUV;
   import org.papervision3d.core.proto.MaterialObject3D;
   
   public class Plane extends TriangleMesh3D
   {
      public static var DEFAULT_SIZE:Number = 500;
      
      public static var DEFAULT_SCALE:Number = 1;
      
      public static var DEFAULT_SEGMENTS:Number = 1;
      
      public var segmentsH:Number;
      
      public var segmentsW:Number;
      
      public function Plane(param1:MaterialObject3D = null, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0)
      {
         var _loc6_:Number = NaN;
         super(param1,new Array(),new Array(),null);
         this.segmentsW = param4 || DEFAULT_SEGMENTS;
         this.segmentsH = param5 || this.segmentsW;
         _loc6_ = DEFAULT_SCALE;
         if(!param3)
         {
            if(param2)
            {
               _loc6_ = param2;
            }
            if(Boolean(param1) && Boolean(param1.bitmap))
            {
               param2 = param1.bitmap.width * _loc6_;
               param3 = param1.bitmap.height * _loc6_;
            }
            else
            {
               param2 = DEFAULT_SIZE * _loc6_;
               param3 = DEFAULT_SIZE * _loc6_;
            }
         }
         buildPlane(param2,param3);
      }
      
      private function buildPlane(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:int = 0;
         var _loc14_:NumberUV = null;
         var _loc15_:NumberUV = null;
         var _loc16_:NumberUV = null;
         var _loc17_:int = 0;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Vertex3D = null;
         var _loc21_:Vertex3D = null;
         var _loc22_:Vertex3D = null;
         _loc3_ = this.segmentsW;
         _loc4_ = this.segmentsH;
         _loc5_ = _loc3_ + 1;
         _loc6_ = _loc4_ + 1;
         _loc7_ = this.geometry.vertices;
         _loc8_ = this.geometry.faces;
         _loc9_ = param1 / 2;
         _loc10_ = param2 / 2;
         _loc11_ = param1 / _loc3_;
         _loc12_ = param2 / _loc4_;
         _loc13_ = 0;
         while(_loc13_ < _loc3_ + 1)
         {
            _loc17_ = 0;
            while(_loc17_ < _loc6_)
            {
               _loc18_ = _loc13_ * _loc11_ - _loc9_;
               _loc19_ = _loc17_ * _loc12_ - _loc10_;
               _loc7_.push(new Vertex3D(_loc18_,_loc19_,0));
               _loc17_++;
            }
            _loc13_++;
         }
         _loc13_ = 0;
         while(_loc13_ < _loc3_)
         {
            _loc17_ = 0;
            while(_loc17_ < _loc4_)
            {
               _loc20_ = _loc7_[_loc13_ * _loc6_ + _loc17_];
               _loc21_ = _loc7_[_loc13_ * _loc6_ + (_loc17_ + 1)];
               _loc22_ = _loc7_[(_loc13_ + 1) * _loc6_ + _loc17_];
               _loc14_ = new NumberUV(_loc13_ / _loc3_,_loc17_ / _loc4_);
               _loc15_ = new NumberUV(_loc13_ / _loc3_,(_loc17_ + 1) / _loc4_);
               _loc16_ = new NumberUV((_loc13_ + 1) / _loc3_,_loc17_ / _loc4_);
               _loc8_.push(new Triangle3D(this,[_loc20_,_loc22_,_loc21_],material,[_loc14_,_loc16_,_loc15_]));
               _loc20_ = _loc7_[(_loc13_ + 1) * _loc6_ + (_loc17_ + 1)];
               _loc21_ = _loc7_[(_loc13_ + 1) * _loc6_ + _loc17_];
               _loc22_ = _loc7_[_loc13_ * _loc6_ + (_loc17_ + 1)];
               _loc14_ = new NumberUV((_loc13_ + 1) / _loc3_,(_loc17_ + 1) / _loc4_);
               _loc15_ = new NumberUV((_loc13_ + 1) / _loc3_,_loc17_ / _loc4_);
               _loc16_ = new NumberUV(_loc13_ / _loc3_,(_loc17_ + 1) / _loc4_);
               _loc8_.push(new Triangle3D(this,[_loc20_,_loc22_,_loc21_],material,[_loc14_,_loc16_,_loc15_]));
               _loc17_++;
            }
            _loc13_++;
         }
         this.geometry.ready = true;
         if(Papervision3D.useRIGHTHANDED)
         {
            this.geometry.flipFaces();
         }
      }
   }
}

