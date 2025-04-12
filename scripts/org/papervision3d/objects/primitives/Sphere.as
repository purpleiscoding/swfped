package org.papervision3d.objects.primitives
{
   import org.papervision3d.Papervision3D;
   import org.papervision3d.core.geom.*;
   import org.papervision3d.core.geom.renderables.Triangle3D;
   import org.papervision3d.core.geom.renderables.Vertex3D;
   import org.papervision3d.core.math.NumberUV;
   import org.papervision3d.core.proto.*;
   
   public class Sphere extends TriangleMesh3D
   {
      public static var DEFAULT_RADIUS:Number = 100;
      
      public static var DEFAULT_SCALE:Number = 1;
      
      public static var DEFAULT_SEGMENTSW:Number = 8;
      
      public static var DEFAULT_SEGMENTSH:Number = 6;
      
      public static var MIN_SEGMENTSW:Number = 3;
      
      public static var MIN_SEGMENTSH:Number = 2;
      
      private var segmentsH:Number;
      
      private var segmentsW:Number;
      
      public function Sphere(param1:MaterialObject3D = null, param2:Number = 100, param3:int = 8, param4:int = 6)
      {
         var _loc5_:Number = NaN;
         super(param1,new Array(),new Array(),null);
         this.segmentsW = Math.max(MIN_SEGMENTSW,param3 || DEFAULT_SEGMENTSW);
         this.segmentsH = Math.max(MIN_SEGMENTSH,param4 || DEFAULT_SEGMENTSH);
         if(param2 == 0)
         {
            param2 = DEFAULT_RADIUS;
         }
         _loc5_ = DEFAULT_SCALE;
         buildSphere(param2);
      }
      
      private function buildSphere(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Array = null;
         var _loc15_:Vertex3D = null;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:int = 0;
         var _loc20_:* = false;
         var _loc21_:Vertex3D = null;
         var _loc22_:Vertex3D = null;
         var _loc23_:Vertex3D = null;
         var _loc24_:Vertex3D = null;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:NumberUV = null;
         var _loc30_:NumberUV = null;
         var _loc31_:NumberUV = null;
         var _loc32_:NumberUV = null;
         _loc5_ = Math.max(3,this.segmentsW);
         _loc6_ = Math.max(2,this.segmentsH);
         _loc7_ = this.geometry.vertices;
         _loc8_ = this.geometry.faces;
         _loc9_ = new Array();
         _loc3_ = 0;
         while(_loc3_ < _loc6_ + 1)
         {
            _loc11_ = Number(_loc3_ / _loc6_);
            _loc12_ = -param1 * Math.cos(_loc11_ * Math.PI);
            _loc13_ = param1 * Math.sin(_loc11_ * Math.PI);
            _loc14_ = new Array();
            _loc2_ = 0;
            while(_loc2_ < _loc5_)
            {
               _loc16_ = Number(2 * _loc2_ / _loc5_);
               _loc17_ = _loc13_ * Math.sin(_loc16_ * Math.PI);
               _loc18_ = _loc13_ * Math.cos(_loc16_ * Math.PI);
               if(!((_loc3_ == 0 || _loc3_ == _loc6_) && _loc2_ > 0))
               {
                  _loc15_ = new Vertex3D(_loc18_,_loc12_,_loc17_);
                  _loc7_.push(_loc15_);
               }
               _loc14_.push(_loc15_);
               _loc2_++;
            }
            _loc9_.push(_loc14_);
            _loc3_++;
         }
         _loc10_ = int(_loc9_.length);
         _loc3_ = 0;
         while(_loc3_ < _loc10_)
         {
            _loc19_ = int(_loc9_[_loc3_].length);
            if(_loc3_ > 0)
            {
               _loc2_ = 0;
               while(_loc2_ < _loc19_)
               {
                  _loc20_ = _loc2_ == _loc19_ - 0;
                  _loc21_ = _loc9_[_loc3_][_loc20_ ? 0 : _loc2_];
                  _loc22_ = _loc9_[_loc3_][(_loc2_ == 0 ? _loc19_ : _loc2_) - 1];
                  _loc23_ = _loc9_[_loc3_ - 1][(_loc2_ == 0 ? _loc19_ : _loc2_) - 1];
                  _loc24_ = _loc9_[_loc3_ - 1][_loc20_ ? 0 : _loc2_];
                  _loc25_ = _loc3_ / (_loc10_ - 1);
                  _loc26_ = (_loc3_ - 1) / (_loc10_ - 1);
                  _loc27_ = (_loc2_ + 1) / _loc19_;
                  _loc28_ = _loc2_ / _loc19_;
                  _loc29_ = new NumberUV(_loc27_,_loc26_);
                  _loc30_ = new NumberUV(_loc27_,_loc25_);
                  _loc31_ = new NumberUV(_loc28_,_loc25_);
                  _loc32_ = new NumberUV(_loc28_,_loc26_);
                  if(_loc3_ < _loc9_.length - 1)
                  {
                     _loc8_.push(new Triangle3D(this,new Array(_loc21_,_loc22_,_loc23_),material,new Array(_loc30_,_loc31_,_loc32_)));
                  }
                  if(_loc3_ > 1)
                  {
                     _loc8_.push(new Triangle3D(this,new Array(_loc21_,_loc23_,_loc24_),material,new Array(_loc30_,_loc32_,_loc29_)));
                  }
                  _loc2_++;
               }
            }
            _loc3_++;
         }
         this.geometry.ready = true;
         if(Papervision3D.useRIGHTHANDED)
         {
            this.geometry.flipFaces();
         }
      }
   }
}

