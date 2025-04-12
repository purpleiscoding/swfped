package org.papervision3d.objects.primitives
{
   import org.papervision3d.Papervision3D;
   import org.papervision3d.core.geom.*;
   import org.papervision3d.core.geom.renderables.Triangle3D;
   import org.papervision3d.core.geom.renderables.Vertex3D;
   import org.papervision3d.core.math.NumberUV;
   import org.papervision3d.core.proto.*;
   
   public class Cylinder extends TriangleMesh3D
   {
      public static const DEFAULT_RADIUS:Number = 100;
      
      public static const DEFAULT_HEIGHT:Number = 100;
      
      public static const DEFAULT_SCALE:Number = 1;
      
      public static const DEFAULT_SEGMENTSW:Number = 8;
      
      public static const DEFAULT_SEGMENTSH:Number = 6;
      
      public static const MIN_SEGMENTSW:Number = 3;
      
      public static const MIN_SEGMENTSH:Number = 1;
      
      public var segmentsH:Number;
      
      public var segmentsW:Number;
      
      public function Cylinder(param1:MaterialObject3D = null, param2:Number = 100, param3:Number = 100, param4:int = 8, param5:int = 6, param6:Number = -1, param7:Boolean = true, param8:Boolean = true)
      {
         var _loc9_:Number = NaN;
         super(param1,new Array(),new Array(),null);
         this.segmentsW = Math.max(MIN_SEGMENTSW,param4 || DEFAULT_SEGMENTSW);
         this.segmentsH = Math.max(MIN_SEGMENTSH,param5 || DEFAULT_SEGMENTSH);
         if(param2 == 0)
         {
            param2 = DEFAULT_RADIUS;
         }
         if(param3 == 0)
         {
            param3 = DEFAULT_HEIGHT;
         }
         if(param6 == -1)
         {
            param6 = param2;
         }
         _loc9_ = DEFAULT_SCALE;
         buildCylinder(param2,param3,param6,param7,param8);
      }
      
      private function buildCylinder(param1:Number, param2:Number, param3:Number, param4:Boolean, param5:Boolean) : void
      {
         var _loc6_:MaterialObject3D = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Array = null;
         var _loc13_:Array = null;
         var _loc14_:Array = null;
         var _loc15_:int = 0;
         var _loc16_:NumberUV = null;
         var _loc17_:NumberUV = null;
         var _loc18_:NumberUV = null;
         var _loc19_:NumberUV = null;
         var _loc20_:Vertex3D = null;
         var _loc21_:Vertex3D = null;
         var _loc22_:Vertex3D = null;
         var _loc23_:Vertex3D = null;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Array = null;
         var _loc28_:Vertex3D = null;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:Number = NaN;
         var _loc32_:int = 0;
         var _loc33_:* = false;
         var _loc34_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc37_:Number = NaN;
         var _loc38_:int = 0;
         var _loc39_:* = false;
         _loc6_ = material;
         _loc10_ = Math.max(MIN_SEGMENTSW,this.segmentsW);
         _loc11_ = Math.max(MIN_SEGMENTSH,this.segmentsH);
         _loc12_ = this.geometry.vertices;
         _loc13_ = this.geometry.faces;
         _loc14_ = new Array();
         _loc8_ = 0;
         while(_loc8_ < _loc11_ + 1)
         {
            _loc24_ = Number(_loc8_ / _loc11_);
            _loc25_ = param2 * (_loc8_ / (_loc11_ + 0)) - param2 / 2;
            _loc26_ = param3 + (param1 - param3) * (1 - _loc8_ / _loc11_);
            _loc27_ = new Array();
            _loc7_ = 0;
            while(_loc7_ < _loc10_)
            {
               _loc29_ = Number(2 * _loc7_ / _loc10_);
               _loc30_ = _loc26_ * Math.sin(_loc29_ * Math.PI);
               _loc31_ = _loc26_ * Math.cos(_loc29_ * Math.PI);
               _loc28_ = new Vertex3D(_loc31_,_loc25_,_loc30_);
               _loc12_.push(_loc28_);
               _loc27_.push(_loc28_);
               _loc7_++;
            }
            _loc14_.push(_loc27_);
            _loc8_++;
         }
         _loc15_ = int(_loc14_.length);
         _loc8_ = 0;
         while(_loc8_ < _loc15_)
         {
            _loc32_ = int(_loc14_[_loc8_].length);
            _loc7_ = 0;
            while(_loc7_ < _loc32_)
            {
               if(_loc8_ > 0 && _loc7_ >= 0)
               {
                  _loc33_ = _loc7_ == _loc32_ - 0;
                  _loc20_ = _loc14_[_loc8_][_loc33_ ? 0 : _loc7_];
                  _loc21_ = _loc14_[_loc8_][(_loc7_ == 0 ? _loc32_ : _loc7_) - 1];
                  _loc22_ = _loc14_[_loc8_ - 1][(_loc7_ == 0 ? _loc32_ : _loc7_) - 1];
                  _loc23_ = _loc14_[_loc8_ - 1][_loc33_ ? 0 : _loc7_];
                  _loc34_ = _loc8_ / _loc15_;
                  _loc35_ = (_loc8_ - 1) / _loc15_;
                  _loc36_ = (_loc7_ + 1) / _loc32_;
                  _loc37_ = _loc7_ / _loc32_;
                  _loc16_ = new NumberUV(_loc36_,_loc35_);
                  _loc17_ = new NumberUV(_loc36_,_loc34_);
                  _loc18_ = new NumberUV(_loc37_,_loc34_);
                  _loc19_ = new NumberUV(_loc37_,_loc35_);
                  _loc13_.push(new Triangle3D(this,[_loc20_,_loc21_,_loc22_],_loc6_,[_loc17_,_loc18_,_loc19_]));
                  _loc13_.push(new Triangle3D(this,[_loc20_,_loc22_,_loc23_],_loc6_,[_loc17_,_loc19_,_loc16_]));
               }
               _loc7_++;
            }
            if(_loc8_ == 0 || _loc8_ == _loc15_ - 1)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc32_ - 2)
               {
                  _loc38_ = Math.floor(_loc7_ / 2);
                  _loc20_ = _loc14_[_loc8_][_loc38_];
                  _loc21_ = _loc7_ % 2 == 0 ? _loc14_[_loc8_][_loc32_ - 2 - _loc38_] : _loc14_[_loc8_][_loc38_ + 1];
                  _loc22_ = _loc7_ % 2 == 0 ? _loc14_[_loc8_][_loc32_ - 1 - _loc38_] : _loc14_[_loc8_][_loc32_ - 2 - _loc38_];
                  _loc39_ = _loc8_ == 0;
                  _loc17_ = new NumberUV((_loc39_ ? 1 : 0) + (_loc39_ ? -1 : 1) * (_loc20_.x / param1 / 2 + 0.5),_loc20_.z / param1 / 2 + 0.5);
                  _loc18_ = new NumberUV((_loc39_ ? 1 : 0) + (_loc39_ ? -1 : 1) * (_loc21_.x / param1 / 2 + 0.5),_loc21_.z / param1 / 2 + 0.5);
                  _loc19_ = new NumberUV((_loc39_ ? 1 : 0) + (_loc39_ ? -1 : 1) * (_loc22_.x / param1 / 2 + 0.5),_loc22_.z / param1 / 2 + 0.5);
                  _loc7_++;
               }
            }
            _loc8_++;
         }
         this.geometry.ready = true;
         if(Papervision3D.useRIGHTHANDED)
         {
            this.geometry.flipFaces();
         }
      }
   }
}

